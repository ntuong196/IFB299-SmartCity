from django.conf.urls import url
from . import views
from django.contrib.auth import views as auth

urlpatterns = [
    url(r'^$', views.signin, name='login'),
    url(r'^logout', auth.logout, name='logout'),
    url(r'^register', views.register, name='register'),
]