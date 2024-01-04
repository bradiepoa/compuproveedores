try:
    from functools import update_wrapper
except ImportError:
    from django.utils.functional import update_wrapper  # Python 2.3, 2.4 fallback.

from django.contrib.auth import REDIRECT_FIELD_NAME
from django.http import HttpResponseRedirect
from django.utils.http import urlquote

def user_passes_test(test_func, login_url=None, redirect_field_name=REDIRECT_FIELD_NAME):
    """
    Decorator for views that checks that the user passes the given test,
    redirecting to the log-in page if necessary. The test should be a callable
    that takes the user object and returns True if the user passes.
    """
    def decorate(view_func):
        return _CheckLogin(view_func, test_func, login_url, redirect_field_name)
    return decorate

def permiso_requerido(permiso=None,function=None, redirect_field_name=REDIRECT_FIELD_NAME):
    """
    Decorador para vistas, revisa que el ususario este logueado y tenga el 
    permiso para accesar al recurso de otra manera se redirecciona hacia el log-in.
    """
    actual_decorator = user_passes_test(
        lambda u: u.is_authenticated(),
        redirect_field_name=redirect_field_name
    )
    if function:
        return actual_decorator(function)
    return actual_decorator