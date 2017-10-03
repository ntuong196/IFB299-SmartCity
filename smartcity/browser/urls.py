from django.conf.urls import url

from . import views

app_name = 'browser'
urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^logout/$', views.logout, name='logout'),
    url(r'^cities/(?P<city_id>[0-9]+)/$', views.city, name='city'),
    url(r'^industries/(?P<industry_id>[0-9]+)$', views.industry, name='industry'),
    url(r'^colleges/(?P<college_id>[0-9]+)$', views.college, name='college'),
    url(r'^libraries/(?P<library_id>[0-9]+)$', views.library, name='library'),
    url(r'^hotels/(?P<hotel_id>[0-9]+)$', views.hotel, name='hotel'),
]
