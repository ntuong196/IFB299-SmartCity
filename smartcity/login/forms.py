from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group


class RegisterForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
    phone = forms.CharField(max_length=14)
    address = forms.CharField(max_length=500)
    groups = Group.objects.all()
    names = []
    for group in groups:
        names.append(group.name)
    
    group = forms.ChoiceField(choices=[(name, name) for name in names])

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'password1', 'password2', 'email', 'phone', 'address', 'group')

