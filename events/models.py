import uuid
import qrcode
from io import BytesIO
from django.core.files.base import ContentFile
from django.db import models
from django.conf import settings
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver


class Event(models.Model):
    CATEGORY_CHOICES = [
        ('tech', 'Tech'),
        ('business', 'Business'),
        ('education', 'Education'),
    ]

    title = models.CharField(max_length=200)
    description = models.TextField()
    location = models.CharField(max_length=200)
    date = models.DateTimeField()
    category = models.CharField(max_length=20, choices=CATEGORY_CHOICES, default='tech', blank=True)
    image = models.ImageField(upload_to='event_images/', default='default_event.jpg', blank=True, null=True)

    # 💰 Ticket Pricing
    price_vip = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    price_regular = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)

    # 📌 Capacity Limit
    capacity = models.PositiveIntegerField(default=100)

    def __str__(self):
        return self.title


class Ticket(models.Model):
    PAYMENT_STATUS_CHOICES = [
        ('Pending', 'Pending'),
        ('Completed', 'Completed'),
        ('Failed', 'Failed'),
    ]

    event = models.ForeignKey(Event, on_delete=models.CASCADE)
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    ticket_type = models.CharField(max_length=50, choices=[('VIP', 'VIP'), ('Regular', 'Regular')])
    price = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)  
    issued_at = models.DateTimeField(auto_now_add=True)
    qr_code = models.ImageField(upload_to="qrcodes/", blank=True, null=True)
    ticket_id = models.UUIDField(default=uuid.uuid4, editable=False, unique=True)
    payment_status = models.CharField(max_length=20, choices=PAYMENT_STATUS_CHOICES, default='Pending')  # ✅ Added payment tracking

    def __str__(self):
        return f"{self.user.username} - {self.event.title} ({self.ticket_type})"

    def generate_qr_code(self):
        """Generate QR Code for Ticket"""
        qr_content = f"Ticket ID: {self.ticket_id}\nEvent: {self.event.title}\nUser: {self.user.username}\nType: {self.ticket_type}"
        qr = qrcode.make(qr_content)
        qr_io = BytesIO()
        qr.save(qr_io, format="PNG")
        self.qr_code.save(f"ticket_{self.ticket_id}.png", ContentFile(qr_io.getvalue()), save=False)

    def save(self, *args, **kwargs):
        """Auto-set price & QR code before saving"""
        if self.price is None:  
            self.price = self.event.price_vip if self.ticket_type == "VIP" else self.event.price_regular

        super().save(*args, **kwargs)

        if not self.qr_code:  # ✅ Generate QR code if not already generated
            self.generate_qr_code()
            self.save()


class Registration(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="registrations")
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name="registrations")
    registered_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"✅ {self.user.username} - {self.event.title} (Registered)"


class Waitlist(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="waitlist")
    event = models.ForeignKey(Event, on_delete=models.CASCADE, related_name="waitlist")
    joined_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"⏳ {self.user.username} - {self.event.title} (Waitlisted)"


class Payment(models.Model):
    """💳 Simulated Payment Model"""
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    ticket = models.OneToOneField(Ticket, on_delete=models.CASCADE, related_name="payment")
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=20, choices=[('Pending', 'Pending'), ('Completed', 'Completed')], default='Pending')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"💰 Payment: {self.user.username} - {self.ticket.event.title} - {self.amount} ({self.status})"


### 🚀 Auto-Move Waitlist → Registration if Space Available
@receiver(post_save, sender=Registration)
def move_from_waitlist(sender, instance, **kwargs):
    event = instance.event
    registered_count = Registration.objects.filter(event=event).count()

    if registered_count < event.capacity:
        waitlisted_users = Waitlist.objects.filter(event=event).order_by("joined_at")
        if waitlisted_users.exists():
            next_user = waitlisted_users.first()
            Registration.objects.create(user=next_user.user, event=event)
            next_user.delete()
