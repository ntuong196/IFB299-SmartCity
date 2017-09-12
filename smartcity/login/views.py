from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import Group

from login.forms import RegisterForm


def signin(request):
    return render(request, 'login/login.html')

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()
            user.profile.phone = form.cleaned_data.get('phone')
            user.profile.address = form.cleaned_data.get('address')
            user.save()
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=raw_password)
            groupname = form.cleaned_data.get('group')
            g = Group.objects.get(name = groupname)
            g.user_set.add(user)
            login(request, user)
            return redirect('login')
    else:
        form = RegisterForm()
    return render(request, 'login/register.html', {'form': form})