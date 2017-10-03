from django.conf.urls import url

from . import views



app_name = 'polls'
urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^(?P<pk>[0-9]+)/$', views.DetailView.as_view(), name='detail'),
    url(r'^(?P<pk>[0-9]+)/element/$', views.ResultsView.as_view(), name='element'),
    url(r'^(?P<entity_id>[0-9]+)/rating/$', views.rating, name='rating'),
]