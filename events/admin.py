from django.contrib import admin
from .models import Event, Ticket, Registration

# Customizing Event Admin Panel
class EventAdmin(admin.ModelAdmin):
    list_display = ("title", "location", "date", "price_vip", "price_regular") # Display ticket price
    list_filter = ('date', 'location')  # Filters for easier search
    search_fields = ('title', 'location')  # Search by event title or location

# Customizing Ticket Admin Panel
class TicketAdmin(admin.ModelAdmin):
    list_display = ('user', 'event', 'ticket_type', 'price', 'issued_at')  # Display ticket price
    list_filter = ('event', 'ticket_type')  # Filter by event and type
    search_fields = ('user__username', 'event__title')  # Search by user and event

# Registering models with customized admin views
admin.site.register(Event, EventAdmin)
admin.site.register(Ticket, TicketAdmin)
admin.site.register(Registration)
