import os
from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


SECRET_KEY = 'django-insecure-2#9@orl61&3x4pu1=$c^0)&5=jsw%w!e#0zu72-$y0j4cqmf!='

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'custom_admin',
    'probador',
    'accounts',
    'core'
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'compuproveedores.urls'

ROOT_URL = "http://162.243.44.17/"

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'compuproveedores.wsgi.application'


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


LANGUAGE_CODE = 'es-mx'

TIME_ZONE = 'America/Hermosillo'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')


# locacal server static config
# STATICFILES_DIRS =[
#     os.path.join(BASE_DIR, 'static')
# ]


# config media files
MEDIA_URL ='/media/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media/')
# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

CELERY_RESULT_BACKEND = 'djcelery.backends.database:DatabaseBackend'
ROKER_URL = "django://"
MEDIA_ROOT = "/srv/upload/"
MEDIA_URL = "http://162.243.44.17/upload/"
TMP_DIR = "/tmp"
WKHTMLTOPDF = "/home/compuproveedores/wkhtmltopdf.sh"

EMAIL_HOST = "localhost"
ADMINS = (('Juan', 'juanefren@dmspitic.com'),)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'null': {
            'class': 'logging.NullHandler',
        },
    },
    'loggers': {
        'django.security.DisallowedHost': {
            'handlers': ['null'],
            'propagate': False,
        },
    }
}


BASE_URL = 'http://162.243.44.17'
DEFAULT_FROM_EMAIL = 'servicios@compuproveedores.com'
EMAIL_CONTACTO = 'gerencia@compuproveedores.com'
EMAIL_REGISTRO_DISTRIBUIDOR = 'distribuidores@compuproveedores.com'
EMAIL_MODIFICACION_DISTRIBUIDOR = 'distribuidores@compuproveedores.com'


EMAIL_BOLSA_TRABAJO = 'recursoshumanos@compuproveedores.com'
EMAIL_ENCUESTA = 'gerencia@compuproveedores.com'
EMAIL_RENTA = 'reportesinternos@compuproveedores.com'
EMAIL_PROMOCION = 'mercadotecnia@compuproveedores.com'
EMAIL_STATUS = 'garantias@compuproveedores.com'
EMAIL_ACTIVIDAD = 'servicios@compuproveedores.com'
EMAIL_CONCRETAR_CITA = 'desarrollo@compuproveedores.com'
# EMAIL_CONCRETAR_CITA = 'juanefren@dmspitic.com'
EMAIL_FROM_PROMOCIONES = "servicios@compuproveedores.com"
# EMAIL_FROM_PROMOCIONES = "promociones@compuproveedores.com"
DATABASE_BACKUP_PATH = '/srv/www/media/site_media'
EMAIL_AVANCE_G = "garantias@compuproveedores.com"
EMAIL_AVANCE_S = "servicios@compuproveedores.com"
EMAIL_AVANCE_I = "soporte@compuproveedores.com"
EMAIL_AVANCE_I2 = "reportes_internos@compuproveedores.com"

EMAIL_HOST = "smtp.office365.com"
EMAIL_PORT = 587
EMAIL_HOST_USER = "servicios@compuproveedores.com"
EMAIL_HOST_PASSWORD = "COM8906.*"
EMAIL_USE_TLS = True

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
