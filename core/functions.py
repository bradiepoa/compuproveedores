# -*- coding: utf-8 -*- 
from decimal import Decimal
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
    context_dict["STATIC_URL"] = settings.STATIC_URL
    context = Context(context_dict)
    html  = template.render(context)
    if debug:
        return HttpResponse(html, mimetype="text/html")
        
    input_html = '/tmp/%s_%s' % (str(datetime.today())[11:], template_src)
    write_text_file(input_html, html.encode("utf8"))

    args = ["/usr/bin/wkhtmltopdf.sh"]

    if landscape:
        args.append("-O")
        args.append("Landscape")
        
    args.extend([input_html, "-"])
        
    popen = Popen(args, stdout=PIPE, stderr=PIPE)
    
    try:
        body_contents = popen.stdout.read()
        mimetype='application/pdf'
        
    finally:
        from settings import DEBUG

        if not DEBUG:
            popen.terminate()
        popen.wait()
    
    return HttpResponse(body_contents, mimetype=mimetype)

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
    

def string_to_int(s):
    try:
        return int(s) 
    except:
        return 0

def string_to_decimal(s):
    
    try:
        s = str(s)
        s = s.replace('$','')
        d = ''.join(s.split(','))        
        return Decimal(d) 
    except:
        return 0    
