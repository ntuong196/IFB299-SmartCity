from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import Group, User
from login.forms import RegisterForm, ResetForm
from django.http import HttpResponse
from django.template import loader


def signin(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            login(request, user)
            if user.is_superuser:
                return redirect('/admin')
            else:
                return redirect('/browser')
    else:
        form = AuthenticationForm(request)
    return render(request, 'login/login.html', {'form': form})

def register(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.refresh_from_db()
            user.profile.phone = form.cleaned_data.get('phone')
            user.profile.address = form.cleaned_data.get('address')
            user.save()
            password = form.cleaned_data.get('password1')
            user = authenticate(username=user.username, password=password)
            groupname = form.cleaned_data.get('group')
            g = Group.objects.get(name=groupname)
            g.user_set.add(user)
            login(request, user)
            return redirect('login')
    else:
        form = RegisterForm()
    return render(request, 'login/register.html', {'form': form})

def signout(request):
    logout(request)
    return redirect('login')

def resetpassword(request):
    if request.method == 'POST':
        form = ResetForm(request.POST)
        if form.is_valid():
            p1 = form.cleaned_data.get("password")
            p2 = form.cleaned_data.get("re_enter")
            if p1 == p2:
                username = form.cleaned_data.get("username")
                user = User.objects.get(username=username)
                user.set_password(p1)
                user.save()
                return redirect('login')
    else:
        form = ResetForm()
    return render(request, 'login/resetpassword.html', {'form': form})
