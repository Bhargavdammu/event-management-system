from django import forms
from django.contrib.auth.forms import UserCreationForm
from .models import CustomUser  # Import your custom user model

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = CustomUser  # Use CustomUser instead of auth.User
        fields = ['username', 'email', 'password1', 'password2']
