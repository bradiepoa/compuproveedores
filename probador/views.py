from django.shortcuts import redirect
from models import *
from annoying.functions import *
from annoying.decorators import *
from django.http import HttpResponse
from functions import *
from django.conf import settings


def guardar_urls(request):

    for u in Url.objects.all():
        u.delete()
    for up in UrlParametro.objects.all():
        up.delete()

    from django.conf import settings
    path = "%s/urls.py" % settings.ROOT_PATH
    f = open(path, 'r')
    con_clase = True
    for l in f.read().splitlines():

        if l.startswith("    url(r'^"):
            try:
                klass = l.split("#")[1].split(".")[0]
                propiedad = l.split("#%s." % klass)[1]
            except IndexError:
                con_clase = False

            url = "/"
            url += l.split("    url(r'^")[1].split("$")[0]
            url_par = ""

            if con_clase:
                valor = eval(
                    "%s.objects.all().order_by('?')[0].%s" % (klass, propiedad))

            if '(.*)' in url or '(.+)' in url or '(\d+)' in url:
                url_par = url
                url = ""

                if con_clase:
                    valor = "%s" % valor
                    if '(.*)' in url_par:
                        url_par = url_par[1:].replace('(.*)', valor)
                    if '(.+)' in url_par:
                        url_par = url_par[1:].replace('(.+)', valor)
            if url:
                u = Url()
                u.name = url
                u.save()
            elif url_par:
                up = UrlParametro()
                up.name = url_par
                up.save()

    f.close()
    return HttpResponse(":D")


def reset(request):
    for u in Url.objects.all():
        u.delete()
    Url.objects.create(name="/")
    return redirect('tester-store')


def test(request):
    auth()
    urls = Url.objects.exclude(name__startswith="/accounts/")
    out = ""
    for u in urls:
        e = u.test()
        if e:
            out += "<div>%s - %s</div>" % (u, e)
    # operations()
    return HttpResponse(out)


@render_to('tester/show.html')
def show(request):
    urls = []
    for u in Url.objects.filter(error__gt=''):
        urls.append("%s - %s" % (u.name, u.error))
    return {'urls': urls}


@render_to('tester/urls.html')
def urls(request):
    urls = []
    for u in Url.objects.all():
        urls.append("%s - %s" % (u.name, u.error))
    return {'urls': urls}


@render_to('tester/store.html')
def store(request):

    try:
        settings.USAR_PROBADOR
    except:
        return HttpResponse(":(")

    url = Url.objects.all()
    errores = ""
    for u in url:
        try:
            go(u.name)
        except:
            errores += "%s \n" % u.name

    return HttpResponse(errores)
