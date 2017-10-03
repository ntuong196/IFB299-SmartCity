from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.signin, name='login'),
    url(r'^logout', views.signout, name='logout'),
    url(r'^register', views.register, name='register'),
    url(r'^reset', views.resetpassword, name='reset'),
]