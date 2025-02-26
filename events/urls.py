from django.urls import path
from .views import event_calendar_data
from .views import event_calendar_view 
from .views import admin_login
from django.contrib.auth import views as auth_views
from events import views
from .views import (
    home, event_list, event_detail, register_for_event, my_events, 
    create_event, edit_event, delete_event, user_dashboard, user_login, 
    user_register, ticket_detail, fake_payment, cancel_registration, dashboard
)

urlpatterns = [
    path('', home, name='home'),  # Home page
    path('events/', event_list, name='event_list'),  # Events list page
    path('login/', user_login, name='login'),
    path('register/', user_register, name='register'),
    path('event/<int:event_id>/', views.event_detail, name='event_detail'),  # Event details
    path('events/<int:event_id>/register/', register_for_event, name='register_for_event'),  # Register for event
    path('events/<int:event_id>/cancel/', cancel_registration, name='cancel_registration'),  # Cancel registration
    path('my-events/', my_events, name='my_events'),  # User's registered events
    path('events/create/', create_event, name='create_event'),  # Create event
    path('events/<int:event_id>/edit/', edit_event, name='edit_event'),  # Edit event
    path('events/<int:event_id>/delete/', delete_event, name='delete_event'),  # Delete event
    path('dashboard/', user_dashboard, name='user_dashboard'),  # User dashboard
    path('dashboard/', dashboard, name='dashboard'),  # Dashboard (redundant, can remove one)
    path('ticket/<int:ticket_id>/', ticket_detail, name='ticket_detail'),  # Ticket details
    path('ticket/<int:ticket_id>/pay/', fake_payment, name='fake_payment'),  # Fake payment processing
    path("logout/", auth_views.LogoutView.as_view(next_page="home"), name="logout"),  # ✅ Fix logout redirect
    path("buy_ticket/<int:event_id>/<str:ticket_type>/", views.buy_ticket, name="buy_ticket"),
    path("payment/<int:payment_id>/", views.payment_page, name="payment_page"),
    path("confirm_payment/<int:payment_id>/", views.confirm_payment, name="confirm_payment"),
    path('calendar/', event_calendar_view, name='event_calendar'), 
    path('api/events/', event_calendar_data, name='event_calendar_data'),

    path('admin-login/', admin_login, name='admin_login'),  # Custom admin login page

]
