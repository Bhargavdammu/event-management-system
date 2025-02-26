"""
URL configuration for event_management project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
"""
from django.contrib import admin
from django.urls import path, include
from django.shortcuts import redirect  # ✅ Add this import
from django.contrib.auth import views as auth_views
urlpatterns = [
    path('admin/', admin.site.urls),
    #path('', include('events.urls')), 
    path('events/', include('events.urls')),  # Ensure this is included
    # ✅ Redirect root URL to /events/

    path('logout/', auth_views.LogoutView.as_view(next_page='login'), name='logout'),  # Add this line
    path('', lambda request: redirect('/events/')),
]
"""

from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView
from events.views import (
    home, event_list, event_detail, user_dashboard, 
    user_register, user_login, register_for_event,admin_login
)

urlpatterns = [
    path("", home, name="home"),  # Homepage
    path("events/", include("events.urls")),  # 👈 This ensures all event-related URLs work
    path("events/", event_list, name="event_list"),  # Events list
    path("events/<int:event_id>/", event_detail, name="event_detail"),  # Event details
    path("events/<int:event_id>/register/", register_for_event, name="register_for_event"),  # Register for event
    path("dashboard/", user_dashboard, name="user_dashboard"),  # User dashboard
    path("register/", user_register, name="register"),  # User registration
    path("login/", user_login, name="login"),  # User login
    path("logout/", LogoutView.as_view(next_page="login"), name="logout"),  # Logout
    path("admin/", admin.site.urls),  # Admin panel
    path("events/", include("events.urls")),  # Include events app URLs
    path('admin-login/', admin_login, name='admin_login'),  # ✅ Add admin login route
]   

# ✅ Serve media files during development
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
