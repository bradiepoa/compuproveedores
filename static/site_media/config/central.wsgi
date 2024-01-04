import os
import sys
sys.path.append('/srv/Projects/at_estable')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings_central'
import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
