# -*- coding: utf-8 -*- 
from django.utils.safestring import mark_safe
from django.urls import reverse

from django.conf import settings
from django import template
register = template.Library()

@register.filter
def sino(b):
    if b:
        return u"Sí"
    else:
        return "No"


@register.filter
def status(b):
    if b:
        return u"Finalizado"
    else:
        return "En curso"

@register.filter
def cur(value, sign=False):
    from decimal import Decimal
    from django.contrib.humanize.templatetags.humanize import intcomma
    return intcomma('%.2f' % Decimal(str(value)))


@register.filter
def label_tag(objeto, campo):

    label = objeto._meta.get_field(campo).verbose_name

    label = label.replace("*", "")
    return "%s: " % label

@register.filter
def label_tag2(objeto, campo):

    label = objeto._meta.get_field(campo).verbose_name

    label = label.replace("*", "")
    return label 
 
@register.filter
def label_tag(objeto, campo, no_puntos=False,):

    label = objeto._meta.get_field(campo).verbose_name

    label = label.replace("*", "")
    
    if no_puntos:
        return label
       
    return "%s: " % label
    
@register.filter
def cruz_roja(b):
    
    if b:
        label = '(<img src="%s/site_media/compu/images/cruz_roja.png" />) ' % settings.ROOT_URL
    else:
        label = "(&nbsp;&nbsp;&nbsp;) "
    return mark_safe(label)
    
    
@register.simple_tag
def pdf_icon(title="PDF", width=None, height=None):
    
    html = '<img src="/site_media/img/icons/pdf.png" '
    if width:
        html += 'width="%spx;" ' % width
    if height:
        html += 'height="%spx" ' % height
    
    if title:
        html += 'title="%s" ' % title
    
    html += '/>' 
    
    return mark_safe(html) 

@register.simple_tag
def pdf_href(url_name, arg=0, width=None, height=None, title="PDF", alt=""):
    url = reverse(url_name, args=[arg, ])
    html = '<a href="%s">' % url
    html += '<img src="/site_media/img/icons/pdf.png" '
    if width:
        html += 'width="%spx;" ' % width
    if height:
        html += 'height="%spx" ' % height
    
    html += 'title="%s" ' % title
    
    if alt:
        html += 'alt="%s" ' % alt
    
    html += '/></a>' 
    
    return mark_safe(html)   
     
@register.filter
def cantidad_letra(value):
    from core.cantidad_letra import cantidad_letra
    
    try :
        return cantidad_letra(str(value))            
    except:
       return ''
   
@register.simple_tag
def espacio(n, clear=False):
    out = '<div style="height:%spx;" ' % n
    if clear:
        out += 'class="clear" '
    
    out += '></div>'
    
    return mark_safe(out) 

@register.simple_tag
def submit(value="Guardar", id_=None, button=False):
    
    if button:
        html = '<input type="button" value="%s" ' % value
    else:
        html = '<input type="submit" value="%s" ' % value
        
    if id_:
        html += 'id="%s" ' % id_
    
    html += '/>'
    
    return mark_safe(html)
  
@register.simple_tag
def form_error(form, br=False):
    html = ""
    if form:
        if len(form.errors):
            html = '<span class="red error_form">%s</span> ' % form.errors[0]
            html += "<br>" if br else ""

    return mark_safe(html)

@register.simple_tag
def get_marca_sc_url(marca, sc):
    #import pdb;pdb.set_trace()
    try:
        from core.models import MarcaCategoria
        return MarcaCategoria.objects.get(marca__id=marca, subcategoria__id=sc).url
    except:
        return "#"

def easy_tag(func):
    """deal with the repetitive parts of parsing template tags"""
    def inner(parser, token):
        try:
            return func(*token.split_contents())
        except TypeError:
            raise template.TemplateSyntaxError('Bad arguments for tag "%s"' % token.split_contents()[0])
    inner.__name__ = func.__name__
    inner.__doc__ = inner.__doc__
    return inner

class AppendGetNode(template.Node):
    def __init__(self, dict):
        self.dict_pairs = {}
        for pair in dict.split(','):
            pair = pair.split('=')
            self.dict_pairs[pair[0]] = template.Variable(pair[1])
            
    def render(self, context):
        get = context['request'].GET.copy()

        for key in self.dict_pairs:
            get[key] = self.dict_pairs[key].resolve(context)
        
        path = context['request'].META['PATH_INFO']
        
        if len(get):
            path += "?%s" % "&".join(["%s=%s" % (key, value) for (key, value) in get.items()])
        
        
        return path

@register.tag()
@easy_tag
def append_to_get(_tag_name, dict):
    return AppendGetNode(dict)   
