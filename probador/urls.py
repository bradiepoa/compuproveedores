from django.conf.urls.defaults import url as u
from django.conf.urls.defaults import patterns

urlpatterns = patterns('probador.views',
                       u(r'^guardar_urls/$', 'guardar_urls',
                         {}, 'probador-guardar_urls'),
                       u(r'^reset/$', 'reset', {}, 'tester-reset'),
                       u(r'^store/$', 'store', {}, 'tester-store'),
                       u(r'^test/$', 'test', {}, 'tester-test'),
                       u(r'^show/$', 'show', {}, 'tester-show'),
                       u(r'^urls/$', 'urls', {}, 'tester-urls'),
                       )
