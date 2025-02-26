from celery import shared_task
from django.core.mail import send_mail

@shared_task
def send_event_reminder(email, event_id):
    subject = "Event Reminder"
    message = f"Reminder: Your event with ID {event_id} is happening soon!"
    send_mail(subject, message, "noreply@example.com", [email])
