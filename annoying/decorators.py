from django import forms
from django.shortcuts import render
from django.db.models import signals as signalmodule
from django.http import HttpResponse
import json as simplejson

__all__ = ['render_to', 'signals', 'ajax_request']


def render_to(template=None):
    def renderer(function):
        def wrapper(request, *args, **kwargs):
            output = function(request, *args, **kwargs)
            if not isinstance(output, dict):
                return output
            tmpl = output.pop('TEMPLATE', template)
            return render(request, tmpl, output)
        return wrapper
    return renderer


class Signals(object):
    def __init__(self):
        self._signals = {}

        for k, v in signalmodule.__dict__.items():
            if not k.startswith('__') and k != 'Signal':
                self.register_signal(v, k)

    def __getattr__(self, name):
        return self._connect(self._signals[name])

    def __call__(self, signal, **kwargs):
        def inner(func):
            signal.connect(func, **kwargs)
            return func
        return inner

    def _connect(self, signal):
        def wrapper(**kwargs):
            return self(signal, **kwargs)
        return wrapper

    def register_signal(self, signal, name):
        self._signals[name] = signal

signals = Signals()


class JsonResponse(HttpResponse):
    def __init__(self, data):
        super(JsonResponse, self).__init__(content=simplejson.dumps(data), content_type='application/json')


def ajax_request(func):
    def wrapper(request, *args, **kwargs):
        response = func(request, *args, **kwargs)
        if isinstance(response, dict):
            return JsonResponse(response)
        else:
            return response
    return wrapper


def autostrip(cls):
    fields = [(key, value) for key, value in cls.base_fields.items() if isinstance(value, forms.CharField)]
    for field_name, field_object in fields:
        def get_clean_func(original_clean):
            return lambda value: original_clean(value and value.strip())
        clean_func = get_clean_func(getattr(field_object, 'clean'))
        setattr(field_object, 'clean', clean_func)
    return cls
