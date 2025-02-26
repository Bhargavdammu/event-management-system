from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.utils.timezone import now
from .models import Event, Registration, Ticket, Waitlist
from .forms import EventForm, RegistrationForm
from django.contrib.auth import authenticate, login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import get_user_model
from django.shortcuts import render, get_object_or_404
from django.utils import timezone
from django.utils.dateparse import parse_date
from django.contrib.auth.forms import UserCreationForm
from users.forms import CustomUserCreationForm

from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Event, Ticket, Payment
from decimal import Decimal

from django.http import JsonResponse
User = get_user_model()  # ✅ This ensures we use 'users.CustomUser' instead of 'auth.User'


# 🟢 Display all events
def event_list(request):
    events = Event.objects.all()

    # Get filter values from the request
    search_query = request.GET.get('search', '')
    category = request.GET.get('category', '')
    date = request.GET.get('date', '')

    # Apply filters
    if search_query:
        events = events.filter(title__icontains=search_query)
    
    if category:
        events = events.filter(category=category)

    if date:
        parsed_date = parse_date(date)
        if parsed_date:
            events = events.filter(date__date=parsed_date)

    return render(request, 'events/event_list.html', {'events': events})
# 🟢 Display event details
@login_required
def event_detail(request, event_id):
    event = get_object_or_404(Event, id=event_id)
    registered = Registration.objects.filter(user=request.user, event=event).exists()
    
    ticket = None
    if registered:
        ticket = Ticket.objects.filter(user=request.user, event=event).first()  # Get the user's ticket
    
    return render(request, "events/event_detail.html", {"event": event, "registered": registered, "ticket": ticket})


# 🟢 Register for an event
@login_required
def register_for_event(request, event_id):
    event = get_object_or_404(Event, id=event_id)

    # Prevent duplicate registrations
    if Registration.objects.filter(user=request.user, event=event).exists():
        messages.warning(request, "You are already registered for this event.")
        return redirect('event_detail', event_id=event.id)

    # Save registration
    Registration.objects.create(user=request.user, event=event)
    messages.success(request, f"Successfully registered for {event.title}!")

    return redirect('event_detail', event_id=event.id)

# 🟢 Show user-created and registered events
@login_required
def my_events(request):
    created_events = Event.objects.filter(created_by=request.user)
    registrations = Registration.objects.select_related('event').filter(user=request.user)

    return render(request, 'events/my_events.html', {
        'created_events': created_events,
        'registrations': registrations,
    })


# 🟢 Create a new event
@login_required
def create_event(request):
    if request.method == "POST":
        form = EventForm(request.POST, request.FILES)
        if form.is_valid():
            event = form.save(commit=False)
            event.created_by = request.user
            event.save()
            messages.success(request, f"Event '{event.title}' created successfully!")
            return redirect('event_list')
    else:
        form = EventForm()
    
    return render(request, 'events/event_form.html', {'form': form})

# 🟢 Edit an event
@login_required
def edit_event(request, event_id):
    event = get_object_or_404(Event, id=event_id, created_by=request.user)
    
    if request.method == "POST":
        form = EventForm(request.POST, request.FILES, instance=event)
        if form.is_valid():
            form.save()
            messages.success(request, "Event updated successfully!")
            return redirect('event_detail', event_id=event.id)
    else:
        form = EventForm(instance=event)

    return render(request, 'events/event_form.html', {'form': form, 'edit_mode': True})

# 🟢 Delete an event
@login_required
def delete_event(request, event_id):
    """Allow event creators to delete their events."""
    event = get_object_or_404(Event, id=event_id, created_by=request.user)

    event.delete()
    messages.success(request, "Event deleted successfully.")
    return redirect('event_list')

# 🟢 User Dashboard
@login_required
def user_dashboard(request):
    user = request.user
    upcoming_events = Event.objects.filter(registrations__user=user, date__gte=timezone.now())
    past_events = Event.objects.filter(registrations__user=user, date__lt=timezone.now())

    return render(request, 'events/user_dashboard.html', {
        'upcoming_events': upcoming_events,
        'past_events': past_events
    })

# 🟢 User Registration
def register(request):
    """User Registration View"""
    if request.method == "POST":
        form = RegistrationForm(request.POST)
        if form.is_valid():
            password1 = form.cleaned_data["password1"]
            password2 = form.cleaned_data["password2"]

            if password1 != password2:
                messages.error(request, "Passwords do not match.")
            else:
                user = form.save(commit=False)  # ✅ This now correctly references CustomUser
                user.set_password(password1)  # Hash the password
                user.save()
                login(request, user)  # Automatically log in the user after registration
                return redirect("event_list")
    else:
        form = RegistrationForm()

    return render(request, "registration/register.html", {"form": form})

# 🟢 User Login
def user_login(request):
    """User Login View"""
    if request.method == "POST":
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = authenticate(
                request,
                username=form.cleaned_data["username"],
                password=form.cleaned_data["password"],
            )
            if user:
                login(request, user)
                return redirect("event_list")
            messages.error(request, "Invalid username or password.")
    else:
        form = AuthenticationForm()
    
    return render(request, "registration/login.html", {"form": form})

def ticket_detail(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    return render(request, "events/ticket_detail.html", {"ticket": ticket})

def cancel_registration(request, event_id):
    """Cancel a user's registration for an event"""
    registration = get_object_or_404(Registration, event_id=event_id, user=request.user)
    registration.delete()
    return redirect("user_dashboard") 

def fake_payment(request, ticket_id):
    ticket = get_object_or_404(Ticket, id=ticket_id)
    ticket.is_paid = True  # Mark ticket as paid
    ticket.save()
    return redirect('ticket_detail', ticket_id=ticket.id) 


def home(request):
    return render(request, "index.html")

def user_register(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("login")  # Redirect after successful registration
    else:
        form = CustomUserCreationForm()
    
    return render(request, "events/register.html", {"form": form})


@login_required
def buy_ticket(request, event_id, ticket_type):
    """Handles ticket purchase (with simulated payment)."""
    event = get_object_or_404(Event, id=event_id)

    # Get ticket price based on type
    price = event.price_vip if ticket_type == "VIP" else event.price_regular

    # Check if user already has a ticket for this event
    existing_ticket = Ticket.objects.filter(user=request.user, event=event, ticket_type=ticket_type).first()
    if existing_ticket:
        messages.warning(request, f"You already have a {ticket_type} ticket for {event.title}.")
        return redirect("event_detail", event_id=event.id)

    # Create the ticket (initially pending payment)
    ticket = Ticket.objects.create(event=event, user=request.user, ticket_type=ticket_type, price=price, payment_status="Pending")

    # Create a simulated payment entry
    payment = Payment.objects.create(user=request.user, ticket=ticket, amount=price, status="Pending")

    # Redirect to payment confirmation page
    return redirect("payment_page", payment_id=payment.id)


@login_required
def payment_page(request, payment_id):
    """Displays the payment page where user can complete the payment."""
    payment = get_object_or_404(Payment, id=payment_id, user=request.user)

    return render(request, "payments/payment_page.html", {"payment": payment})


@login_required
def confirm_payment(request, payment_id):
    """Simulates payment confirmation (marks payment as 'Completed')."""
    payment = get_object_or_404(Payment, id=payment_id, user=request.user)

    if payment.status == "Completed":
        messages.success(request, "Payment already completed!")
        return redirect("dashboard")

    # Simulate payment success ✅
    payment.status = "Completed"
    payment.save()

    # Update ticket status to "Completed"
    payment.ticket.payment_status = "Completed"
    payment.ticket.save()

    messages.success(request, "Payment successful! Your ticket is confirmed. 🎟️")
    return redirect("dashboard")

@login_required
def dashboard(request):
    user_tickets = Ticket.objects.filter(user=request.user)
    return render(request, 'events/dashboard.html', {'tickets': user_tickets})

def event_calendar_data(request):
    events = Event.objects.all().values('id', 'title', 'start_time', 'end_time')
    event_list = list(events)
    return JsonResponse(event_list, safe=False)

def event_calendar_view(request):
    return render(request, 'events/calendar.html')

def admin_login(request):
    if request.user.is_authenticated and request.user.is_superuser:
        return redirect('/admin/')  # Redirect if already logged in

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)

        if user is not None and user.is_superuser:
            login(request, user)
            return redirect('/admin/')  # Redirect to admin panel
        else:
            messages.error(request, "Invalid admin credentials")

    return render(request, 'events/admin_login.html')