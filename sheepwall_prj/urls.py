"""sheepwall_prj URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from django.views.static import serve
from django.conf import settings

from sheepwall_app import views

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^index/', views.render_index),
    url(r'^popup/', views.render_popup),
    url(r'^updatewifiusers/', views.render_wifiuser_table),
    url(r'^vulnertable/', views.render_vulner_table),
    url(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_URL}),
]
