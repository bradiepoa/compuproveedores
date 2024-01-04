# -*- coding: utf-8 -*- 
# from django.core.context_processors import csrf
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect, get_object_or_404
from django.db.models import Q
from annoying.decorators import render_to
from annoying.functions import get_object_or_None
from core.models import *
from .functions import *
from .forms import *
from core.forms import *
from django.urls import reverse
from django.conf import settings
from django.http import HttpResponse
from django.db.models.deletion import ProtectedError
from django.contrib.auth.models import User
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.template import Context
from django.utils.safestring import mark_safe
import json as simplejson
from django.views.decorators.cache import never_cache

@login_required()
@render_to('admin/admin.html')
def admin(request):
    error = None
    if request.GET.get('denied'):
        error = "Usted no tiene permiso para accesar a esta pantalla"
        
    return { 'error':error, 'success':request.GET.get('success') }
    
@login_required()
@render_to('admin/block.html')
def block(request):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    
    if request.method == 'POST':        
        formset = BlockFS(request.POST)
        if formset.is_valid():
            formset.save()
            return redirect('.')
    else:
        formset = BlockFS()

    return {'formset':formset }



@login_required()
def eliminar_lista(request, id):
    if no_tiene_permiso(request.user, []): 
        return redirect('/admin/?denied=1')

    
    lista = get_object_or_None(Lista, id=id)
    ultima_lista = Lista.objects.latest('created')
    if lista:
        if ultima_lista == lista:
            return HttpResponse('No es posible eliminar esta lista ya que es la que esta actualmente en uso')
        lista.delete()

    return redirect('administrar_productos')

@login_required()
@render_to('admin/usuarios.html')
def usuarios(request):
    if no_tiene_permiso(request.user, ["soporte_tecnico"]): 
        return redirect('/admin/?denied=1')

    usuarios = User.objects.all().order_by('username')
    form = BuscarUsuariosForm(request.GET)
    
    if form.is_valid():
        q = form.cleaned_data['q']
        permiso = form.cleaned_data['permiso']
        sucursal = form.cleaned_data['sucursal']
        
        if q:
            usuarios = usuarios.filter(first_name__icontains=q)
        
        if sucursal:
            usuarios = usuarios.filter(perfil__sucursal=sucursal)
        
        if permiso:
            usuarios = usuarios.filter(last_name=permiso)
        
    return {"usuarios":usuarios, 'form':form}

@login_required()
@render_to('admin/usuario.html')
def usuario(request, id):
    if no_tiene_permiso(request.user, ["soporte_tecnico"]): 
        return redirect('/admin/?denied=1')

    mensaje = ""
    password_valido = False
    
    if id > '0':
        instance = get_object_or_404(User, id=id)
        perfil_instance = get_object_or_None(Perfil, usuario=instance)
        if not perfil_instance:
            perfil_instance = Perfil.objects.create(usuario=instance, color=random_color())
        password_valido = True
    
    else:
        instance = None
        perfil_instance = None
    
    if request.method == 'POST':
        form = UserForm(request.POST, instance=instance)
        perfil_form = PerfilForm(request.POST, instance=perfil_instance)
        
        password = request.POST.get('password')
        
        if id == '0':
            if password.isalnum():
                password_valido = True
            else:
                mensaje = 'El password tiene caracteres no permitidos.'
             
            if password == '':
                mensaje = 'Este campo es obligatorio.'
        
        if form.is_valid() and perfil_form.is_valid() and password_valido:
            permiso = form.cleaned_data['permiso']
            usuario = form.save(commit=False)
            
            if id == '0':
                usuario.set_password(password)
                
            usuario.last_name = permiso
            usuario.is_superuser = (permiso == 'administrador')
            usuario.save()
            perfil_form.instance.usuario = usuario
            perfil_form.save()
        
            return redirect('usuarios')
    else:
        form = UserForm(instance=instance)
        perfil_form = PerfilForm(instance=perfil_instance)
        
    return {"form":form, 'perfil_form':perfil_form, 'id':id, 'mensaje':mensaje,}
    
@render_to('admin/cambiar_password.html')
def cambiar_password(request, id):
    if no_tiene_permiso(request.user, ["soporte_tecnico"]): 
        return redirect('/admin/?denied=1')
    from forms import UserForm
    instance = get_object_or_404(User, id=id)
    password_valido = False
    title = 'Cambiar contraseña'
    mensaje = ""
    
    if request.method == 'POST':

        password = request.POST.get('password')
        
        if password.isalnum():
            password_valido = True
        else:
            mensaje = 'El password tiene caracteres no permitidos.'
         
        if password == '':
            mensaje = 'Este campo es obligatorio.'
         
        if  password_valido:    
            instance.set_password(password)
            instance.save()
            return redirect('usuarios')

    return {'instance':instance,'title':title, 'mensaje':mensaje}
    
@login_required()
@render_to('admin/eliminar_usuario.html')
def eliminar_usuario(request,id):
    if no_tiene_permiso(request.user, ["soporte_tecnico"]): 
        return redirect('/admin/?denied=1')
    

    usuario = get_object_or_404(User, id=id)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
            try:
                usuario.delete()
            except ProtectedError:
                error = ""
                for b in usuario.bitacoras.all():
                    error = '<div><a href="%s">Ver</a></div>' % b.url()
                return error_view(request, "No se puede eliminar este usuario porque tiene las siguientes bitacoras: %s" % error)
                
            return redirect('usuarios')
        else:
            return redirect('usuario', id)
    
    return {}      

@login_required()
@render_to('admin/administrar_productos.html')
def administrar_productos(request):
    if no_tiene_permiso(request.user, ['productos',]): 
        return redirect('/admin/?denied=1')

    import time
    incompletos = []
    context = {
        'success':request.GET.get('success'), 
        'error':request.GET.get('error'),
    }
    if request.method == 'FILES' or request.method == 'POST':
        for a in Producto.objects.all():
            a.delete()
        productos_file = request.FILES.get('archivo')  
        if not productos_file:
            return redirect('/admin/administrar_productos/?error=Introduzca un archivo')
        
        if not productos_file.name.endswith('.xls'):
            return redirect('/admin/administrar_productos/?error=Debe ser un archivo con terminación xls')
        
        form = ListaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            import xlrd
            wb = xlrd.open_workbook(file_contents=form.instance.archivo.read(),
                                    formatting_info=True)

            hoja=wb.sheet_by_index(0)
            for i in range(1, hoja.nrows):
                a = Producto()
                a.marca = hoja.cell(i,0).value
                a.tipo = hoja.cell(i,1).value
                a.clave = hoja.cell(i,2).value
                a.descripcion = hoja.cell(i,3).value
                if a.marca or a.tipo or a.clave or a.descripcion:
                    if not a.marca.replace(' ', '') or \
                       not a.tipo.replace(' ', '') or \
                       not a.clave.replace(' ', '') or \
                       not a.descripcion.replace(' ', ''):
                        incompletos.append(i + 1)
                        
                    a.save()
    else:
        form = ListaForm()
        
    context['form'] = form
    context['incompletos'] = incompletos
    context['listas'] = Lista.objects.all().order_by('-created')
    return context



@login_required()
@render_to('admin/administrar_directorio.html')
def administrar_directorio(request):
    if no_tiene_permiso(request.user, ["recursos_humanos"]): 
        return redirect('/admin/?denied=1')

    
    if request.method == 'POST':        
        formset = ContactoFS(request.POST)
        if formset.is_valid():
            formset.save()
            return redirect('.')
    else:
        formset = ContactoFS()

    return {'formset':formset }

@render_to('admin/administrar_imagenes.html')
def administrar_imagenes(request):

    if no_tiene_permiso(request.user, ['mercadotecnia',]): 
        return redirect('/admin/?denied=1')
    
    if request.method == 'POST' or request.method == 'FILES':
        formset = ImagenFS(request.POST, request.FILES)
        if formset.is_valid():
            formset.save()
            return redirect('administrar_imagenes')
    else:
        formset = ImagenFS()

    return {'formset':formset }    


@login_required()
@render_to('admin/clientes.html')
def clientes(request):
    if no_tiene_permiso(request.user, ['credito_cobranza', 'administracion_sucursales', 'soporte_tecnico', 'ventas','soluciones_tecnologicas' ]): 
        return redirect('/admin/?denied=1')
        
    form = ClienteFilterForm(request.GET)
    clientes = Cliente.objects.all()
    if form.is_valid():
        q = form.cleaned_data["q"]
        tipo = form.cleaned_data["tipo"]
    sucursal = request.GET.get("sucursal", "")
    if sucursal:
        clientes = clientes.filter(sucursal=sucursal)
    for term in q.split(' '):
        if string_to_int(term):
            clientes = clientes.filter(distribuidor__no_clientes_interno=term)
        else:
            clientes = clientes.filter(Q(nombre__icontains=term) | 
                                        Q(direccion__icontains=term) |
                                        Q(rfc__icontains=term) |
                                        Q(contacto__icontains=term))
            
    if tipo:
        clientes = clientes.filter(distribuidor__tipo_distribuidor=tipo)

    
    from django.db.models import Count
    objects = clientes.annotate(null_position=Count('distribuidor__no_clientes_interno')).order_by('null_position', 'distribuidor__no_clientes_interno')
    from core.models import SUCURSALES
    return { 'pagina':get_pagina(request, objects, 50), 
             'q':q, 'tipo':tipo, 'sucursal':sucursal, 
             'sucursales':SUCURSALES, 'form':form, 
     }
  
@login_required()
@render_to('admin/cliente.html')
def cliente(request, id):
    if no_tiene_permiso(request.user, ['credito_cobranza', 'administracion_sucursales', 'soporte_tecnico', 'ventas','soluciones_tecnologicas' ]): 
        return redirect('/admin/?denied=1')
    
    next = request.GET.get('next', '')
    
    
    if id > '0':
        instance = get_object_or_404(Cliente, id=id, )
    else:
        instance = Cliente()
        
    
    if request.method == 'POST':        
        form = ClienteForm(request.POST, instance=instance)
        if form.is_valid():
            
            if not form.instance.id:
                distribuidor = Distribuidor()
                #distribuidor.razon_social = form.instance.nombre
                #distribuidor.rfc = form.instance.rfc
                distribuidor.distribuidor = False
                distribuidor.tipo_distribuidor = 3
                distribuidor.save()
                form.instance.distribuidor = distribuidor
            
            form.save()
            if not form.instance.distribuidor.vendedor_interno:
                form.instance.distribuidor.vendedor_interno = form.cleaned_data["vendedor"]
                form.instance.distribuidor.save()
            if next == '0':
                return redirect('/admin/agregar_bitacora_garantia/?sucursal=%s' % form.instance.sucursal, )
            elif next == '1':
                return redirect('agregar_bitacora_servicio')
            
            return redirect('clientes')
    else:
        form = ClienteForm(instance=instance)

    return {'form':form,'id':id, 'next':next }
    
@login_required()
@render_to('admin/eliminar_cliente.html')
def eliminar_cliente(request,id):
    if no_tiene_permiso(request.user, ['credito_cobranza',]): 
        return redirect('/admin/?denied=1')
        
    cliente = get_object_or_404(Cliente, id=id)
    mensaje = ""
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
            if cliente.bitacoras.all():
                mensaje = "No se puede eliminar este cliente porque tiene bitacoras asignadas"
                
            else:
                d = cliente.distribuidor
                cliente.delete()
                d.delete()
                return redirect('clientes')
             
        else:
            return redirect('cliente', id)
    
    return {'mensaje':mensaje, "cliente":cliente}   

@render_to('admin/vacantes.html')
def vacantes(request):
    if no_tiene_permiso(request.user, ['recursos_humanos']):
        return redirect('/admin/?denied=1')
        
    q = request.GET.get('q', '')
    objects = Vacante.objects.all()    
    for term in q.split(' '):
        objects = objects.filter(Q(nombre__icontains=term)).order_by('nombre')
    
    return { 'pagina':get_pagina(request, objects, 50), 'q':q }

@login_required()
@render_to('admin/vacante.html')
def vacante(request, id):
    if no_tiene_permiso(request.user, ['recursos_humanos']):
        return redirect('/admin/?denied=1')
    
    if id > '0':
        instance = get_object_or_404(Vacante, id=id, )
    else:
        instance = Vacante()
    
    if request.method == 'POST':        
        form = VacanteForm(request.POST, instance=instance)
        if form.is_valid():
            form.save()
            return redirect('vacantes')
    else:
        form = VacanteForm(instance=instance)

    return {'form':form,'id':id}
    
@login_required()
@render_to('admin/eliminar_vacante.html')
def eliminar_vacante(request,id):
    if no_tiene_permiso(request.user, ['recursos_humanos']): 
        return redirect('/admin/?denied=1')
        
    vacante = get_object_or_404(Vacante, id=id)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
             vacante.delete()
             return redirect('vacantes')
        else:
            return redirect('vacante', id)
    
    return {}    
       
@login_required()
@render_to('admin/solicitudes_trabajo.html')
def solicitudes_trabajo(request):
    if no_tiene_permiso(request.user, ['recursos_humanos']): 
        return redirect('/admin/?denied=1')
        
    solicitudes = SolicitudTrabajo.objects.all()
    return {'solicitudes':solicitudes}

@login_required()
def eliminar_solicitud_trabajo(request, id):
    if no_tiene_permiso(request.user, ['recursos_humanos']): 
        return redirect('/admin/?denied=1')
    solicitud = get_object_or_404(SolicitudTrabajo, id=id)

    solicitud.delete()

    return redirect("solicitudes_trabajo")
    

@render_to('admin/bitacora_no_edit.html')    
def bitacora_no_edit(request):
    return {}

@login_required()
@render_to('admin/agregar_status.html')
def agregar_status(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
        
    bitacora = get_object_or_404(Bitacora, id=id)
    if bitacora.estado == 2 or bitacora.estado == 3:
        return bitacora_no_edit(request)
    
    from django.conf import settings as s
    if bitacora.tipo == 0:
        url = 'bitacora_garantia'
        email_bcc = [s.EMAIL_AVANCE_G]
    elif bitacora.tipo == 1:
        url = 'bitacora_servicio'
        email_bcc = [s.EMAIL_AVANCE_S]
    elif bitacora.tipo == 2:
        url = 'bitacora_interno'
        email_bcc = [s.EMAIL_AVANCE_I, s.EMAIL_AVANCE_I2]
    
    elif bitacora.tipo == 4:
        url = 'bitacora_sertec'
        email_bcc = [s.EMAIL_AVANCE_I, s.EMAIL_AVANCE_I2]
    
    if request.method == 'POST':        
        form = StatusForm(request.POST)
        if form.is_valid():
            form.instance.usuario = request.user
            form.instance.bitacora = bitacora
            form.save()
            bitacora.estado = 1
            bitacora.usuario_modificado = request.user
            bitacora.save()
            
            
            if bitacora.tipo != 2:
            
                asunto = "Se ha agregado un nuevo status a su equipo. Folio: %s" % form.instance.bitacora.folio
                variables = {'status':form.instance, 'bitacora':bitacora ,'url':s.ROOT_URL} 
                t = get_template("admin/mensaje_status.txt")
                body = t.render(Context(variables))
                email = EmailMessage(asunto, body, to=[bitacora.cliente.email, ], bcc=email_bcc)
                email.send()
            else:
                asunto = "Avance de reporte interno #%s" % form.instance.bitacora.folio
                
                body = """
Usuario solicitud: %s
Falla: %s
Usuario del avance: %s
Avance: %s
""" % (form.instance.bitacora.usuario.first_name, form.instance.bitacora.falla, form.instance.usuario.first_name, form.instance.status)
                email = EmailMessage(asunto, body, to=[bitacora.usuario.email, ], bcc=email_bcc)
                email.send()



            return redirect(url, id)
    else:
        form = StatusForm()

    return {'form':form, 'bitacora':bitacora} 

@login_required()
@render_to('admin/bitacora_sertec.html')
def agregar_bitacora_sertec(request):
    
    if no_tiene_permiso(request.user, ['telemarketing', 'administracion_sucursales', 'soporte_tecnico', "ventas", ]): 
        return redirect('/admin/?denied=1')
        
    instance = Bitacora(tipo=4)
    sucursal = request.GET.get("sucursal")
    titulo = u"PÓLIZA DE SERVICIO TÉCNICO"
    from datetime import timedelta
    fecha_vencimiento = instance.get_fecha_vencimiento()

    if request.method == 'POST':        
        form = BitacoraSerTecForm(request.POST, instance=instance)
        cliente_id = request.POST.get("cliente_id")
        form_c = ClienteForm(prefix="cliente")
        if cliente_id:
            instance_cliente = get_object_or_None(Cliente, id=cliente_id)
            if not instance_cliente:
                return error_view(request, "Hubo un error al editar el cliente")
            form_c = ClienteForm(request.POST, instance=instance_cliente, prefix="cliente")
            if form_c.is_valid():
                form_c.save() 
                if not form_c.instance.distribuidor.vendedor_interno:  
                    form_c.instance.distribuidor.vendedor_interno = form_c.cleaned_data["vendedor"]
                    form_c.instance.distribuidor.save()
        if form.is_valid(): 
            if not cliente_id:
                return error_view(request, "Hubo un error al editar el cliente")           
            form.instance.usuario_modificado = request.user
            form.instance.usuario = request.user
            form.instance.estado = 0
            form.instance.fecha = datetime.today()
            form.instance.folio = get_folio(4)
            form.save()
            form.instance.guia = "%04d%s" % (form.instance.folio,random_password(3,'0123456789'))                
            form.save()
            """            
            txt = u'''Se ha generado la siguiente póliza de servicio:
Usuario: %s
Cliente: %s
Tipo garantía: %s
Descripcion producto: %s
Falla: %s
            ''' % (form.instance.usuario.first_name, form.instance.cliente.nombre, form.instance.get_tipo_garantia_display(), form.instance.descripcion, form.instance.falla)
            
            e = EmailMessage(u'Póliza de servicio técnico #%s' % form.instance.folio, txt, 
                             to=['garantias@compuproveedores.com', ], 
                             cc=['soporte@compuproveedores.com', ])
            e.send(fail_silently=False)"""

            return redirect("bitacoras_sertec")
            return bitacora_guardada(request,form.instance)
    else:
        form = BitacoraSerTecForm(instance=instance)
        form_c = ClienteForm(prefix="cliente")

    return {'form':form, 'success':request.GET.get('success'), 
            'id':id,'fecha_vencimiento':fecha_vencimiento, 'sucursal':sucursal,
            'form_c':form_c,'titulo':titulo, "folio":get_folio(4), "fecha":date.today() }  
@login_required()
@render_to('admin/bitacoras_sertec.html')
def bitacoras_sertec(request):
    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
        
    bitacoras = Bitacora.objects.filter(tipo=4).order_by('-folio')
    form = FiltroBitacoraGarantiaForm(request.GET)
    if form.is_valid():
        bitacoras = get_bitacoras(form, bitacoras, 4)
            
    return { 'pagina':get_pagina(request, bitacoras, 25),'form':form}
     
@login_required()
@render_to('admin/bitacoras_garantia.html')
def bitacoras_garantia(request):
    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
        
    bitacoras = Bitacora.objects.filter(tipo=0).order_by('-folio')
    form = FiltroBitacoraGarantiaForm(request.GET)
    if form.is_valid():
        bitacoras = get_bitacoras(form, bitacoras, 0)
            
    return { 'pagina':get_pagina(request, bitacoras, 25),'form':form}

@login_required()
@render_to('admin/bitacora_garantia.html')
def agregar_bitacora_garantia(request):
    
    if no_tiene_permiso(request.user, ['telemarketing', 'administracion_sucursales', 'soporte_tecnico', "ventas", ]): 
        return redirect('/admin/?denied=1')
        
    instance = Bitacora(tipo=0)
    sucursal = request.GET.get("sucursal")
    titulo = "SOLICITUD DE GARANTÍA"
    from datetime import timedelta
    fecha_vencimiento = instance.get_fecha_vencimiento()

    if request.method == 'POST':        
        form = BitacoraGarantiaForm(request.POST, instance=instance)
        cliente_id = request.POST.get("cliente_id")
        form_c = ClienteForm(prefix="cliente")
        if cliente_id:
            instance_cliente = get_object_or_None(Cliente, id=cliente_id)
            if not instance_cliente:
                return error_view(request, "Hubo un error al editar el cliente")
            form_c = ClienteForm(request.POST, instance=instance_cliente, prefix="cliente")
            if form_c.is_valid():
                form_c.save() 
                if not form_c.instance.distribuidor.vendedor_interno:  
                    form_c.instance.distribuidor.vendedor_interno = form_c.cleaned_data["vendedor"]
                    form_c.instance.distribuidor.save()
        if form.is_valid(): 
            if not cliente_id:
                return error_view(request, "Hubo un error al editar el cliente")           
            form.instance.usuario_modificado = request.user
            form.instance.usuario = request.user
            form.instance.estado = 0
            form.instance.fecha = datetime.today()
            form.instance.folio = get_folio(0)
            form.save()
            form.instance.guia = "%04d%s" % (form.instance.folio,random_password(3,'0123456789'))                
            form.save()
            
            txt = u'''Se ha generado la siguiente solicitud de garantía:
Usuario: %s
Cliente: %s
Tipo garantía: %s
Descripcion producto: %s
Falla: %s
            ''' % (form.instance.usuario.first_name, form.instance.cliente.nombre, form.instance.get_tipo_garantia_display(), form.instance.descripcion, form.instance.falla)
            
            e = EmailMessage(u'Solicitud de garantía #%s' % form.instance.folio, txt, 
                             to=['garantias@compuproveedores.com', ], 
                             cc=['soporte@compuproveedores.com', ])
            e.send(fail_silently=False)
            
            return redirect("bitacoras_garantia")
            return bitacora_guardada(request,form.instance)
    else:
        form = BitacoraGarantiaForm(instance=instance)
        form_c = ClienteForm(prefix="cliente")

    return {'form':form, 'success':request.GET.get('success'), 
            'id':id,'fecha_vencimiento':fecha_vencimiento, 'sucursal':sucursal,
            'form_c':form_c,'titulo':titulo, "folio":get_folio(0), "fecha":date.today() }  
    
@login_required()
@render_to('admin/bitacora_sertec.html')
def bitacora_sertec(request, id):

    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
    tipo = 4
    titulo = "PÓLIZA DE SERVICIO TÉCNICO"
    sucursal = request.GET.get("sucursal")
    instance = get_object_or_404(Bitacora, id=id, tipo=tipo)
    anteriores = Bitacora.objects.filter(folio__lt=instance.folio, tipo=4).order_by('-folio', "id")
    anterior = anteriores[0] if anteriores else None 

    siguientes = Bitacora.objects.filter(folio__gt=instance.folio, tipo=4).order_by('folio', "id")
    siguiente = siguientes[0] if siguientes else None
    user = request.user
    editar = True if user.is_superuser or user.last_name == "soporte_tecnico" else False
    if request.method == 'POST':        
        form = EditarBitacoraSerTecForm(request.POST, instance=instance)
        
        if form.is_valid():    
            form.instance.usuario_modificado = request.user   
            form.save()

            return redirect('admin')
    else:
        form = EditarBitacoraSerTecForm(instance=instance)

    return {'form':form, 'id':id, 'sucursal':sucursal, 'editar':editar, 
            'titulo':titulo, "anterior":anterior, "siguiente":siguiente,} 


    
@login_required()
@render_to('admin/renovar_bitacora_sertec.html')
def renovar_bitacora_sertec(request, id):

    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
    
    from datetime import timedelta
    titulo = "RENOVACIÓN DE PÓLIZA"
    sertec = get_object_or_404(Bitacora, id=id, tipo=4)
    if request.method == 'POST':        
        form = BitacoraRenovacionSertec(request.POST, request.FILES)
        if form.is_valid():    
            instance = sertec
            b = get_object_or_404(Bitacora, id=id, tipo=4)
            instance.id = None
            instance.folio = None
            instance.fecha = sertec.fecha_vencimiento + timedelta(days=1)
            instance.set_folio()
            instance.no_years = string_to_int(form.cleaned_data["no_years"])
            instance.factura_costo_garantia = form.cleaned_data["factura_costo_garantia"]
            instance.poliza_original = b
            instance.save()

            if instance.cliente.email:
                txt = u'''Se ha renovado la póliza de servicio %s:
Tipo garantía: %s
Folio: #%s
Descripcion producto: %s
Falla: %s
            ''' % (b.folio, instance.get_tipo_garantia_display(), instance.folio, instance.descripcion, instance.falla)
            
                e = EmailMessage(u'Renovación de póliza de servicio técnico #%s' % b.folio, txt, 
                                 to=[instance.cliente.email, ], 
                                 cc=['soporte@compuproveedores.com', ])
                e.send(fail_silently=False)
    else:
        form = BitacoraRenovacionSertec()

    return {
        'form':form, 
        'titulo':titulo,
        "sertec":sertec,
    } 

@login_required()
@render_to('admin/bitacora_garantia.html')
def bitacora_garantia(request, id):

    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
    tipo = 0
    titulo = "SOLICITUD DE GARANTÍA"
    sucursal = request.GET.get("sucursal")
    instance = get_object_or_404(Bitacora, id=id, tipo=tipo)
    anteriores = Bitacora.objects.filter(folio__lt=instance.folio, tipo=0).order_by('-folio', "id")
    anterior = anteriores[0] if anteriores else None 

    siguientes = Bitacora.objects.filter(folio__gt=instance.folio, tipo=0).order_by('folio', "id")
    siguiente = siguientes[0] if siguientes else None
        

    user = request.user
    editar = True if user.is_superuser or user.last_name == "soporte_tecnico" else False
    if request.method == 'POST':        
        form = EditarBitacoraGarantiaForm(request.POST, instance=instance)
        
        if form.is_valid():    
            form.instance.usuario_modificado = request.user   
            form.save()

            return redirect('admin')
    else:
        form = EditarBitacoraGarantiaForm(instance=instance)

    return {'form':form, 'id':id, 'sucursal':sucursal, 'editar':editar, 
            'titulo':titulo, "anterior":anterior, "siguiente":siguiente,} 

#@login_required()
def pdf_tablas(request, id):
    #if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
    #    return redirect('/admin/?denied=1')
        
    bitacora = get_object_or_404(Bitacora, id=id)
    
    return render_to_pdf('tablas_2_pdf.html', 
        { 'bitacora':bitacora,  }, debug=request.GET.get('debug', False))
                
@login_required()
#@render_to("impresion_garantia_3.html")
def imprimir_bitacora_garantia(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')

    from django.conf import settings as s
    bitacora = get_object_or_404(Bitacora, id=id, tipo=0)
    atenciones = [
        'Original: Compuproveedores S.A DE C.V', 
        'Copia: Soporte Técnico',
        'Copia: Cliente', 
    ]
    template = 'impresion_garantia_3.html' #if bitacora.tipo_garantia != 3 \
                                           #else 'impresion_procesadores_partes_3.html'
    
    #return { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL}        
    return render_to_pdf(template, 
        { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL}, debug=request.GET.get('debug', False))


@login_required()
@render_to('admin/bitacoras_interno.html')
def bitacoras_interno(request):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    
    bitacoras = Bitacora.objects.filter(tipo=2).order_by('-folio')
    form = BuscarBitacoraInternoForm(request.GET)
    if form.is_valid():
        bitacoras = get_bitacoras(form, bitacoras, 2)
        
    return {'pagina':get_pagina(request, bitacoras, 25), 'form':form }

@login_required()
@render_to('admin/bitacora_interno.html')
def agregar_bitacora_interno(request):

    instance = Bitacora(tipo=2)

    fecha_vencimiento = instance.get_fecha_vencimiento()
    queryset = BitacoraImagen.objects.none()
    if request.method == 'POST':        
        form = BitacoraInternoForm(request.POST, instance=instance)
        formset = BitacoraImagenFS(request.POST, request.FILES, queryset=queryset)
        if form.is_valid() and formset.is_valid():    
            form.instance.usuario_modificado = request.user
            form.instance.usuario = request.user
            form.instance.estado = 0
            form.instance.folio = get_folio(2)
            form.instance.fecha = datetime.today()
            form.save()
            form.instance.guia = "%04d%s" % (form.instance.folio, random_password(3,'0123456789'))
            form.save()
            
            for f in formset.forms:
                f.instance.bitacora = form.instance
            
            formset.save()
            
            txt = u'''Se ha generado la siguiente solicitud interna:
Usuario: %s
Falla: %s
''' % (form.instance.usuario.first_name, form.instance.falla)
            if form.instance.imagenes.all():
                txt += '''Imagenes:
'''
                for i in form.instance.imagenes.all():
                    txt += """%s
""" % (i.imagen.url)
                    
            e = EmailMessage('Solicitud interna #%s' % form.instance.folio, txt, 
                             to=['reportesinternos@compuproveedores.com', ], 
                             cc=['soporte@compuproveedores.com', ])
            e.send(fail_silently=False)
            
            return redirect(".")
            return bitacora_guardada(request, form.instance)
    else:
        form = BitacoraInternoForm(instance=instance)
        formset = BitacoraImagenFS(queryset=queryset)
    return {'form':form, 'success':request.GET.get('success'), 'id':id , 
            'fecha_vencimiento':fecha_vencimiento,
            'formset':formset, "folio":get_folio(2), }
    
@login_required()
@render_to('admin/bitacora_interno.html')
def bitacora_interno(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico']): 
        return redirect('/admin/?denied=1')
    tipo = 2
    
    instance = get_object_or_404(Bitacora, id=id, tipo=tipo)
    anteriores = Bitacora.objects.filter(fecha__lt=instance.fecha, tipo=2).order_by('-fecha', "id")
    anterior = anteriores[0] if anteriores else None 

    siguientes = Bitacora.objects.filter(fecha__gt=instance.fecha, tipo=2).order_by('fecha', "id")
    siguiente = siguientes[0] if siguientes else None
    if request.method == 'POST':        
        form = BitacoraInternoForm(request.POST, instance=instance)
        
        if form.is_valid():
            form.instance.usuario_modificado = request.user        
            form.save()

            return redirect('admin')
    else:
        form = BitacoraInternoForm(instance=instance)

    return {'form':form, 'id':id, "anterior":anterior, "siguiente":siguiente,}
    

@login_required()
def imprimir_bitacora_interno(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    
    from django.conf import settings as s
        
    bitacora = get_object_or_404(Bitacora, id=id, tipo=2)
    atenciones = [
        'Original: Compuproveedores, S.A. de C.V.', 
        'Copia: Soporte Técnico', 
    ]
    
    
    return render_to_pdf('impresion_interno_2.html', 
        { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL, },  debug=False)
    
@login_required()
@render_to('admin/bitacoras_servicio.html')
def bitacoras_servicio(request):
    if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
    
    bitacoras = Bitacora.objects.filter(tipo=1).order_by('-folio')
    form = BuscarBitacoraForm(request.GET)
    
    if form.is_valid():
        bitacoras = get_bitacoras(form, bitacoras, 1)
    
    return {'pagina':get_pagina(request, bitacoras, 25), 'form':form}

@login_required()
@render_to('admin/cancelar_bitacora.html')
def cancelar_bitacora(request, id, tipo):

    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
        
    bitacora = get_object_or_404(Bitacora, id=id, tipo=tipo)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
             bitacora.estado = 3
             bitacora.save()
             return redirect(bitacora.url())
        else:
            return redirect(bitacora.url())
    
    return {}  

@login_required()
@render_to('admin/cerrar_bitacora.html')
def cerrar_bitacora(request,id, tipo):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
        
    bitacora = get_object_or_404(Bitacora, id=id, tipo=tipo)
    
    if bitacora.tipo == 0:
        url = 'bitacora_garantia'
        tipo = u'Garantía'
        asunto = u"Cierre de garantía #%s" % bitacora.folio
        to_email = ["garantias@compuproveedores.com"]
        info_extra = u"""Tipo garantía: %s
Descripción producto: %s
""" % (bitacora.get_tipo_garantia_display(), bitacora.descripcion)
        if bitacora.garantia_costo and not bitacora.factura_costo_garantia:
            return error_view(request, "Es nesesario llenar el campo de documento de cobro.")
        
    if bitacora.tipo == 1:
    
        if not bitacora.factura_costo_garantia:
            return error_view(request, "Es nesesario llenar el campo de documento de cobro.")
    
        url = 'bitacora_servicio'
        tipo = u'Servicio'
        asunto = u"Cierre de servicio #%s" % bitacora.folio
        to_email = ["servicios@compuproveedores.com"]
        info_extra = u"""Tipo servicio: %s
Lugar: %s
Tipo equipo: %s
""" % (bitacora.get_tipo_servicio_display(),
       bitacora.get_lugar_servicio_display(),
       bitacora.get_tipo_equipo_display(),
      )
    
    if bitacora.tipo == 2:
        url = 'bitacora_interno'
        tipo = u'Solicitud Interna'
        asunto = u"Cierre de reporte interno #%s" % bitacora.folio
        info_extra = ""
        to_email = ["reportesinternos@compuproveedores.com"]
    
    if bitacora.tipo == 4:
        url = 'bitacora_sertec'
        tipo = u'Servicio Tecnico'
        asunto = u"Cierre servicio tecnico #%s" % bitacora.folio
        info_extra = ""
        to_email = ["servicios@compuproveedores.com"]
    

    if request.method == 'POST':
        import datetime
        si = request.POST.get('si')
            
        if si:
             bitacora.estado = 2    
             bitacora.fecha_cierre = datetime.datetime.today()
             bitacora.save()
             
             txt = u'''Se ha cerrado %s #%s:
Usuario inicial: %s
%s
Falla: %s
Usuario modificado: %s
Observaciones: %s
            ''' % (tipo, bitacora.folio, bitacora.usuario.first_name, info_extra, bitacora.usuario_modificado.first_name, bitacora.falla, bitacora.observaciones)
            
             e = EmailMessage(asunto, txt, to=to_email, cc=['soporte@compuproveedores.com', ])
             e.send(fail_silently=False)
             
        
        return redirect(url, id)
    
    return {}
    
@login_required()
@render_to('admin/direcciones_email.html')
def direcciones_email(request):
    if no_tiene_permiso(request.user, ["mercadotecnia"]): 
        return redirect('/admin/?denied=1')
     
    form = BuscarForm(request.GET, request.FILES)
    if form.is_valid():
        q = form.cleaned_data['q']
        activos = form.cleaned_data['activos']
        
        solicitud = SolicitudTrabajo.objects.filter(
                Q(nombre__icontains=q) |
                Q(email__icontains=q)).exclude(email="")
        distribuidor = Distribuidor.objects.filter(
                Q(razon_social__icontains=q) |
                Q(representante_email__icontains=q)).exclude(representante_email="")
        cliente = Cliente.objects.filter(
                Q(nombre__icontains=q) | 
                Q(email__icontains=q)).exclude(email="")
                
        mensaje = MensajeContacto.objects.filter(
                Q(nombre__icontains=q) |
                Q(email__icontains=q)).exclude(email="")
        

        if activos == '1':
            solicitud = solicitud.filter(desactivar_email=False, email__icontains="@")
            distribuidor = distribuidor.filter(desactivar_email=False)
            cliente = cliente.filter(desactivar_email=False)
            mensaje = mensaje.filter(desactivar_email=False)
            
        if activos == '2':
            solicitud = solicitud.filter(desactivar_email=True)
            distribuidor = distribuidor.filter(desactivar_email=True)
            cliente = cliente.filter(desactivar_email=True)
            mensaje = mensaje.filter(desactivar_email=True)
            
        direcciones_email = chain_order('nombre', False, solicitud, distribuidor, cliente, mensaje)
    return {'pagina':get_pagina(request, direcciones_email, 50), 'form':form}

@login_required()
@render_to('admin/desactivar_email.html')
def desactivar_email(request, id, tipo):
    if no_tiene_permiso(request.user, ["mercadotecnia"]): 
        return redirect('/admin/?denied=1')
    
    if request.method == 'POST':
        si = request.POST.get('si')
        no = request.POST.get('no')
        
        def desactivar(des):
            des.desactivar_email = True
            des.save()
            
        if si:
            
            if tipo == '1':
                desactivar(get_object_or_404(Distribuidor, id=id))
            elif tipo == '2':
                desactivar(get_object_or_404(SolicitudTrabajo, id=id))
            elif tipo == '3':    
                desactivar(c = get_object_or_404(Cliente, id=id))
            elif tipo == '4':
                desactivar(get_object_or_404(MensajeContacto, id=id))
           

        return redirect('direcciones_email')
        
    return {}

@login_required()
@render_to('admin/activar_email.html')
def activar_email(request, id, tipo):
    if no_tiene_permiso(request.user, ["mercadotecnia"]): 
        return redirect('/admin/?denied=1')
    
    if request.method == 'POST':
        si = request.POST.get('si')
        no = request.POST.get('no')
        
        def Activar(des):
            des.desactivar_email = False
            des.save()
            
        if si:
            
            if tipo == '1':
                Activar(get_object_or_404(Distribuidor, id=id))
            elif tipo == '2':
                Activar(get_object_or_404(SolicitudTrabajo, id=id))
            elif tipo == '3':    
                Activar(c = get_object_or_404(Cliente, id=id))
            elif tipo == '4':
                Activar(get_object_or_404(MensajeContacto, id=id))
           

        return redirect('direcciones_email')
        
    return {}

@login_required()
@render_to('admin/bitacora_servicio.html')
def agregar_bitacora_servicio(request):

    if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas"]): 
        return redirect('/admin/?denied=1')
        
    instance = Bitacora(tipo=1)
     
    fecha_vencimiento = instance.get_fecha_vencimiento()
    if request.method == 'POST':        
        form = BitacoraServicioForm(request.POST, instance=instance)
        cliente_id = request.POST.get("cliente_id")
        form_c = ClienteForm(prefix="cliente")
        if cliente_id:
            instance_cliente = get_object_or_None(Cliente, id=cliente_id)
            if not instance_cliente:
                return error_view(request, "Hubo un error al editar el cliente")
            form_c = ClienteForm(request.POST, instance=instance_cliente, prefix="cliente")
            if form_c.is_valid():
                form_c.save()   

        if form.is_valid(): 
            if not cliente_id:
                return error_view(request, "Hubo un error al editar el cliente") 

            form.instance.usuario_modificado = request.user
            form.instance.tipo = 1
            form.instance.estado = 0
            form.instance.fecha = datetime.today()
            form.instance.folio = get_folio(1)
            form.instance.usuario = request.user
            form.instance.guia = "%04d%s" % (form.instance.folio,random_password(3,'0123456789'))
            
            form.save()
            
            txt = u'''Se ha generado la siguiente solicitud de servicio:
Usuario: %s
Cliente: %s
Lugar: %s
Tipo reporte: %s
Tipo equipo: %s
Falla: %s
            ''' % (form.instance.usuario.first_name, form.instance.cliente.nombre, form.instance.get_lugar_servicio_display(), form.instance.get_tipo_servicio_display(), form.instance.get_tipo_equipo_display(), form.instance.falla)
            
            e = EmailMessage(u'Solicitud de servicio #%s' % form.instance.folio, txt, 
                             to=['servicios@compuproveedores.com', ], 
                             cc=['soporte@compuproveedores.com', ])
            e.send(fail_silently=False)
            return redirect("bitacoras_servicio")
            return bitacora_guardada(request,form.instance)
    else:
        form = BitacoraServicioForm(instance=instance)
        form_c = ClienteForm(prefix="cliente")

    return {'form':form, 'success':request.GET.get('success'), 
            'id':id, 'fecha_vencimiento':fecha_vencimiento,
            'form_c':form_c, "folio":get_folio(1), "fecha":date.today() }

    
@login_required()
@render_to('admin/bitacora_servicio.html')
def bitacora_servicio(request, id):

    if no_tiene_permiso(request.user, ['soporte_tecnico']): 
        return redirect('/admin/?denied=1')
        
    tipo = 1

    instance = get_object_or_404(Bitacora, id=id, tipo=tipo)

    anteriores = Bitacora.objects.filter(fecha__lt=instance.fecha, tipo=1).order_by('-fecha')
    anterior = anteriores[0] if anteriores else None 

    siguientes = Bitacora.objects.filter(fecha__gt=instance.fecha, tipo=1).order_by('fecha')
    siguiente = siguientes[0] if siguientes else None
        


    if request.method == 'POST':        
        form = EditarBitacoraServicioForm(request.POST, instance=instance)
        if form.is_valid():  
            form.instance.usuario_modificado = request.user
            form.save()
            if form.instance.fecha_termino:
                form.instance.fecha_vencimiento = form.instance.fecha_termino
            
            return redirect('admin')
    else:
        form = EditarBitacoraServicioForm(instance=instance)

    return {'form':form, 'id':id, "anterior":anterior, "siguiente":siguiente, }


@render_to('admin/bitacora_guardada.html')
def bitacora_guardada(request, bitacora):
    return {'bitacora':bitacora}

@login_required()
def imprimir_bitacora_sertec(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    
    from django.conf import settings as s
        
    bitacora = get_object_or_404(Bitacora, id=id, tipo=4)
    atenciones = [
        'Original: Compuproveedores, S.A. de C.V.', 
        'Copia: Cliente', 
        'Copia: Soporte Técnico'
    ]
    from datetime import date
    return render_to_pdf('impresion_sertec_3.html', 
        { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL, 
        'now':date.today(),
    },  debug=False)

@login_required()
def imprimir_bitacora_servicio(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    
    from django.conf import settings as s
        
    bitacora = get_object_or_404(Bitacora, id=id, tipo=1)
    atenciones = [
        'Original: Compuproveedores, S.A. de C.V.', 
        'Copia: Cliente', 
        'Copia: Soporte Técnico'
    ]
    #return  { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL, }
    return render_to_pdf('impresion_servicio_3.html', 
        { 'bitacora':bitacora, 'atenciones':atenciones, 'root_url':s.ROOT_URL, },  debug=False)

@login_required()
@render_to('admin/subir_clientes.html')
def subir_clientes(request):
    if no_tiene_permiso(request.user, ['credito_cobranza',]): 
        return redirect('/admin/?denied=1')
        
    import time
    repetidos = []
    context = {
        'success':request.GET.get('success'), 
        'error':request.GET.get('error'),
    }
    if request.method == 'POST':
        form = ImportarClienteForm(request.POST, request.FILES)

        if form.is_valid():
            productos_file = form.cleaned_data["archivo"]
            sucursal = form.cleaned_data["sucursal"]
            
            import xlrd
            wb = xlrd.open_workbook(file_contents=productos_file.read(),
                                    formatting_info=True)

            hoja=wb.sheet_by_index(0)
            for i in range(2, hoja.nrows):
                numero = xls_value(hoja.cell(i,0).value)
                nombre = xls_value(hoja.cell(i,2).value)
                if nombre:
                    cliente = get_object_or_None(Cliente, nombre=nombre, sucursal=sucursal)

                    if not cliente:
                        distribuidor = Distribuidor()
                        distribuidor.distribuidor = False
                        distribuidor.tipo_distribuidor = 3
                        distribuidor.save()
                        cliente = Cliente()
                        cliente.distribuidor = distribuidor
                        
                    rfc = xls_value(hoja.cell(i,1).value).replace(" ", "")
                    
                    poblacion = xls_value(hoja.cell(i,3).value)
                    calle = xls_value(hoja.cell(i,4).value)
                    municipio = xls_value(hoja.cell(i,5).value)
                    telefono = xls_value(hoja.cell(i,6).value)
                    fax = xls_value(hoja.cell(i,7).value)
                    email = xls_value(hoja.cell(i,8).value)
                    clave_vendedor = xls_value(hoja.cell(i,9).value)
                    
                    #vendedor = get_object_or_None(Vendedor, folio=clave_vendedor)
                    #distribuidor.no_clientes_interno=numero
                    #distribuidor.razon_social = nombre
                    #distribuidor.domicilio =  calle
                    #distribuidor.ciudad = municipio
                    #distribuidor.rfc = rfc
                    #distribuidor.telefono = telefono
                    #distribuidor.vendedor = vendedor
                    #distribuidor.sucursal = sucursal
                    #distribuidor.distribuidor = (clasificacion =='D')
                    #distribuidor.pagina_web_pago = email
                    #distribuidor.correo_envio_facturas = email
                    #distribuidor.save()

                    
                   
                    if not cliente.rfc:
                        cliente.rfc = rfc
                    if not cliente.nombre:
                        cliente.nombre = nombre
                    if not cliente.sucursal:
                        cliente.sucursal = sucursal
                    if not cliente.direccion:
                        cliente.direccion = calle
                    if not cliente.ciudad:
                        cliente.ciudad = municipio
                    #if not cliente.estado:
                    #    cliente.estado = estado
                    if not cliente.telefono:
                        cliente.telefono = telefono
                    if not cliente.email:
                        cliente.email = email

                    
                    
                    #sc = SolicitarCredito.objects.get_or_create(distribuidor=distribuidor)
                    #sc.distribuidor = (clasificacion =='D')
                    #sc.Correo o Página Web	
                    #Día de revisión 	
                    #Día de pago 	
                    #Días de crédito 	
                    #Límite de crédito 
                    
                    cliente.save()

            return redirect("clientes")
    else:
        form = ImportarClienteForm()

    context['repetidos'] = 0
    context["form"] = form
    return context
    
    
@login_required()
def generar_clave_distribuidor(request, id):
    if no_tiene_permiso(request.user, ["credito_cobranza"]): 
        return redirect('/admin/?denied=1')

    from functions import random_password
    import datetime
    d = get_object_or_404(Distribuidor,id=id)
    d.clave_modificacion = random_password(50)
    d.fecha_clave = datetime.date.today()
    d.save()
    msg = u"""
Se ha generado una solicitud de actualización de información como distribuidor de COMPUPROVEEDORES, SA. DE C.V., para continuar es necesario acceder a la siguiente liga: %s%s
        """ % (settings.ROOT_URL, reverse('modificacion_distribuidor',args=[id, d.clave_modificacion]))    
    email = EmailMessage('Actualizacion de datos del distibuidor', msg, to=[d.representante_email], bcc=[settings.EMAIL_MODIFICACION_DISTRIBUIDOR])
    email.send(fail_silently=False)

    liga = "%s?success=Se ha enviado el correo correctamente" % (
        reverse('admin')
    )
    return redirect(liga)
   

@login_required()    
@render_to('admin/solicitudes_credito_distribuidor.html')
def solicitudes_credito_distribuidor(request,):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')
        
    form = SolicitudCreditoFilterForm(request.GET)
    solicitudes = SolicitarCredito.objects.filter(distribuidor=True)
    if form.is_valid():
        q = form.cleaned_data['q']
        if q:
            for term in q.split(' '):
                solicitudes = solicitudes.filter(razon_social__icontains=term 
                                                ).order_by('razon_social')
    
    return { 'pagina':get_pagina(request, solicitudes, 50), 'q':q, 'form':form,  }   

@login_required()    
@render_to('admin/solicitud_credito_distribuidor.html')
def solicitud_credito_distribuidor(request, distribuidor_id):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')
    distribuidor = get_object_or_404(Distribuidor, id=distribuidor_id)
    instance = SolicitarCredito.objects.get_or_create(dist=distribuidor)[0]
    if request.method == "POST":
        form = SolicitarCreditoAdminForm(request.POST, request.FILES, instance=instance)
    
        if form.is_valid():
            form.save()
            return redirect(".")
    
    else:
        form = SolicitarCreditoAdminForm(instance=instance)    

    return {'solicitud':instance, 'form':form, } 
    
    
@login_required()    
@render_to('admin/solicitudes_credito_empresas.html')
def solicitudes_credito_empresas(request,):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')
        
    form = SolicitudCreditoFilterForm(request.GET)
    solicitudes = SolicitarCredito.objects.filter(distribuidor=False)
    if form.is_valid():
        q = form.cleaned_data['q']

        if q:
            for term in q.split(' '):
                solicitudes = solicitudes.filter(razon_social__icontains=term
                                                ).order_by('razon_social')
    
    return { 'pagina':get_pagina(request, solicitudes, 50), 'q':q, 'form':form,  }   

@login_required()    
@render_to('admin/solicitud_credito_empresas.html')
def solicitud_credito_empresas(request, id):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')
    
    instance = get_object_or_404(SolicitarCredito, id=id)
        
    if request.method == "POST":
        form = SolicitarCreditoAdminForm(request.POST, instance=instance)
    
        if form.is_valid():
            form.save()
            return redirect(".")
    
    else:
        form = SolicitarCreditoAdminForm(instance=instance)    


    return {'solicitud':instance, 'form':form, }
    
@login_required()
@render_to('admin/ver_distribuidor.html')
def ver_distribuidor(request, id):
    if no_tiene_permiso(request.user, ['credito_cobranza',]):
        return redirect('/admin/?denied=1')

    instance = get_object_or_404(Distribuidor, id=id)
    es_distribuidor = instance.distribuidor
    if request.method == 'POST':
        form = DistribuidorInternoForm(request.POST,request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            return redirect('ver_distribuidor', form.instance.id)
    else:
        form = DistribuidorInternoForm(instance=instance)
    
    return {'distribuidor':instance, 'form':form, }
    
@login_required()
@render_to('admin/marca_categoria.html')
def marca_categoria(request):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    urls = MarcaCategoria.objects.all()
    marca = Marca.objects.all()
    categoria = Categoria.objects.all()
    
    
    return {'marca':marca, 'categoria':categoria,'urls':urls }

@login_required()
@render_to('admin/edit_marca.html')
def edit_marca(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')
    
    if id != '0':
        instance = get_object_or_404(Marca, id=id)
    else:
        instance = Marca()
    if request.method == "POST":
        form = MarcaForm(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            return redirect('marca_categoria')
    else:
        form = MarcaForm(instance=instance)

    return {'form':form,'id':id  }
    
@login_required()
@render_to('admin/edit_categoria.html')
def edit_categoria(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    if id != '0':
        instance = get_object_or_404(Categoria, id=id)
    else:
        instance = Categoria()
    if request.method == "POST":
        form = CategoriaForm(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            return redirect('marca_categoria')
    else:
        form = CategoriaForm(instance=instance)
        
    return {'form':form,'id':id  }

@login_required()
@render_to('admin/edit_subcategoria.html')
def edit_subcategoria(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    if id != '0':
        instance = get_object_or_404(SubCategoria, id=id)
    else:
        instance = SubCategoria()
    if request.method == "POST":
        form = SubCategoriaForm(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            return redirect('marca_categoria')
    else:
        form = SubCategoriaForm(instance=instance)
        
    return {'form':form  }

    
@login_required()
@render_to('admin/edit_url.html')
def edit_url(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    if id != '0':
        instance = get_object_or_404(MarcaCategoria, id=id)
    else:
        instance = MarcaCategoria()
    
    if request.method == "POST":
        form = MarcaCategoriaForm(request.POST, request.FILES, instance=instance)
        
        if form.is_valid():
            form.save()
            return redirect('marca_categoria')
    else:
        form = MarcaCategoriaForm(instance=instance)
   
    return {'form':form,'id':id }        

@login_required()
@render_to('admin/eliminar_marca.html')
def eliminar_marca(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    marca = get_object_or_404(Marca, id=id)
    mensaje = ""
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
            try:
                marca.delete()
                return redirect('marca_categoria')
            except ProtectedError:
                mensaje = "No se puede eliminar esta marca porque esta asignada"
        else:
            return redirect('edit_marca', id)
    
    
 
    return {'mensaje':mensaje}
    
@login_required()
@render_to('admin/eliminar_categoria.html')
def eliminar_categoria(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    categoria = get_object_or_404(Categoria, id=id)
    mensaje = ""
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
            try:
                categoria.delete()
                return redirect('marca_categoria')
            except ProtectedError:
                mensaje = "No se puede eliminar esta categoria porque esta asignada"
        else:
            return redirect('edit_categoria', id)
    
    
 
    return {'mensaje':mensaje}


@login_required()
@render_to('admin/eliminar_subcategoria.html')
def eliminar_subcategoria(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    subcategoria = get_object_or_404(SubCategoria, id=id)
    mensaje = ""
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
            try:
                subcategoria.delete()
                return redirect('marca_categoria')
            except ProtectedError:
                mensaje = "No se puede eliminar esta subcategoria porque esta asignada"
        else:
            return redirect('edit_categoria', id)
    
    
 
    return {'mensaje':mensaje}
    

@login_required()
@render_to('admin/eliminar_url.html')
def eliminar_url(request,id):
    if no_tiene_permiso(request.user, ['ventas',]): 
        return redirect('/admin/?denied=1')

    url = get_object_or_404(MarcaCategoria, id=id)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
             url.delete()
             return redirect('marca_categoria')
        else:
            return redirect('edit_url', id)
    
    return {}   

@login_required()
@render_to('admin/equipo_renta.html')
def equipo_renta(request):
    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas", ]): 
        return redirect('/admin/?denied=1')
  
    equipo = EquipoRenta.objects.all().order_by("disponible")
    form = EquipoRentaFilterForm(request.GET)
    if form.is_valid():
        q = form.cleaned_data['q']
        sucursal = form.cleaned_data['sucursal']
        disponible = form.cleaned_data['disponible']
        if q:
            for term in q.split(" "):
                equipo = equipo.filter(Q(marca__icontains=term)|
                                       Q(modelo__icontains=term)|
                                       Q(descripcion__icontains=term)
                )
        if sucursal:
            equipo = equipo.filter(sucursal=sucursal)
        
        if disponible:
            equipo = equipo.filter(disponible=disponible)
    
    return {'equipo':equipo, 'form':form, }
    

@login_required()
@render_to('admin/edit_equipo_renta.html')
def edit_equipo_renta(request,id):
    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas", ]): 
        return redirect('/admin/?denied=1')

    if id != '0':
        instance = get_object_or_404(EquipoRenta, id=id)
    else:
        instance = EquipoRenta()
    
    if request.method == "POST":
        form = EquipoRentaForm(request.POST, request.FILES, instance=instance)
        if form.is_valid():
            form.save()
            
            return redirect('equipo_renta')
    else:
        form = EquipoRentaForm(instance=instance)
     

    return {'form':form, 'id':id}    

@login_required()
@render_to('admin/eliminar_equipo_renta.html')
def eliminar_equipo_renta(request,id):
    if no_tiene_permiso(request.user, ['telemarketing', 'soporte_tecnico', "ventas", ]): 
        return redirect('/admin/?denied=1')

    #if p_administrador(request):
    #    return redirect('/admin/?denied=1')

    equipo = get_object_or_404(EquipoRenta, id=id)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:  
            try:
                equipo.delete()
                return redirect('equipo_renta')
            except ProtectedError:
                error = "No se pudo eliminar este equipo debido a que se encuentra en la siguiente renta:<br/>"
                error += '<a href="/admin/renta/%s/">Renta</a>' % equipo.detalles.all()[0].renta.id
                
                return error_view(request, error )
        else:
            return redirect('edit_equipo_renta', id)
    
    return {}   
    
@login_required()
@render_to('admin/mensaje_renta.html')
def mensaje_renta(request, id, mod):

    from django.conf import settings
    
    if mod:
        asunto = "Se ha modificado una renta"
    else:
        asunto = "Se ha agregado un nueva renta"
    
    renta = get_object_or_404(Renta, id=id)
    atenciones = ['DIRECCION GENERAL', 'CLIENTE', 'SOPORTE TECNICO', 'EJECUTICO DE CUENTA']
    
    var = { 'atenciones':atenciones, 'renta':renta}
    f = render_to_pdf('renta_pdf_4_pagare.html', var , debug=False) 
    t = get_template("admin/mensaje_renta.txt")
    body = t.render(Context({'renta':renta, 'mod':mod }))
    email = EmailMessage(asunto, body, to=[settings.EMAIL_RENTA, ])
    email.attach('renta_%s.pdf' % id, f.content, f['Content-Type'])
    email.send()

    return {'renta':renta} 

@login_required()
@render_to('admin/rentas.html')
def rentas(request):
    #if no_tiene_permiso(request.user, ['soporte', 'arrendamiento',]): 
    #    return redirect('/admin/?denied=1')
    
    rentas = Renta.objects.all().order_by('folio')
    
    return {'pagina':get_pagina(request, rentas, 25)} 

@login_required()
@render_to('admin/renta.html')
def renta(request, id):
    from django.core.exceptions import ObjectDoesNotExist
    #if no_tiene_permiso(request.user, ['soporte', 'arrendamiento',]): 
    #    return redirect('/admin/?denied=1')

    if id != '0':
        instance = get_object_or_404(Renta, id=id)
        queryset = instance.detalles.all()
 
    else:
        instance = Renta()
        queryset = RentaDetalle.objects.none()

    if request.method == "POST":
        form = RentaForm(request.POST, request.FILES, instance=instance)
        formset = RentaDetalleFS(request.POST, request.FILES, queryset=queryset)
        if form.is_valid() and formset.is_valid():
            error_f = True
            status = form.cleaned_data['status']
            if not status:
                for i,f in enumerate(formset):
                    try:
                        equipo = f.data.get("form-%s-equipo" % i, None)
                        if equipo:
                            error_f = False
                            for i2 in range(0,i):
                                if equipo == f.data.get("form-%s-equipo" % i2, None):
                                    f.errors['equipo'] = "El equipo no esta disponible"
                    except AttributeError:
                        pass
                
                if error_f:
                    formset._non_form_errors  = "Debe de elegir al menos un equipo"
        
        if form.is_valid() and formset.is_valid():
            form.save()
            detalles = formset.save(commit=False)
            for d in detalles:
                d.renta = form.instance
                d.save()  
            
            for rd in form.instance.detalles.all():
                equipo = rd.equipo
                if not form.instance.status:  
                    equipo.disponible = False
                else:
                    equipo.disponible = True
                        
                equipo.save()
            
            if id != '0':
                mod = True
            else:
                mod = False
                
            return mensaje_renta(request, form.instance.id, mod)
    else:
        form = RentaForm(instance=instance)
        formset = RentaDetalleFS(queryset=queryset)
        
    return {'form':form,'formset':formset, 'id':id}     

@login_required()
def renta_pdf(request, id):
    if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
        return redirect('/admin/?denied=1')
    renta = get_object_or_404(Renta, id=id)
    atenciones = [u'DIRECCIÓN GENERAL', 'CLIENTE', 'SOPORTE TECNICO', 'EJECUTIVO DE CUENTA']
    return render_to_pdf('renta_pdf_4_pagare.html', 
        { 'atenciones':atenciones, 'renta':renta}, debug=False)    

@login_required()
@render_to('admin/actividades.html')
def actividades(request):

    from datetime import datetime
    if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas", "soluciones_tecnologicas", ]): 
        return redirect('/admin/?denied=1')
    
    actividades = Actividad.objects.all().order_by('creado')
    
    form = DateForm(request.GET)
    if form.is_valid():
        fecha = form.cleaned_data['fecha']

        if fecha:
            actividades = actividades.filter(fecha_inicio__year=fecha.year)
            actividades = actividades.filter(fecha_inicio__month=fecha.month)
            actividades = actividades.filter(fecha_inicio__day=fecha.day)
    
    return {'actividades':get_pagina(request, actividades, 10), 'form':form} 


@login_required()
@render_to('admin/actividad.html')
def actividad(request, id):

    from django.conf import settings as s
    if id == '0':
        if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas", "soluciones_tecnologicas", ]): 
            return redirect('/admin/?denied=1')
        instance = Actividad()
    else:
        if no_tiene_permiso(request.user, ['soporte_tecnico',]): 
            return redirect('/admin/?denied=1')
        
        instance = get_object_or_404(Actividad, id=id)
    
    if request.method == "POST":
        form = ActividadForm(request.POST, instance=instance)
        
        if form.is_valid():
            form.instance.usuario_creado = request.user
            form.save()
            
            asunto = "Se ha solicitado una actividad" 
            t = get_template("admin/mensaje_actividad.txt")
            body = t.render(Context({'act':form.instance, 'url':s.ROOT_URL}))
            
            email = EmailMessage(
                asunto, body, 
                to=[
                    form.instance.usuario_creado.email, 
                    s.EMAIL_ACTIVIDAD, 
            ])
            email.send()
            return redirect("actividades")
            #return redirect("actividad", form.instance.id)
    else:
        form = ActividadForm(instance=instance)
    
    return {'form':form} 
  
@login_required()
@render_to('admin/confirmar_actividad.html')
def confirmar_actividad(request, id):

    if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas", "soluciones_tecnologicas", ]): 
        return redirect('/admin/?denied=1')
    
    instance = get_object_or_404(Actividad, id=id)
    error = ""
    if request.method == "POST":
        if instance.cancelado or instance.confirmar:
            return redirect(".")
        
        form = ActividadConfirmarForm(request.POST, instance=instance)
        cancelar = request.POST.get("cancelar")
        

        if form.is_valid(): 
            usuario = form.cleaned_data['usuario_asignado']
            
            if cancelar != "cancelar_actividad" and not usuario:
                error = "Este campo es obligatorio"
            else:
                if cancelar == "cancelar_actividad":
                    form.instance.cancelado  = True
                else:
                    form.instance.confirmar = True
                    
                form.save()
                
                if form.instance.cancelado:
                    asunto = "La actividad ha sido cancelada"
                else:
                    asunto = "La actividad ha sido confirmada"
                    
                #t = get_template("admin/actividad_confirmar.txt")
                #body = t.render(Context({'bitacora':b, 'url':settings.ROOT_URL,}))
                body = "La actividad"
                email = EmailMessage(asunto, body, to=[form.instance.usuario_creado.email, ])
                email.send()
          
    else:
        form = ActividadConfirmarForm(instance=instance)
    
    return {'form':form, 'error':error}   
    
@login_required()
@render_to('admin/eliminar_actividad.html')
def eliminar_actividad(request, id):

    if no_tiene_permiso(request.user, ['soporte_tecnico', "ventas", "soluciones_tecnologicas", ]): 
        return redirect('/admin/?denied=1')
        
    actividad = get_object_or_404(Actividad, id=id)
    
    if request.method == 'POST':
        si = request.POST.get('si')
            
        if si:
             actividad.delete()
             return redirect('actividades')
        else:
            return redirect('actividad', id)
    
    return {}   
    
@login_required()
@render_to('admin/encuestas.html')
def encuestas(request):
    if no_tiene_permiso(request.user, ['gerencia_administrativa',]): 
        return redirect('/admin/?denied=1')
    encuestas = EncuestaSatisfaccion.objects.all()

    return {'encuestas':get_pagina(request, encuestas, 10)}  
    
@login_required()
@render_to('admin/ver_encuesta.html')
def ver_encuesta(request, id):
    if no_tiene_permiso(request.user, ['gerencia_administrativa',]): 
        return redirect('/admin/?denied=1')
    instance = get_object_or_404(EncuestaSatisfaccion, id=id)
    
    form = EncuestaSatisfaccionForm(instance=instance)

    return {'form':form}
    
@login_required()
def generar_remitente(request):
    if no_tiene_permiso(request.user, []): 
        return redirect('/admin/?denied=1')
    
    solicitud = SolicitudTrabajo.objects.all()
    distribuidor = Distribuidor.objects.all()
    cliente = Cliente.objects.all()
    mensaje = MensajeContacto.objects.all()
    cadena = ""

    for d in distribuidor:
        cadena += generar_cadena(cadena,d.razon_social, d.representante_email, d.desactivar_email)
    for s in solicitud:
        cadena += generar_cadena(cadena,s.nombre, s.email, s.desactivar_email)
    for c in cliente:
        cadena += generar_cadena(cadena,c.nombre, c.email, c.desactivar_email)
    for m in mensaje:
        cadena += generar_cadena(cadena,m.nombre, m.email, m.desactivar_email)
    
    
    return HttpResponse(cadena[:-1], mimetype="text/plain")    

def aviso_vencimiento(request):

    from datetime import date, timedelta
    from django.conf import settings
    hoy = date.today()
    send = False

    for i in range(0,4):
        if i == 0:
            fecha = hoy + timedelta(days=3)
            title= u"solicitudes de garantía"
            email = "garantias@compuproveedores.com"
            bcc = []
        elif i == 1:
            fecha = hoy
            title= u"solicitudes de servicio"
            email = "servicios@compuproveedores.com"
            bcc=["soporte@compuproveedores.com"]
            
        elif i == 2:
            fecha = hoy
            title = "solicitudes internas"
            email = "reportesinternos@compuproveedores.com"
            bcc=["soporte@compuproveedores.com"]
        
        if i == 3:
            fecha = hoy
            title= u"solicitudes de garantía"
            email = "soporte@compuproveedores.com"
            bcc = []
            i = 0
        
        bs = Bitacora.objects.filter(fecha_vencimiento=fecha, estado__lt=2, tipo=i)
        asunto = u"Vencimientos próximos de %s" % title
        mensaje = "La siguientes %s estan por vencer.\n" % title
        for b in bs:
            send = True
            mensaje += u"""Folio: %s - Vencimiento: %s de %s %s\n""" % (b.folio, b.fecha_vencimiento, b.obtener_cliente(), b.url())
        
        #if send:
        email = EmailMessage(asunto, mensaje, to=[email, ], bcc=bcc)
        email.send()

    rentas = Renta.objects.filter(fecha_final=hoy)
    if rentas:
        asunto = u"Vencimiento de rentas próximo"
        t = get_template("admin/mensaje_renta_aviso.txt")
        body = t.render(Context({'rentas':rentas, 'url':settings.ROOT_URL,}))
        email = EmailMessage(asunto, body, to=[settings.EMAIL_RENTA], bcc=["soporte@compuproveedores.com"])
        email.send()
    
    return HttpResponse(":D")

def aviso_bitacoras_vencidas(request):
    from datetime import date
    from django.conf import settings
    hoy = date.today()
    send = False    
    bitacoras = Bitacora.objects.filter(fecha_vencimiento__lt=hoy, estado__lt=2)
    mensaje = "La siguientes solicitudes estan vencidas.\n"
    asunto = u"Solicitudes vencidas"
    for b in bitacoras:
        send = True
        mensaje += """Folio: %s - Vencimiento: %s de %s %s\n""" % (b.folio, b.fecha_vencimiento, b.obtener_cliente(), b.url())
    if send:
        email = EmailMessage(asunto, mensaje, to=["soporte@compuproveedores.com", ])
        email.send()
    
    return HttpResponse(":D")


@login_required()
@render_to("admin/imagenes_inicio.html")
def imagenes_inicio(request):
    if no_tiene_permiso(request.user, ['mercadotecnia',]): 
        return redirect('/admin/?denied=1')
        
    queryset = ImagenInicio.objects.all()
    if request.method == "POST":
        formset = ImagenInicioFS(request.POST, request.FILES, queryset=queryset)    
        
        if formset.is_valid():
            formset.save()
            return redirect(".")
    else:
        formset = ImagenInicioFS(queryset=queryset)
    
    return {'formset':formset, }


@login_required()
def cliente_contains(request):

    q = request.GET['term']
    sucursal = string_to_int(request.GET.get("sucursal"))
    data = []
    if sucursal:
        clientes = Cliente.objects.filter(sucursal=sucursal)
    else:
        clientes = Cliente.objects.all()
    for term in q.split(" "):
        clientes = clientes.filter(Q(distribuidor__no_clientes_interno__icontains=term) |
                                          Q(nombre__icontains=term) |
                                          Q(rfc__icontains=term)
        )
    
    
    for c in clientes.order_by('distribuidor__no_clientes_interno')[:20]:
        if c.distribuidor.no_clientes_interno:
            label = "%s - %s" % (c.distribuidor.no_clientes_interno, c.nombre)
        else:
            label = "%s" % c.nombre

        vendedor  = c.distribuidor.vendedor_interno if c.distribuidor.vendedor_interno else ""
        vendedor_id = vendedor.id if vendedor else ""
        vendedor_nombre = vendedor.nombre if vendedor else ""
        edit = "/admin/cliente/%s/" % c.id
        data.append({"id":"", 
                     "label":label, 
                     "value":label, 
                     "edit":edit,
                     "numero":c.distribuidor.no_clientes_interno,
                     "rfc":c.rfc,
                     "nombre":c.nombre,
                     "sucursal":c.sucursal,
                     "direccion":c.direccion,
                     "ciudad":c.ciudad,
                     "estado":c.estado,
                     "celular":c.celular,
                     "telefono":c.telefono,
                     "telefono_extra":c.telefono_extra,
                     "email":c.email,
                     "vendedor":vendedor_id,
                     "vendedor_nombre":vendedor_nombre, 
                     "contacto":c.contacto,
                     "ext":c.ext,
                     'id':c.id, 

        })
    
    return json_response(data)
    
    
def database_backup_compuproveedores(request):
    
    import os   
    import time
    from django.conf import settings
    
    fecha = time.strftime("%m%d%H%M")
    out = ""

    path =  settings.DATABASE_BACKUP_PATH
    name = "compuproveedores-%s" % (fecha)
    com_a = "pg_dump --clean compuproveedores -O -f %s/%s.sql" % (path, name)
    os.system(com_a)
    
    path2 = "%s/dbbackups" % settings.STATIC_ROOT
    com_b = "cp %s/%s.sql %s/compuproveedores.sql" % (path, name, path2)
    os.system(com_b)
    out += "%s <br> %s <br>" % (com_a, com_b)
    
    return HttpResponse(out)

@render_to("admin/error_view.html")
def error_view(request, html):
    
    return {'html':mark_safe(html), }


@login_required()
@render_to("admin/mundo_tecnologia.html")
def admin_mundo_tecnologia(request):
    if no_tiene_permiso(request.user, ['mercadotecnia',]): 
        return redirect('/admin/?denied=1')
    queryset = MundoTecnologia.objects.all()
    
    if request.method == "POST":
        formset = MundoTecnologiaFS(request.POST, request.FILES, queryset=queryset)
        if formset.is_valid():
            formset.save()
            return redirect(".")
            
    else:
        formset = MundoTecnologiaFS(queryset=queryset)
        
    
    return {'formset':formset, }
        
        

@never_cache
def json_response(something):
    
    r = HttpResponse(
        simplejson.dumps(something),
        #content_type = 'application/json; charset=utf8'
        content_type = 'text/javascript; charset=UTF-8'
    )
    r['Cache-Control'] = 'no-cache'

    return r


@login_required()
@render_to("admin/editar_distribuidor.html")
def editar_distribuidor(request, id, distribuidor=True):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')
    c = {}
    formset = None
    import datetime
    actualizacion = False
    if distribuidor:
        palabra = "distribuidor"
    else:
        palabra = "cliente"
    
    if id:
        actualizacion = True
        instance = get_object_or_404(Distribuidor,  id=id)
        queryset = instance.personas.all()
     
    else:
        instance = Distribuidor()
        queryset = PersonaAutorizada.objects.none()
       
     
    if request.method == 'POST':        
        form = DistribuidorForm(request.POST, request.FILES, instance=instance)
        if distribuidor:
            form.fields["sucursal"].choices =  ((2, 'HERMOSILLO'), )    
            formset = PersonaAutorizadaFS(request.POST, queryset=queryset)
            formset.forms[0].empty_permitted = False

        formset_valido = formset.is_valid() if distribuidor else True
        if form.is_valid() and formset_valido:
            if distribuidor:
                form.instance.distribuidor = True
            else:
                form.instance.distribuidor = False
            sucursal = form.cleaned_data["sucursal"]

            form.save()

            if distribuidor:
                ds = formset.save(commit=False)            
                for d in ds:
                    d.distribuidor = form.instance
                    d.save()
                    
            if instance.nombre_comercial:
                nombre_comercial=instance.nombre_comercial
            else:
                nombre_comercial = "No tiene"
                    
            return redirect("clientes")
    else:
        form = DistribuidorForm(instance=instance)
        if distribuidor:
            formset = PersonaAutorizadaFS(queryset=queryset)
            form.fields["sucursal"].choices =  ((2, 'HERMOSILLO'), )     

    c['form'] = form
    c['formset'] = formset

    return c

@login_required()
@render_to("admin/catalogo_vendedores.html")
def catalogo_vendedores(request):
    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')

    vendedores = Vendedor.objects.all()

    return {'vendedores':get_pagina(request, vendedores, 20),} 


@login_required()
@render_to("admin/vendedor.html")
def vendedor(request, id):

    if no_tiene_permiso(request.user, ['credito_cobranza', ]): 
        return redirect('/admin/?denied=1')

    if id == "0":
        instance = Vendedor()
    else:
        instance = get_object_or_404(Vendedor, id=id)

    if request.method == "POST":
        form = VendedorForm(request.POST, instance=instance)
        if form.is_valid():
            form.save()
            return redirect("catalogo_vendedores")

    else:
        form = VendedorForm(instance=instance)

    return {'form':form}

#@login_required()
def eliminar_clientes_repetidos(request):
    k = 0
    for c in Cliente.objects.all():        
        already_exist = Cliente.objects.filter(id=c.id)
        if not already_exist:
            continue
            
        rep = Cliente.objects.exclude(id=c.id).filter(rfc=c.rfc)
        for r in rep:
            r.bitacoras.all()
            for b in r.bitacoras.all():
                b.cliente = c
                b.save()
            #r.rfc = "ELIMINAR"
            #r.save()
            r.delete()
    return HttpResponse(k)

@login_required()
def convertir_proyecto(request, id):
    b = get_object_or_404(Bitacora, tipo=2, id=id)
    b.es_proyecto = True
    b.save()    
    return redirect('/admin/bitacora_reporte_tecnico_interno/%s/' % b.id)

@login_required()
def cancelar_proyecto(request, id):
    b = get_object_or_404(Bitacora, tipo=2, id=id)
    b.es_proyecto = False
    b.save()
    return redirect('/admin/bitacora_reporte_tecnico_interno/%s/' % b.id)


@login_required()
@render_to("admin/avisos.html")
def avisos(request):

    avisos = AvisoPrivacidad.objects.all()

    return {'pagina':get_pagina(request, avisos, 50), }

@login_required()
@render_to("admin/aviso.html")
def aviso_privacidad(request):

    try:
        instance = AvisoPrivacidad.objects.get()
    except:
        instance = AvisoPrivacidad(titulo="Aviso de privacidad")
        instance.save()

    if request.method == "POST":
        form = AvisoPrivacidadForm(request.POST, instance=instance)
        if form.is_valid():
            form.save()

            return redirect("admin")

    else:
        form = AvisoPrivacidadForm(instance=instance)



    return {"form":form, }

@login_required()
@render_to("admin/subir_vendedores.html")
def subir_vendedores(request):
    if no_tiene_permiso(request.user, ['credito_cobranza',]): 
        return redirect('/admin/?denied=1')
        
    import time

    context = {
        'success':request.GET.get('success'), 
        'error':request.GET.get('error'),
    }
    if request.method == 'FILES' or request.method == 'POST':
        archivo = request.FILES.get('archivo')
        
        if not archivo:
            return redirect(u'/admin/subir_vendedores/?error=Introduzca un archivo')
        
        if not archivo.name.endswith('.xls') and not archivo.name.endswith('.xlsx'):
            return redirect(u'/admin/subir_vendedores/?error=Debe ser un archivo con terminación xls o xlsx')
        
        import xlrd
        wb = xlrd.open_workbook(file_contents=archivo.read())

        hoja=wb.sheet_by_index(0)
        for i in range(2, hoja.nrows):
            clave = xls_value(hoja.cell(i,0).value)
            vendedor = get_object_or_None(Vendedor, folio=clave)
            if not vendedor:
                vendedor = Vendedor()
                vendedor.folio = clave

            nombre = xls_value(hoja.cell(i,1).value)
            vendedor.nombre = nombre  
            vendedor.save()

        return redirect("catalogo_vendedores")
            

    return context
