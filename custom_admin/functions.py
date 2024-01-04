# -*- coding: utf-8 -*- 
from django.db.models import Q
from annoying.functions import get_object_or_None

def write_text_file(location, text):
    f = open(location, 'w')
    f.write(text)
    f.close()
    return f
    
def no_tiene_permiso(user, permisos):
    if user.is_superuser:
        return False
    else:   
        for p in permisos:
            if p == user.last_name:
                return False
    return True 
          
    
def render_to_pdf(template_src, context_dict, landscape=False, debug=False):
    from django.template.loader import get_template
    from django.template import Context
    from subprocess import Popen, call, PIPE
    from django.http import HttpResponse
    from django.conf import settings
    from datetime import datetime
    template = get_template(template_src)
    context_dict['root_url'] = settings.ROOT_URL
    context_dict['STATIC_URL'] = settings.STATIC_URL

    context = Context(context_dict)
    html  = template.render(context)
    if debug:
        return HttpResponse(html, content_type="text/html")
        
    input_html = '/tmp/%s_%s' % (datetime.today().strftime("%y%m%d%H%M%S%f"), template_src)
    write_text_file(input_html, html.encode("utf8"))

    args = "/home/compuproveedores/wkhtmltopdf.sh"

    if landscape:
        args += " -O Landscape"
        
    args += " %s -" % input_html
    #assert False
   
    popen = Popen(args, stdout=PIPE, stderr=PIPE, shell=True)
    
    try:
        body_contents = popen.stdout.read()
        mimetype='application/pdf'
        
    finally:
        from settings import DEBUG

        if not DEBUG:
            popen.terminate()
        popen.wait()
    
    return HttpResponse(body_contents, content_type=mimetype)

def clean_redirect(to, *args, **kwargs):
    """
    Regresa un HttpResponseRedirect basado en el parámetro recibido.

    Los argumentos son:

        * A view name, possibly with arguments: `urlresolvers.reverse()` will
          be used to reverse-resolve the name.
    """
    qs = kwargs.pop('qs','')
    from django.core.urlresolvers import reverse
    from django.http import HttpResponseRedirect
    return HttpResponseRedirect("%s%s" % (reverse(to, args=args, kwargs=kwargs), qs))


def get_pagina(request, objects,  page_size):
    from django.core.paginator import Paginator, InvalidPage, EmptyPage
                  
    paginator = Paginator(objects, page_size)
    try:
        num_pagina = int(request.GET.get('pag', '1'))
    except ValueError:
        num_pagina = 1
    try:
        pagina = paginator.page(num_pagina)
    except (EmptyPage, InvalidPage):
        pagina = paginator.page(paginator.num_pages)
    
    return pagina

def string_to_int(s):
    try:
        return int(s) 
    except:
        return 0

def xls_value(val):
    if val == string_to_int(val):
        return unicode(string_to_int(val))

    try:
        return val.strip()
    except AttributeError:
        return val

def random_password(length, 
allowed_chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'):
    "Generates a random password with the given length and given allowed_chars"
    from random import choice
    return ''.join([choice(allowed_chars) for i in range(length)])
    
def generar_cadena(cadena,nombre,email,desactivado):  
    if "<"+email+">" in cadena or not email or desactivado:
        return ""
        
    return nombre + "<" + email + ">" + ","
    
    
def get_folio(tipo):
    from django.core.exceptions import ObjectDoesNotExist
    from core.models import Bitacora
    
    bitacoras = Bitacora.objects.filter(tipo=tipo)
    
    if bitacoras:
        bitacora = bitacoras.latest('folio')
    else:
        return 1
    
    return bitacora.folio + 1
    
def get_fecha_vencimiento(tipo, fecha=None, es_proyecto=False):
    from datetime import datetime, timedelta
    hoy = datetime.today()
    if not fecha:
        fecha = hoy
    if tipo == 0:
        vencimiento = sumar_dias_habiles(fecha, 22)
    elif tipo == 1:
        vencimiento = sumar_dias_habiles(fecha, 5)
    elif tipo == 2:
        if es_proyecto:
            vencimiento = sumar_dias_habiles(fecha, 22)
        else:
            vencimiento = sumar_dias_habiles(fecha, 3)
    else:
        vencimiento = sumar_dias_habiles(fecha, 22)
    
    return vencimiento
    
def get_bitacoras(f, bitacoras, tipo=None):
    
    q = f.cleaned_data['q']
    estado = f.cleaned_data['estado']
    sucursal = f.cleaned_data['sucursal']

    if q:
        for b in q.split(' '):
            if tipo == 2:
            
                if b.isnumeric():
                    bitacoras = bitacoras.filter(folio=b)
                else:
                    bitacoras = bitacoras.filter(Q(usuario__username__icontains=b) |
                                                 Q(usuario__first_name__icontains=b) |
                                                 Q(usuario_modificado__username__icontains=b)
                    )
            
            else:
                if b.isnumeric():
                    bitacoras = bitacoras.filter(folio=b)
                    
                else:
                    bitacoras = bitacoras.filter(Q(cliente__nombre__icontains=b) |
                                                 Q(usuario__username__icontains=b) |
                                                 Q(usuario__first_name__icontains=b) |
                                                 Q(marca__icontains=b) |
                                                 Q(modelo__icontains=b) |
                                                 Q(no_serie__icontains=b) |
                                                 Q(usuario_modificado__username__icontains=b)
                     )
             
    if estado:
        bitacoras = bitacoras.filter(estado=estado)
    
    if sucursal:
        if tipo == 2:
            bitacoras = bitacoras.filter(usuario__perfil__sucursal=sucursal)
        else:
            bitacoras = bitacoras.filter(sucursal=sucursal)
    
    if tipo == 0:
        
        tipo_garantia = f.cleaned_data['tipo_garantia']
        con_costo = f.cleaned_data["con_costo"]

        if con_costo == "1":
            bitacoras = bitacoras.filter(garantia_costo=True)

        elif con_costo == "2":
            bitacoras = bitacoras.filter(garantia_costo=False)
        
        if tipo_garantia:
            bitacoras = bitacoras.filter(tipo_garantia=tipo_garantia)
    
    elif tipo == 1:
        tipo_servicio = f.cleaned_data['tipo_servicio']
        lugar_servicio = f.cleaned_data['lugar_servicio']
        tipo_equipo = f.cleaned_data['tipo_equipo']
        
        if tipo_servicio:
            bitacoras = bitacoras.filter(tipo_servicio=tipo_servicio)
        if lugar_servicio:
            bitacoras = bitacoras.filter(lugar_servicio=lugar_servicio)
        if tipo_equipo:
            bitacoras = bitacoras.filter(tipo_equipo=tipo_equipo)

    elif tipo == 2:
        tipo_b = f.cleaned_data['tipo']
        
        if tipo_b == "1":
            bitacoras = bitacoras.filter(es_proyecto=False)
        elif tipo_b == "2":
            bitacoras = bitacoras.filter(es_proyecto=True)

    
    return bitacoras
    
def chain_order(order, reverse, *iterables):
    from itertools import chain
    import operator
    objects = list(chain(*iterables))
    objects.sort(key=operator.attrgetter(order), reverse=reverse)
    return objects
    

def random_color():
    allowed_chars = 'abcdef0123456789'
    from random import choice
    from core.models import Perfil
    color =  ''.join([choice(allowed_chars) for i in range(6)])
    return color
    

def string_to_int(s):
    try:
        return int(s) 
    except:
        return 0
    

def chain_order(order, reverse, *iterables):
    from itertools import chain
    import operator
    objects = list(chain(*iterables))
    objects.sort(key=operator.attrgetter(order), reverse=reverse)
    return objects



def get_sucursal_by_name(nombre):
    import unicodedata
    nombre = ''.join((c for c in unicodedata.normalize('NFD', nombre) if unicodedata.category(c) != 'Mn'))
    nombre = nombre.lower()
    if nombre == "tijuana":
        return 1
    elif nombre == "hermosillo":
        return 2
    elif nombre == "culiacan":
        return 3
    elif nombre == "aguascalientes":
        return 4

    return 0

def sumar_dias_habiles(fecha, dias):
    from datetime import timedelta
    fecha_habiles = fecha
    for d in range(0, dias):
        fecha_habiles += timedelta(days=1)
        if fecha_habiles.weekday() == 5:
            fecha_habiles += timedelta(days=2)
        elif fecha_habiles.weekday() == 6:
            fecha_habiles += timedelta(days=1)
    return fecha_habiles
