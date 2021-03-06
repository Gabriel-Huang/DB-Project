from django.conf.urls import url

from . import views

app_name = 'products'
urlpatterns = [
    url(r'^post/$', views.post, name='post'),
    # url(r'^order/$', views.order, name='order'),
    url(r'^detials/(?P<pk>\d+)$', views.detials, name='detials'),
    url(r'^order/(?P<pk>\d+)$', views.order, name='order'),
    url(r'^update/(?P<pk>\d+)$', views.update, name='update'),
    url(r'^conformation/(?P<pk>\d+)$', views.conformation, name='order'),
]
