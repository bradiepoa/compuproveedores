from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.contrib.staticfiles.views import serve


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
    path('custom_admin/', include('custom_admin.urls')),
    path('accounts/', include('accounts.urls')),
]

if settings.DEBUG:
    urlpatterns += [
        path('site_media/<path>/', serve,
             {'document_root': settings.STATIC_ROOT, 'show_indexes': True}),
        path('upload/<path>/', serve,
             {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
    ]
