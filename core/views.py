from django.shortcuts import redirect, get_object_or_404, render
from django.db.models import Q
from annoying.decorators import render_to
from annoying.functions import get_object_or_None
from .models import *
from .functions import *
from .forms import *
from custom_admin.forms import *
from django.urls import reverse
from datetime import date
from django.conf import settings
from django.http import HttpResponse
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.template import Context
from core.sucursales import sucursales as sucursales_mapa, sucursales2 as sucursales_mapa2

@render_to("en_construccion.html")
def en_construccion(request):
    return {}


def index(request):
    today = date.today()
    imagenes_inicio = ImagenInicio.objects.filter(activo=True, fecha_vencimiento__gt=today)
    return render(request, 'index.html', {'index_current': 'current', 'imagenes_inicio': imagenes_inicio})

def redireccion(request):
    return redirect("http://compuproveedoresti.com/")

@render_to('temporal.html')
def temporal(request):
    return { }
    
@render_to('productos_servicios.html')
def productos_servicios(request):
    return en_construccion(request)
    return {}
        
@render_to('nosotros.html')
def nosotros(request):
    nosotros_current = "current"
    return {'nosotros_current':nosotros_current}
    
@render_to('nuestra_historia.html')
def nuestra_historia(request):

    return {'nosotros_current':"current"}

@render_to('registro_correcto.html')
def registro_correcto(request, d, actualizacion):
    distribuidor = get_object_or_None(Distribuidor, id=d)
    return {'d':distribuidor, 'actualizacion':actualizacion}

@render_to('solicitud_correcta.html')
def solicitud_correcta(request, id, tipo_distribuidor):

    return {'id':id , 'distribuidor':tipo_distribuidor}
    


def distribuidor_pdf(request, id, distribuidor, actualizacion=True):

    if not request.META.get('HTTP_REFERER'):
        return redirect("/")
    distribuidor = get_object_or_404(Distribuidor ,id=id, 
                                     distribuidor=distribuidor)
    root_url = settings.ROOT_URL
    variables = {'actualizacion':actualizacion,
                 'distribuidor':distribuidor, 
                 'es_distribuidor':distribuidor.tipo_distribuidor == 1,
                 'root:url':root_url}
 
    return render_to_pdf('distribuidor_pdf.html',
                        variables, 
                        debug=False
    )

#@render_to("solicitar_credito_pdf.html")
def solicitar_credito_pdf(request, id, distribuidor):
    credito = SolicitarCredito.objects.get(id=id)
    root_url = settings.ROOT_URL
    #return {'credito':credito, 'root:url':root_url}
    return render_to_pdf('solicitar_credito_pdf.html',
                        {'credito':credito, 'root:url':root_url}, debug=False)

@render_to('productos.html')
def productos(request):
    return en_construccion(request)
    q = request.GET.get('q', '')
    productos = Producto.objects.all()    
    for term in q.split(' '):
        productos = productos.filter(Q(marca__icontains=term) | 
                                        Q(tipo__icontains=term) |
                                        Q(descripcion__icontains=term) |
                                        Q(clave__icontains=term) 
                                        ).order_by('marca')
    
    return { 'pagina':get_pagina(request, productos, 50), 'q':q }

@render_to('promocion_enviada.html')
def promocion_enviada(request):

    return {}

@render_to('promociones.html')
def promociones(request):
    import datetime
    from django.conf import settings as s
    hoy = datetime.date.today().strftime("%Y-%m-%d")

    imagenes = Imagen.objects.filter(activo=True).exclude(fecha_vencimiento__lte=hoy)
    enviada = False
    
    if request.method == "POST":
        form = EmailForm(request.POST)
        imagen = request.POST.get("imagen_enviar")
        imagen = imagen.replace(s.MEDIA_URL, s.MEDIA_ROOT)
        ciudad = request.POST.get('city', "")
        if ciudad:
            return redirect("index")
        
        if form.is_valid(): 
            nombre = form.cleaned_data['nombre']
            email = form.cleaned_data['destinatario']
            nombre = "%s%s" % (nombre[0].upper(), nombre[1:])
            
            asunto = "COMPUPROVEEDORES UNA OPORTUNIDAD QUE NO DEBES DEJAR PASAR."
            t = get_template("enviar_amigo.txt")
            
            body = "%s PIENSA QUE ESTO ES JUSTO LO QUE HAS ESTADO BUSCANDO:" % nombre
            
            
            #from email.mime.image import MIMEImage
            #from email.mime.multipart import MIMEMultipart
            #from email.mime.text import MIMEText
            #from django.conf import settings
            #img_data = open('/srv/www/media/site_media/compu/images/firma.jpg' , 'rb').read()
            #msg = MIMEMultipart(_subtype='related')
            
            #body = MIMEText('<p>%s <img src="cid:myimage" /></p>' % nombre, _subtype='html')
            #msg.attach(body)
            #img = MIMEImage(img_data, 'jpeg')
            #img.add_header('Content-Id', '<myimage>')
            #msg.attach(img)
            
            #from django.core.mail import EmailMultiAlternatives
            
            msg = EmailMessage(asunto, body, s.EMAIL_FROM_PROMOCIONES, to=[email, ], bcc=[s.EMAIL_PROMOCION])
            msg.attach_file(imagen)
            #msg.attach_alternative(msg.attach, "text/html")
            msg.send()
            
            return {'imagenes':imagenes, 'form':EmailForm(), 'enviada':True, }
    else:
        form = EmailForm()
    
    return {'imagenes':imagenes, 'form':form, 'enviada':enviada, }


@render_to("actualizar_datos.html")
def actualizar_datos(request, es_distribuidor):
    
    from django.conf import settings as s
    success = request.GET.get("success_message", None)
    
    if es_distribuidor:
        palabra_cliente_distribuidor = 'Distribuidor'
        aform = ActualizarDatosDForm
        tipo = 1
    
    else:
        palabra_cliente_distribuidor = 'Cliente'
        aform = ActualizarDatosCForm
        tipo = 2
    
    if request.method == "POST":
        form = aform(request.POST)
        if form.is_valid():
            rfc = form.cleaned_data["rfc"]
            no_distribuidor = form.cleaned_data["no_distribuidor"]

            distribuidor = Distribuidor.objects.filter(tipo_distribuidor=tipo, rfc=rfc)
            asunto = "Acceso a actualizar datos."

            if len(distribuidor):
                distribuidor = distribuidor[0]
                mensaje = "Se han enviado su datos correctamente, en breve nos contactaremos con usted."
                url_mod = autogenerar_clave_distribuidor(request, distribuidor.id, es_distribuidor)
                body = u"""
                Se ha solicitado una actualizacion de datos, para acceder a actualizar sus datos debe dirigirse a la siguiente dirección:
http://compuproveedores.com%s
                """ % (url_mod)
                email = EmailMessage(asunto, body, to=[distribuidor.email(), 'cobranza@compuproveedores.com'])
                email.send()
                return redirect(".?success_message=Se han enviado su datos correctamente, en breve nos contactaremos con usted.")

    else:
        form = aform()
    
    return {
        'form':form, 'success_mensaje':success, 
        "es_distribuidor":es_distribuidor, 
        'palabra_cliente_distribuidor':palabra_cliente_distribuidor 
    }

@render_to('directorio.html')
def directorio(request):
    contactos = Contacto.objects.all()
    ultimo = True if len(contactos) %  2 != 0 else False
    return {'contactos':contactos, 'ultimo':ultimo, }

@render_to('soluciones.html')
def soluciones(request):
    return en_construccion(request)
    marcas = Marca.objects.all()
    return { 'marcas':marcas }


@render_to()
def soluciones_tecnologicas(request, id):
    return {
        'TEMPLATE':'soluciones_tecnologicas/%s.html' % id,
        'id':id,
        'width':300,
    }
  
@render_to('solucion.html')
def solucion(request, id):
    return en_construccion(request)
    marca = Marca.objects.get(id=id)

    return { 'marca':marca }

@render_to('distribuidores.html')
def distribuidores(request):
    
    if request.method == "POST":
        if request.POST.get("alta_distribuidor"):
            return redirect("registro_distribuidor")
        
        if request.POST.get("solicitud_credito"):
            return redirect("solicitar_credito_distribuidor_datos")
        
        if request.POST.get("actualizacion"):
            return redirect("actualizar_datos_distribuidor")

    
    return { }


@render_to('empresas.html')
def empresas(request):
    
    if request.method == "POST":
        if request.POST.get("alta_empresa"):
            return redirect("registro_empresa")
        if request.POST.get("solicitud_credito"):
            return redirect("solicitar_credito_empresa_datos")
        if request.POST.get("actualizacion"):
            return redirect("actualizar_datos_empresa")
            
    return { }

@render_to('ver_block.html')
def ver_block(request):
    return en_construccion(request)
    if p_administrador(request):
        return redirect('/admin/?denied=1')
    b = Block.objects.all()

    return { 'b':b }

@render_to('encuesta.html')
def encuesta(request):

    from django.core.mail import EmailMessage
    from django.conf import settings as s
    c = {}
    
    if request.GET.get("success"):
        return {'success':True}
    
    if request.method == 'POST':
        form = EncuestaSatisfaccionForm(request.POST)
        if form.is_valid():
            form.save()
            
            asunto = "Encuesta"
            t = get_template("encuesta_correo.txt")
            body = t.render(Context({'encuesta':form.instance, 'url':s.ROOT_URL, }))
            
            email = EmailMessage(asunto, body, to=[s.EMAIL_ENCUESTA])
            email.send()
            
            return redirect("/contactanos/?success_encuesta=True")
    else:
        form = EncuestaSatisfaccionForm()
    
    c['form'] = form
    return c

@render_to('datos_incorrectos.html')
def datos_incorrectos(request, serie, folio):
    return {'serie':serie, 'folio':folio }


@render_to('soluciones_tecnologicas/concretar_cita.html')
def concretar_cita(request, id):
    from django.conf import settings 
    #settings.EMAIL_CONCRETAR_CITA
    success = request.GET.get("success", False)
    if request.method == "POST":
        form = ConcretarCitaForm(request.POST)
        form.instance.solucion = id
        if form.is_valid():
            form.save()

            msg = u"""
    Nombre: %s 
    Empresa: %s 
    Email: %s 
    Teléfono: %s
    comentarios: %s 
    Solución: %s
            """ % (form.instance.nombre, 
                   form.instance.empresa, 
                   form.instance.email, 
                   form.instance.telefono,
                   form.instance.comentarios,
                   id)
            email = EmailMessage('Concertar Cita', msg, to=[settings.EMAIL_CONCRETAR_CITA])
            email.send(fail_silently=False)
            
            return redirect('/concretar_cita/%s/?success=1' % id)
        else:
            datos_incorrectos = True

    else:
        form = ConcretarCitaForm()
        
    return {'form':form, 'success':success, 'id':id, }


@render_to('contactanos2.html')
def contactanos(request):
    
    sucursales = sucursales_mapa
    datos_incorrectos = False
    success_comentarios = request.GET.get("success_comentarios")
    success_encuesta = request.GET.get("success_encuesta")
    if request.method == "POST":
        form = ContactanosForm(request.POST)
        serie = request.POST.get('serie')
        folio = request.POST.get('folio')
        
        if form.is_valid():
            encuesta = request.POST.get('encuesta', "")
            comentarios = request.POST.get('comentarios', "")

            if comentarios:
                return redirect('/contacto/?serie=%s&folio=%s' % (serie, folio))
            if encuesta:
                return redirect('/encuesta/?serie=%s&folio=%s' % (serie, folio))
        else:
            datos_incorrectos = True

    else:
        form = ContactanosForm()
    
    success_mensaje = True if success_encuesta or success_comentarios \
                              or datos_incorrectos else False
    
    if datos_incorrectos:
        success_encuesta = None
        success_comentarios = None
    
    if success_encuesta and success_comentarios:
        success_encuesta = None
        success_comentarios = None
    
    return {'form':form, 'contacto_current':'current', 'sucursales':sucursales,
            'success_mensaje':success_mensaje,
            'success_encuesta':success_encuesta,
            'success_comentarios':success_comentarios,
            'success_datos_incorrectos':datos_incorrectos,  }


@render_to('contacto2.html')
def contacto(request):
    
    sucursales = sucursales_mapa2
    serie = ""
    folio = ""
    
    if not request.method == "POST":
        serie = request.GET.get('serie', '').upper()
        folio = request.GET.get('folio', '')
        
        if not serie and not folio:
            return redirect('contactanos')
            
        series = ["H", "CUL", "AGS", "TIJ"] 
        
        if not serie in series:
            return datos_incorrectos(request, serie, folio)
        
    from django.core.mail import EmailMessage

    c = {}
    message = ""
    instance = MensajeContacto()
    if request.method == 'POST':
        form = MensajeContactoForm(request.POST, request.FILES, instance=instance)
        
        if form.is_valid():
            form.save()
            
            msg = u"""
    Nombre: %s 
    Empresa: %s 
    Email: %s 
    Teléfono: %s
    comentarios: %s 
            """ % (instance.nombre, 
                   instance.empresa, 
                   instance.email, 
                   instance.telefono,
                   instance.comentarios)
            message = "Su solicitud ha sido enviada correctamente."
            email = EmailMessage('Contacto Compuproveedores', msg, to=[settings.EMAIL_CONTACTO])
            email.send(fail_silently=False)
            return redirect("/contactanos/?success_comentarios=True")
    else:
        form = MensajeContactoForm(instance=instance)    
        
    return {'form':form, 
            'message':message, 
            'contacto_current':'current',
            'serie':serie, 
            'folio':folio,
            'sucursales':sucursales }
            
@render_to('mensaje_enviado.html')
def mensaje_enviado(request):
    return{}
    
@render_to("bolsa_trabajo_enviada.html")
def bolsa_trabajo_enviada(request):
    success = request.GET.get('success')
    return {'success':success, }

@render_to('bolsa_trabajo.html')
def bolsa_trabajo(request):
    from django.core.mail import EmailMessage
    instance = SolicitudTrabajo()
    success = request.GET.get('success', "")
    
    
    if request.method == 'POST':        
        form = SolicitudTrabajoForm(request.POST, request.FILES, instance=instance)
        buscar_form = BuscarVacanteForm(request.POST)
        buscar = request.POST.get('buscar', '')

        if buscar:
            if buscar_form.is_valid():
                q = buscar_form.cleaned_data['q']
                ciudad = buscar_form.cleaned_data['ciudad']
                return redirect('/resultado_bolsa_trabajo/?q=%s&sucursal=%s' % (q, ciudad))
        else:     
            if form.is_valid():
                form.save()
                
                msg = u"""
    Nombre: %s 
    Apellido: %s 
    Email: %s 
    ¿Cuánto aspira a ganar?: %s
    Vacante: %s
    solicitudes %s%s 
            """ % (instance.nombre, 
                   instance.apellido,
                   instance.email, 
                   instance.aspiracion, 
                   instance.vacante,
                   settings.ROOT_URL, reverse('solicitudes_trabajo')
                  )
     
                email = EmailMessage('Bolsa de trabajo', msg, to=[settings.EMAIL_BOLSA_TRABAJO])
                if form.instance.curriculum:             
                    email.attach_file(form.instance.curriculum.path)
                email.send(fail_silently=False)
                return redirect("/bolsa_trabajo/?success=True")
    else:
        form = SolicitudTrabajoForm(instance=instance)
        buscar_form = BuscarVacanteForm()

    return {'form':form, 
            'vacantes':Vacante.objects.all(), 
            'bolsa_trabajo_current':'current',
            'buscar_form':buscar_form, 
            'success_mensaje':success,
    }


@render_to('resultado_bolsa_trabajo.html')
def resultado_bolsa_trabajo(request):
    
    q = request.GET.get('q', "")
    ciudad = request.GET.get("sucursal")
    success = request.GET.get("success")
    vacantes = Vacante.objects.filter(ciudad=ciudad)
    if not ciudad:
        vacantes = Vacante.objects.all()

    if q:
        for b in q.split(" "):
            vacantes = vacantes.filter(Q(nombre__icontains=b) |
                                       Q(ciudad__icontains=b) |
                                       Q(descripcion__icontains=b) 
        )

    if ciudad:
        vacantes = Vacante.objects.filter(ciudad=ciudad)
        
    if request.method == "POST":
        vacante_seleccionada = request.POST.get('vacante_seleccionada')
        form = CurriculumForm(request.POST, request.FILES)
        if vacante_seleccionada != 'False':
            vacante = get_object_or_404(Vacante, id=vacante_seleccionada)
            if form.is_valid():
                form.instance.vacante = vacante
                form.save()
                return redirect("/resultado_bolsa_trabajo/?q=%s&success=%s&sucursal=%s" % (q, 1, ciudad))
            
    else:
        form = CurriculumForm()

    return {'form':form ,'vacantes':vacantes, 'bolsa_trabajo_current':'current', 'success_mensaje':success, }

@render_to('registro_distribuidor.html')
def registro_distribuidor(request, id=None, web_key=None, distribuidor=True ):

    from django.core.mail import EmailMessage
    c = {}
    formset = None
    import datetime
    actualizacion = False
    if distribuidor:
        palabra = "distribuidor"
    else:
        palabra = "cliente"
    
    if id and web_key:
        actualizacion = True
        instance = get_object_or_404(Distribuidor, clave_modificacion=web_key, id=id)
        if (datetime.date.today() - instance.fecha_clave).days > 30:
            return HttpResponse('La autorización para modificar sus datos ha expirado.')

        queryset = instance.personas.all()
        asunto = 'Se ha actualizado un %s' % palabra
    else:
        instance = Distribuidor()
        queryset = PersonaAutorizada.objects.none()
        asunto = 'Se ha registrado un %s' % palabra
       
     
    if request.method == 'POST':        
        form = DistribuidorForm(request.POST, request.FILES, instance=instance)
        if distribuidor:
            form.fields["sucursal"].choices =  ((2, 'HERMOSILLO'), )    
            formset = PersonaAutorizadaFS(request.POST, queryset=queryset)
            formset.forms[0].empty_permitted = False

        formset_valido = formset.is_valid() if distribuidor else True
        
        if form.is_valid() and formset_valido:
            if distribuidor:
                form.instance.tipo_distribuidor = 1
            else:
                form.instance.tipo_distribuidor = 2
            sucursal = form.cleaned_data["sucursal"]

            form.save()

            try:
                sc = form.instance.solicitarcredito 
            except ObjectDoesNotExist:
                sc = SolicitarCredito()
            
            sc.dist = form.instance
            sc.razon_social = form.instance.razon_social
            sc.save()

            try:
                cliente = form.instance.cliente

            except ObjectDoesNotExist:
                cliente =  Cliente()

            cliente.nombre = form.instance.razon_social
            cliente.rfc = form.instance.rfc
            cliente.direccion = form.instance.domicilio
            cliente.ciudad = form.instance.ciudad
            cliente.estado = form.instance.estado 
            cliente.telefono = form.instance.telefono
            cliente.email = form.instance.email()
            cliente.sucursal = sucursal
            cliente.distribuidor = form.instance
            cliente.save()
 
            if distribuidor:
                ds = formset.save(commit=False)            
                for d in ds:
                    d.distribuidor = form.instance
                    d.save()
                    
            if instance.nombre_comercial:
                nombre_comercial=instance.nombre_comercial
            else:
                nombre_comercial = "No tiene"
                
                    
            msg = u"""
Nombre o Razon Social: %s 
Nombre comercial: %s 
        """ % (instance.razon_social, 
               nombre_comercial,
              )
            email = EmailMessage(asunto, msg, to=[settings.EMAIL_REGISTRO_DISTRIBUIDOR])
            email.send(fail_silently=False)
            
            return registro_correcto(request, form.instance.id, actualizacion)
    else:
        form = DistribuidorForm(instance=instance)
        if distribuidor:
            formset = PersonaAutorizadaFS(queryset=queryset)
            form.fields["sucursal"].choices =  ((2, 'HERMOSILLO'), )     

    c['form'] = form
    c['formset'] = formset
    c['success'] = request.GET.get('success')
    return c

@render_to("certificaciones.html")
def certificaciones(request):
    return {}

@render_to("mundo_tecnologia.html")
def mundo_tecnologia(request):  

    imagenes_mt = MundoTecnologia.objects.all()
    
    return {'imagenes_mt':imagenes_mt }

@render_to('solicitar_credito.html')
def solicitar_credito(request, rfc, distribuidor=True ):
    
    from django.core.mail import EmailMessage
    c = {}
    
    if distribuidor:
        tipo = 1
    else:
        tipo = 2
    
    distribuidor = get_object_or_404(Distribuidor, tipo_distribuidor=tipo, rfc=rfc)
    
    instance = SolicitarCredito.objects.get_or_create(dist=distribuidor)[0]
    if instance is None:
        instance = SolicitarCredito(dist=distribuidor)
    
    if request.method == 'POST':
        form = SolicitarCreditoForm(request.POST, request.FILES, instance=instance)
        
        if form.is_valid():
            form.save()
            return solicitud_correcta(request, form.instance.id, form.instance.dist.tipo_distribuidor)
    else:
        form = SolicitarCreditoForm(instance=instance)
    
    c['form'] = form

    return c

@render_to("solicitar_credito_datos.html")
def solicitar_credito_datos(request, es_dis):
    
    from django.conf import settings as s
    success = request.GET.get("success", None)
    tipo = 0
    if es_dis:
        palabra_cliente_distribuidor = 'Distribuidor'
        aform = ActualizarDatosDForm
        tipo = 1
    
    else:
        palabra_cliente_distribuidor = 'Cliente'
        tipo = 2
        aform = ActualizarDatosCForm
    
    
    if request.method == "POST":
        form = aform(request.POST)
        if form.is_valid():
            rfc = form.cleaned_data["rfc"].replace(' ', '').replace('-', '')
            no_distribuidor = form.cleaned_data["no_distribuidor"]
            
            if es_dis:
                return redirect("solicitar_credito_distribuidor", rfc)
            else:   
                return redirect("solicitar_credito_empresa", rfc)

    else:
        form = aform()
    
    return {
        'form':form, 'success_mensaje':success, 
        "es_distribuidor":es_dis, 
        'palabra_cliente_distribuidor':palabra_cliente_distribuidor 
    }
    
@render_to('seleccionar.html')
def seleccionar(request):
    c = {}
    
    if request.method == "POST":
        form = ObtenerBitacoraForm(request.POST)
        
        if form.is_valid():
            guia_garantia = form.cleaned_data['guia_garantia']
            guia_servicio = form.cleaned_data['guia_servicio']

            if request.POST.get("terminos"):
                return redirect("terminos_condiciones_garantias")
            if request.POST.get("garantia"):
                return redirect("/garantia/?guia=%s" % guia_garantia)
            if request.POST.get("servicio"):
                return redirect("/servicio_tecnico/?guia=%s" % guia_servicio)
    else:
        form = ObtenerBitacoraForm()
        
    return {'form':form }
    
@render_to('rastreo.html')
def rastreo(request, tipo):
    c = {} 
    guia = request.GET.get("guia")

    bitacora = get_object_or_404(Bitacora, tipo=tipo, guia=guia)
    

    return {'bitacora':bitacora}


def validate_contactanos(request):

    form = ContactanosForm(request.GET)
    if form.is_valid():
        datos_correctos = True
    else:
        datos_correctos = False

    return HttpResponse(datos_correctos)



    
def autogenerar_clave_distribuidor(request, id, es_distribuidor):
    from custom_admin.functions import random_password
    from django.conf import settings 
    import datetime
    d = get_object_or_None(Distribuidor,id=id, distribuidor=es_distribuidor)
    url_mod = settings.ROOT_URL
    if d:
        d.clave_modificacion = random_password(50)
        d.fecha_clave = datetime.date.today()
        d.save()
        if es_distribuidor:
            url_mod = reverse('modificacion_distribuidor', args=[id, d.clave_modificacion])  
        else:
            url_mod = reverse('modificacion_empresa', args=[id, d.clave_modificacion])  
    return url_mod



@render_to("terminos_condiciones_garantias.html")
def terminos_condiciones_garantias(request):
    return {}

def alertas(request):
    #Garantias
    from datetime import date
    from django.core.mail import send_mail
    today = date.today()
    #send_mail('', '', 'enviospaginaweb@compuroveedores.com', ['@.com'], fail_silently=False)
    #for b in Bitacora.objects.filter(tipo=1, fecha_aviso=today):
        

@render_to("aviso_privacidad.html")
def aviso_privacidad(request):

    try:
        aviso = AvisoPrivacidad.objects.get()
    except:
        aviso = AvisoPrivacidad(titulo="Aviso de privacidad")
        aviso.save()

    return {"aviso":aviso, "aviso_current":"current"}
