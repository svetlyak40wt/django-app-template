from django.conf.urls.defaults import *

urlpatterns = patterns('',
     (r'^django_app_template/', include('django_app_template.urls')),
)

