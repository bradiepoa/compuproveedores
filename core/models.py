# -*- coding: utf-8 -*- 
from django.db import models
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
from django.utils.safestring import mark_safe
from datetime import date, datetime, timedelta
from core.preguntas_respuestas import *

SUCURSALES = (
          (1, 'TIJUANA'),
          (2, 'HERMOSILLO'),
          (3, 'CULIACAN'),
          (4, 'AGUASCALIENTES'),
)
    
class Perfil(models.Model):

    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    color = models.CharField(max_length=10, unique=True)
    departamento = models.CharField(max_length=100)
    extension = models.CharField(max_length=100)
    sucursal = models.IntegerField(choices=SUCURSALES)

class Producto(models.Model):
    marca = models.CharField(max_length=255)
    tipo = models.CharField(max_length=255)
    clave = models.CharField(max_length=255)
    descripcion = models.CharField(max_length=255)
    
    class Meta:
        ordering = ('id', )
    
    def __unicode__(self):
        return self.nombre
    
class Imagen(models.Model):
    creado = models.DateTimeField(auto_now_add=True)
    fecha_vencimiento = models.DateField(null=True)
    activo = models.BooleanField(default=True, blank=True)
    imagen_chica = models.ImageField(upload_to='imagen', max_length=2000000, blank=False, null=True)
    imagen_grande = models.ImageField(upload_to='imagen', max_length=2000000, blank=False, null=True)
    
    class Meta:
        ordering = ('creado', )
    
#    def __unicode__(self):
#        return self.imagen

#class Archivo(models.Model):
 #   created = models.DateTimeField(auto_now_add=True)
 #   nombre = models.CharField(unique=True)
  #  archivo = models.FileField(upload_to='archivos', max_length=255, blank=False, null=True)

class Lista(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    fecha_vencimiento = models.DateField(null=True)
    archivo = models.FileField(upload_to='listas', max_length=10000000, blank=False, null=True)
    
class Contacto(models.Model):
    nombre = models.CharField(max_length=255)
    email = models.EmailField(null=True, unique=True)
    
    class Meta:
        ordering = ('nombre', )
    
    def __unicode__(self):
        return self.nombre

class ConcretarCita(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    desactivar_email = models.BooleanField(default=False)
    nombre = models.CharField(max_length=255)
    empresa = models.CharField(max_length=255)
    telefono = models.CharField(max_length=255)
    email = models.EmailField()
    comentarios = models.TextField()
    solucion = models.TextField()
    
    def save(self, *args, **kwargs):
        from django.core.mail import EmailMessage
        body = u'Solución que le interesó: %s Nombre: %s \nEmpresa: %s \nTeléfono: %s \nE-mail: %s \nComentarios: %s' % (
            self.solucion, self.nombre, self.empresa, self.telefono, self.email, self.comentarios
            
        )
        email = EmailMessage('Nuevo mensaje para cita de soluciones tecnológicas', body, 'desarrollos@comp.com',
            ['desarrollos@compuproveedores.com'],)
        email.send()
        super(ConcretarCita, self).save(*args, **kwargs)
    
    class Meta:
        ordering = ('nombre', )
    
    def __unicode__(self):
        return self.nombre

class Vendedor(models.Model):
    nombre = models.CharField(max_length=255, )
    folio = models.CharField(max_length=100, )  

    def __unicode__(self):
        return self.nombre

class Distribuidor(models.Model):

    TIPOS_DISTRIBUIDOR = (
                (1, "D"),
                (2, "C"),
                (3, "G")
    )
    created = models.DateTimeField(auto_now_add=True)
    distribuidor = models.BooleanField(default=False)
    clave_modificacion = models.CharField(max_length=50)
    fecha_clave = models.DateField(null=True, blank=True)
    tipo_distribuidor = models.IntegerField(choices=TIPOS_DISTRIBUIDOR, default=3, verbose_name="Tipo de cliente:")
    sucursal = models.CharField(max_length=255, verbose_name=u"Sucursal* ")
    

    #Uso interno
    no_clientes_interno = models.PositiveIntegerField(null=True, verbose_name=u"Número de cliente")
    clasificacion_interno = models.CharField(max_length=255, blank=True, verbose_name=u"Clasificación ")
    dias_credito_interno = models.PositiveIntegerField(null=True, verbose_name=u"Días de crédito")
    limite_credito_interno = models.PositiveIntegerField(null=True, verbose_name=u"Limite de crédito")
    vendedor_interno = models.ForeignKey(Vendedor, related_name="distribuidores", null=True, verbose_name="Vendedor", on_delete=models.CASCADE)

    #datos empresa
    razon_social = models.CharField(max_length=255, verbose_name=u"Nombre o Razón Social*")
    nombre_comercial = models.CharField(max_length=255, verbose_name=u"Nombre Comercial (en caso de tener)", blank=True)
    domicilio = models.CharField(max_length=255, verbose_name=u"Domicilio Fiscal (calle y número)*")
    colonia = models.CharField(max_length=255, verbose_name=u"Colonia*")
    ciudad = models.CharField(max_length=255, verbose_name=u"Ciudad o Municipio*")
    estado = models.CharField(max_length=255, verbose_name=u"Estado*")
    rfc = models.CharField(max_length=15, verbose_name=u"RFC*")
    curp = models.CharField(max_length=255, verbose_name=u"CURP", blank=True)
    telefono = models.CharField(max_length=255, verbose_name=u"Teléfono(s)*")  
    fax = models.CharField(max_length=255, verbose_name=u"Fax", blank=True)
    cp = models.CharField(max_length=5, verbose_name=u"Código Postal*")
    pagina_web = models.CharField(max_length=250, verbose_name=u"Página Web", blank=True)
    
    #Datos representante
    representante_apellido_paterno = models.CharField(max_length=255, verbose_name=u"Apellido Paterno*")
    representante_apellido_materno = models.CharField(max_length=255, verbose_name=u"Apellido Materno*")
    representante_nombre = models.CharField(max_length=255, verbose_name=u"Nombre(s)*")
    representante_domicilio = models.CharField(max_length=255, verbose_name=u"Domicilio Particular (calle y número)*")
    representante_colonia = models.CharField(max_length=255, verbose_name=u"Colonia*")
    representante_ciudad = models.CharField(max_length=255, verbose_name=u"Ciudad o Municipio*")
    representante_estado = models.CharField(max_length=255, verbose_name=u"Estado*")
    representante_telefono = models.CharField(max_length=255, verbose_name=u"Teléfono/Fax*")
    representante_email = models.EmailField(verbose_name=u"Correo Electrónico*")
    desactivar_email = models.BooleanField(default=False)
    representante_identificacion = models.CharField(max_length=255, verbose_name=u"Número de Identificación (IFE)*")
    
    #DATOS DE VENTA EXCLUSIVO COMPUPROVEEDORES (COLOR GRIS)
    vendedor = models.CharField(max_length=255, verbose_name=u"Vendedor", blank=True)
    dias_credito = models.IntegerField(verbose_name=u"Días de credito", blank=True, default=0)
    limite_credito = models.CharField(max_length=255, verbose_name=u"Limite de credito", blank=True)
    
    #REFERENCIA BANCARIA PARA PAGOS
    pagos_banco_1 = models.CharField(max_length=255, verbose_name=u"Banco(1)", blank=True)
    pagos_no_cuenta_1 = models.CharField(max_length=255, verbose_name=u"No. Cuenta", blank=True)
    pagos_banco_2 = models.CharField(max_length=255, verbose_name=u"Banco(2)", blank=True)
    pagos_no_cuenta_2 = models.CharField(max_length=255, verbose_name=u"No. Cuenta", blank=True)
    
    #DATOS DE CREDITO Y COBRANZA (Revision)
    contacto_revision_facturas = models.CharField(max_length=255, verbose_name=u"Contacto p/ revisión de facturas* ", blank=True)
    dias_revision = models.CharField(max_length=255, verbose_name=u"Días de revisión*", blank=True)
    horario_revision = models.CharField(max_length=255, verbose_name=u"Horario*", blank=True)
    telefono_revision = models.CharField(max_length=255, verbose_name=u"Teléfono/Ext*", blank=True)
    doc_revision = models.CharField(max_length=255, verbose_name=u"Doc. Requeridos para Revisión", blank=True)
    
    #Pagos
    encargado_departamento_pago = models.CharField(max_length=255, verbose_name=u"Contacto para Pagos*", blank=True)
    encargado_entregas_pago = models.CharField(max_length=255, verbose_name=u"Encargado de entregas de pagos*", blank=True)
    email_pago = models.EmailField(max_length=255, verbose_name=u"Correo Electrónico*", blank=True)
    telefono_pago = models.CharField(max_length=255, verbose_name=u"Teléfono/Ext*", blank=True)
    dias_pago = models.CharField(max_length=255, verbose_name=u"Días de pago*", blank=True)
    horario_pago = models.CharField(max_length=255, verbose_name=u"Horario*", blank=True)
    pagina_web_pago = models.CharField(max_length=255, verbose_name=u"Página. Web p/envío de facturas (En caso de tener)", blank=True)
    correo_envio_facturas = models.EmailField(verbose_name=u"Correo o Página Web p/envío de Facturas Electrónicas*", blank=True)
    #documento_revision_pago = models.FileField(upload_to='solicitudes_trabajo', max_length=10000000,  verbose_name=u"Doc. Requerido para revisión/pago", blank=True)
    documento_revision_pago = models.CharField(max_length=255, verbose_name=u"Doc. Requerido para pago", blank=True)
    
    #DATOS DE ALMACEN
    almacen_domicilio = models.CharField(max_length=255, verbose_name=u"Domicilio* ")
    almacen_colonia = models.CharField(max_length=255, verbose_name=u"Colonia* ")
    almacen_telefono = models.CharField(max_length=255, verbose_name=u"Teléfono* ")
    almacen_dias = models.CharField(max_length=255, verbose_name=u"Días* ")
    almacen_horario = models.CharField(max_length=255, verbose_name=u"Horario* ")
    almacen_atencion_a = models.CharField(max_length=255, verbose_name=u"Atención a* ")

    #DATOS DE COMPRA
    datos_compra_contacto = models.CharField(max_length=255, verbose_name=u"Contacto de Compras*")
    datos_compra_correo = models.EmailField(max_length=75, verbose_name=u"Correo Electrónico*")
    datos_compra_telefono = models.CharField(max_length=255, verbose_name=u"Teléfono / Ext*")
    
    #INFORMACION SOBRE LA EMPRESA
    LUGAR = (
             (1,'Propio'),
             (2,'Rentado')
            )
    lugar = models.IntegerField(max_length=255, choices=LUGAR, verbose_name=u"Lugar* ", default=1)
    tiempo_residir = models.CharField(max_length=255, verbose_name=u"Tiempo de residir en el lugar*")
    giro_principal  = models.CharField(max_length=255, verbose_name=u"Giro principal de la empresa* ")
    no_empleados = models.CharField(max_length=255, verbose_name=u"No. Empleados*")
    
    #REFERENCIAS BANCARIAS
    titular_cuenta = models.CharField(max_length=255, verbose_name=u"Titular de la cuenta de cheques* ")
    banco = models.CharField(max_length=255, verbose_name=u"Banco* ")
    no_cuenta = models.CharField(max_length=255, verbose_name=u"No. Cuenta*")
    ejecutivo = models.CharField(max_length=255, verbose_name=u"Ejecutivo* ")
    telefono_bancarias = models.CharField(max_length=255, verbose_name=u"Teléfono* ")
    promedio_mensual = models.CharField(max_length=255, verbose_name=u"Promedio mensual*")
    antiguedad_bancarias = models.CharField(max_length=255, verbose_name=u"Antigüedad* ")
    #GRIS
    observaciones = models.CharField(max_length=255, verbose_name=u"observaciones ", blank=True)
    
    #REFERENCIAS COMERCIALES
    nombre_empresa = models.CharField(max_length=255, verbose_name=u"1) Nombre de la Empresa* ", blank=True)
    ciudad_comerciales = models.CharField(max_length=255, verbose_name=u"Ciudad* ", blank=True)
    estado_comerciales = models.CharField(max_length=255, verbose_name=u"Estado*", blank=True)
    atencion_comerciales = models.CharField(max_length=255, verbose_name=u"Atención*", blank=True)
    telefono_comerciales = models.CharField(max_length=255, verbose_name=u"Teléfono/ext*", blank=True)
    
    nombre_empresa_2 = models.CharField(max_length=255, verbose_name=u"2) Nombre de la Empresa* ", blank=True)
    ciudad_comerciales_2 = models.CharField(max_length=255, verbose_name=u"Ciudad* ", blank=True)
    estado_comerciales_2 = models.CharField(max_length=255, verbose_name=u"Estado*", blank=True)
    atencion_comerciales_2 = models.CharField(max_length=255, verbose_name=u"Atención*", blank=True)
    telefono_comerciales_2 = models.CharField(max_length=255, verbose_name=u"Teléfono/ext*", blank=True)
    
    nombre_empresa_3 = models.CharField(max_length=255, verbose_name=u"3) Nombre de la Empresa* ", blank=True)
    ciudad_comerciales_3 = models.CharField(max_length=255, verbose_name=u"Ciudad* ", blank=True)
    estado_comerciales_3 = models.CharField(max_length=255, verbose_name=u"Estado*", blank=True)
    atencion_comerciales_3 = models.CharField(max_length=255, verbose_name=u"Atención*", blank=True)
    telefono_comerciales_3 = models.CharField(max_length=255, verbose_name=u"Teléfono/ext*", blank=True)

    
    #GRIS
    antiguedad_comerciales = models.CharField(max_length=255, verbose_name=u"Antiüedad", blank=True)
    dias_credito_comerciales = models.CharField(max_length=255, verbose_name=u"Dias de credito", blank=True)
    credito_comerciales = models.CharField(max_length=255, verbose_name=u"Credito", blank=True)
    forma_pago_comerciales = models.CharField(max_length=255, verbose_name=u"Forma de pago", blank=True)

    #Documentos
    copia_rfc = models.FileField(upload_to='rfc', max_length=1000000, blank=False, null=True, verbose_name="Copia de la cédula del RFC*")
    copia_alta = models.FileField(upload_to='rfc', max_length=1000000, blank=False, null=True, verbose_name="Copia de alta en hacienda*")
    copia_identificacion = models.FileField(upload_to='rfc', max_length=1000000, blank=False, null=True, verbose_name="Copia de identificación oficial*")
    copia_comprobante_domicilio = models.FileField(upload_to='rfc', max_length=1000000, blank=False, null=True, verbose_name="Copia de comprobante de domicilio vigente*")
    
    no_usar_datos_bancarios = models.BooleanField(verbose_name="Pagos en efectivo", default=False)
    
    def show_razon_social(self):
        if self.razon_social:
            return self.razon_social
            
        return self.cliente.nombre

    def save(self, *args, **kwargs):
        self.rfc = self.rfc.replace(' ', '').replace('-', '')
        self.distribuidor = True if self.tipo_distribuidor == 1 else False
        super(Distribuidor, self).save(*args, **kwargs)
    
    def mostrar_clasificacion(self):
        return self.get_tipo_distribuidor_display()

    def mostrar_datos(self):
        return self.domicilio + ' Col.' + self.colonia + ' ' + self.ciudad + ' ' + self.estado
    
    def nombre(self):
        return self.razon_social
    
    def email(self):
        if '@' in self.representante_email:
            return self.representante_email
        else:
            from django.conf import settings
            return settings.EMAIL_REGISTRO_DISTRIBUIDOR
    
    def tipo_object(self):
        return "Distribuidor"
        
    def tipo(self):
        return 1

    def es_distribuidor(self):
        return True

    def admin_edit_url(self):
        if self.distribuidor:
            url = "/admin/editar_distribuidor/%s/" % self.id
        else:
            url = "/admin/editar_empresa/%s/" % self.id

        return url

class PersonaAutorizada(models.Model):
    distribuidor = models.ForeignKey(Distribuidor, related_name="personas", on_delete=models.CASCADE)
    apellido_paterno = models.CharField(max_length=255, verbose_name=u"Apellido paterno")
    apellido_materno = models.CharField(max_length=255, verbose_name=u"Apellido materno")
    nombre = models.CharField(max_length=255, verbose_name=u"Nombre")
    puesto = models.CharField(max_length=255, verbose_name=u"Puesto")
    numero_ife = models.CharField(max_length=255, verbose_name=u"Número de Credencial IFE")
    
    #Formulario, enviar solicitud de prealta.
    #Contactos.
    #El formulario lo llenarán los clientes (distribuidores), 
    #Se enviará por correo y generará un PDF imprimible.
    #Actualización de distribuidor.
    #Permanecer información acerca de

class Cliente(models.Model):

    SUCURSALES = (
          ("", '---------'),
          (1, 'TIJUANA'),
          (2, 'HERMOSILLO'),
          (3, 'CULIACAN'),
          (4, 'AGUASCALIENTES'),
    )

    VENDENDOR = (
        ('vendor1','vendor1'),
        ('vendor2','vendor2'),
    )

    rfc = models.CharField(max_length=255, verbose_name="RFC")
    nombre = models.CharField(max_length=255, verbose_name="Nombre")
    numero = models.CharField(max_length=255, verbose_name="numero")
    numero_de_cliente = models.CharField(max_length=255, verbose_name="Número de Cliente")
    sucursal = models.IntegerField(choices=SUCURSALES)
    direccion = models.CharField(max_length=255, verbose_name="Dirección")
    ciudad = models.CharField(max_length=255, verbose_name="Ciudad")
    estado = models.CharField(max_length=255, verbose_name="Estado")
    celular = models.CharField(max_length=255, verbose_name="Celular")
    telefono = models.CharField(max_length=255, verbose_name="Teléfono")
    telefono_extra = models.CharField(max_length=255, verbose_name="Teléfono Extra")
    email = models.EmailField(max_length=255,verbose_name="Correo")
    email_two = models.EmailField(max_length=255,blank=True, verbose_name="Correo two")
    email_three = models.EmailField(max_length=255,blank=True, verbose_name="Correo three")
    vender = models.CharField(max_length=200, choices=VENDENDOR,verbose_name="Vendedor")
    contacto = models.CharField(max_length=255, verbose_name="Contacto")
    desactivar_email = models.BooleanField(default=False)
    ext = models.CharField(max_length=255, verbose_name="Ext.")
    distribuidor = models.OneToOneField(Distribuidor, on_delete=models.PROTECT)
    
    #def mostrar_telefono(self):
    #    return self.telefono
    
    def info_credito(self):
        try:
            self.distribuidor.solicitarcredito
        except:
            return None
            
        if self.distribuidor.solicitarcredito.banco_1:
            return self.distribuidor.solicitarcredito.banco_1
    
    def info_admin(self):
        if self.distribuidor.copia_rfc:
            return self.distribuidor.copia_rfc
        #if self.distribuidor.no_clientes_interno:
        #    return self.distribuidor.no_clientes_interno
        #if self.distribuidor.razon_social:
        #    return self.distribuidor.razon_social
    
    def info_cliente(self):
        if self.contacto:
            return True
    
    def get_numero(self):
        try :
            return self.distribuidor.no_clientes_interno
        except ObjectDoesNotExist :
            return None

    def mostrar_datos(self):
        t = ''
        if self.direccion:
            t += self.direccion + ' '
        
        if self.ciudad:
            t += self.ciudad + ' '
        
        if self.estado:
            t += self.estado + ' '
        
        return t
        
    class Meta:
        unique_together = (
            ('sucursal', 'nombre' ),
        )
    
    def __unicode__(self):
        if self.get_numero():
            return "%s %s" % (self.get_numero(), self.nombre)
        else:
            return "%s" % (self.nombre)
    
    def tipo_object(self):
        return "Cliente bitácora"
        
    def tipo(self):
        return 3

    def es_cliente(self):
        return True

# ==================================================================================================

class DirecciónDeReporte(models.Model):
    client = models.CharField(max_length=200, blank=True)
    address = models.TextField(max_length=254)
    active = models.BooleanField(default=False)
    created = models.DateField(auto_now_add=True)
    updated = models.DateField(auto_now=True)

    def __str__(self):
        return f"{self.client} - {self.address}"

# first model that was lost, ====================================================
class Bitacora(models.Model):

    ESTADO = (
              (0, 'Recibido'),
              (1, 'Proceso'),
              (2, 'Cerrada'),
              (3, 'Cancelado'),
              
             )
             
    TIPOS_GARANTIA = (
              (1, 'Equipo'),
              (2, 'Consumible'), 
              (3, 'Refacciones'),             
             )


    TIPOS_SERTEC = (
        (1, 'Equipo comprado en compuproveedores.'),
        (2, 'Equipo no fue comprado en compuproveedores'), 
    )

    TIPOS_EQUIPO = (
                    (1, "Portatil"), 
                    (2, "Computadora"), 
                    (3, "Impresora"), 
                    (4, "Otros")
    )
    
    TIPOS_SERVICIO = (
                    (1, u"Preventivo/Correctivo"),
                    (2, u"Diagnóstico/Cotización"),
                    (3, u"Instalación/Configuración"),
    )
    
    LUGARES_SER = (
                    (1, "Taller"), 
                    (2, "Sitio")
    )

    NO_YEARS_OP = (
        (1, "1 Año"),
        (2, "2 Años"),
    )
    tipo = models.IntegerField()
    cliente = models.ForeignKey(Cliente, related_name="bitacoras", on_delete=models.PROTECT, null=True)
    fecha_modificado = models.DateTimeField(auto_now=True)
    usuario_modificado = models.ForeignKey(User, related_name="usuarios_modificado", on_delete=models.CASCADE)
    usuario = models.ForeignKey(User, on_delete=models.PROTECT, related_name="bitacoras")   
    folio = models.IntegerField()
    Contrato = models.CharField(max_length=255,verbose_name="Contrato")
    fecha = models.DateTimeField(null=True)
    fecha_factura = models.DateField(null=True)
    fecha_vencimiento = models.DateField(null=True)
    fecha_aviso = models.DateField(null=True)
    clave = models.CharField(max_length=255)
    descripcion = models.CharField(max_length=255)
    accesorios = models.CharField(max_length=255)
    num_factura = models.CharField(max_length=255)
    guia = models.CharField(max_length=10)
    falla = models.TextField(blank=True)
    acciones_correctivas = models.TextField(blank=True)
    refacciones = models.TextField(blank=True)
    observaciones = models.TextField(blank=True)
    estado = models.IntegerField(choices=ESTADO)
    sucursal = models.IntegerField(choices=SUCURSALES, null=True)
    tipo_garantia = models.IntegerField(choices=TIPOS_GARANTIA, null=True, blank=True)
    tipo_sertec = models.IntegerField(choices=TIPOS_SERTEC, null=True, blank=True)
    factura_costo_garantia = models.CharField(max_length=255, default="", blank=True)
    garantia_costo = models.BooleanField(verbose_name="Garantía con costo", default=False)
    tipo_servicio = models.IntegerField(choices=TIPOS_SERVICIO, null=True)
    tipo_equipo = models.IntegerField(choices=TIPOS_EQUIPO, null=True)
    equipo = models.CharField(max_length=250, blank=True)
    marca = models.CharField(max_length=250, blank=False)
    modelo = models.CharField(max_length=250, blank=False)
    no_serie = models.CharField(max_length=250, blank=False)
    
    cable_corriente_lap = models.BooleanField(verbose_name="Cable corriente", default=False)
    bateria = models.BooleanField(verbose_name=u"Batería", default=False)
    otros_lap = models.BooleanField(verbose_name="Otros", default=False)
    otros_especificar_lap = models.CharField(max_length=250,  verbose_name=u"Especificar", blank=True)
    contrasena_bios = models.CharField(max_length=250,  verbose_name=u"Contraseña bios", blank=True)
    contrasena_sesion = models.CharField(max_length=250,  verbose_name=u"Contraseña de sesión ", blank=True)
    
    bandeja = models.BooleanField( verbose_name="Bandeja", default=False)
    toner = models.BooleanField( verbose_name="Tóner", default=False)
    cartuchos_tinta = models.BooleanField( verbose_name="Cartuchos de tinta", default=False)
    cabezales = models.BooleanField( verbose_name="Cabezales", default=False)
    cable_usb = models.BooleanField( verbose_name="Cable USB", default=False)
    cable_paralelo = models.BooleanField( verbose_name="Cable paralelo", default=False)
    cable_corriente_imp = models.BooleanField( verbose_name="Cable corriente", default=False)
    otros_imp = models.BooleanField( verbose_name="Otros", default=False)
    otros_especificar_imp = models.CharField(max_length=250,  verbose_name="Especificar", blank=True)
    
    monitor = models.BooleanField( verbose_name="Monitor", default=False)
    sesion = models.BooleanField( verbose_name="Sesión", default=False)
    sesion_especificar = models.CharField(max_length=250,  verbose_name="Especificar", blank=True)
    password = models.BooleanField( verbose_name="Password", default=False)
    password_especificar = models.CharField(max_length=250,  verbose_name="Especificar", blank=True)
    cable_corriente = models.BooleanField( verbose_name="Cable corriente", default=False)
    otros_pc = models.BooleanField( verbose_name="Otros", default=False)
    otros_especificar_pc = models.CharField(max_length=250,  verbose_name="Especificar", blank=True)
    
    otros = models.TextField(blank=True)

    fecha_recepcion = models.DateField(null=True)
    lugar_servicio = models.IntegerField(choices=LUGARES_SER, null=True)
    fecha_diagnostico = models.DateField(null=True)
    fecha_cierre = models.DateTimeField(null=True)
    fecha_inicio = models.DateTimeField(null=True, blank=True)
    fecha_termino = models.DateTimeField(null=True, blank=True)    
    accesorios_incluye = models.TextField(blank=True)

    usa_herramienta = models.BooleanField(verbose_name="Herramienta", default=False)
    usa_escalera = models.BooleanField(verbose_name="Escalera", default=False) 
    usa_equipo = models.BooleanField(verbose_name="Equipo", default=False)  
    usa_reporte = models.BooleanField(verbose_name="Reporte", default=False)
    usa_remision = models.BooleanField(verbose_name=u"Remisión", default=False)
    usa_factura = models.BooleanField(verbose_name="Factura", default=False)
    usa_acuerdo = models.BooleanField(verbose_name="Acuerdo", default=False)
    usa_liberacion = models.BooleanField(verbose_name=u"Liberación", default=False)
    usa_otra = models.BooleanField(verbose_name="Otra", default=False)
    es_proyecto = models.BooleanField(blank=True, default=False)
    no_years = models.IntegerField(choices=NO_YEARS_OP, default=1)
    poliza_original = models.ForeignKey('self', related_name='renovaciones', null=True, on_delete=models.CASCADE)

    class Meta:
        ordering = ('fecha', )
        unique_together = (
                        ("tipo", "folio"),
        )

    def renovar(self):
        fecha = self.fecha_vencimiento - timedelta(days=15)
        hoy = date.today()
        if hoy >= fecha:
            return True

        return False

    def get_fecha_hasta(self):
        h = date.today()
        return "%s/%s/%s" % (h.day, h.month, h.year+self.no_years)

    def show_tipo_solicitud(self):
        if self.es_proyecto:
            return "Proyecto"
        return "Interna"

    def mostrar_tipo_sertec(self):    
        if self.tipo_sertec == 1:
            return 'EQUIPO ADQUIRIDO EN COMPUPROVEEDORES '
        elif self.tipo_sertec == 2:
            return 'EQUIPO NO ADQUIRIDO EN COMPUPROVEEDORES'

    def mostrar_years_sertec(self):    
        if self.no_years == 1:
            return '1 AÑO'
        elif self.no_years == 2:
            return '2 AÑOS'

    def mostrar_precio_sertec(self):    
        if self.no_years == 1 and self.tipo_sertec == 1:
            return '1 AÑO $499.00'
        elif self.no_years == 2 and self.tipo_sertec == 1:
            return '2 AÑOS $799.00'
        elif self.no_years == 1 and self.tipo_sertec == 2:
            return '1 AÑO $640.00'
        elif self.no_years == 2 and self.tipo_sertec == 2:
            return '2 AÑOS $990.00'

  

    def garantia_costo_reporte(self):
        if self.garantia_costo:
            return "Garantía con costo"

        return "Garantía sin costo"

    def imagenes_si(self):
        return bool(self.imagenes.all())
    
    def imagenes_no(self):
        return not bool(self.imagenes.all())

    def status_all(self):
        status = []
        for s in self.status.all().order_by('creado'):
            status.append(s)
        
        return status
    
    def obtener_cliente(self):
        
        if self.tipo == 2:
            return self.usuario
        
        return self.cliente
        
    def url(self):
        from django.conf import settings as s
        
        if self.tipo == 0:
            return '%s/admin/bitacora_garantia/%s/' % (s.ROOT_URL, self.id)
        elif self.tipo == 1:
            return '%s/admin/bitacora_servicio/%s/' % (s.ROOT_URL, self.id)
        elif self.tipo == 2:
            return '%s/admin/bitacora_reporte_tecnico_interno/%s/' % (s.ROOT_URL, self.id)
        elif self.tipo == 4:
            return '%s/admin/bitacora_sertec/%s/' % (s.ROOT_URL, self.id)
    

    def estado_mayuscula(self):
        return self.get_estado_display().upper()


    def save(self, *args, **kwargs):
        self.set_fecha_vencimiento()
        #from admin.functions import get_fecha_vencimiento
        #self.fecha_vencimiento = get_fecha_vencimiento(self.tipo, self.fecha, self.es_proyecto)
        super(Bitacora, self).save(*args, **kwargs)
        

    def set_fecha_vencimiento(self):
        self.fecha_vencimiento = self.get_fecha_vencimiento()

    def get_fecha_vencimiento(self):
        from custom_admin.functions import sumar_dias_habiles
        hoy = datetime.today()
        vencimiento = fecha = self.fecha
        if not fecha:
            fecha = hoy
        if self.tipo == 0:
            vencimiento = sumar_dias_habiles(fecha, 22)
        elif  self.tipo == 1:
            vencimiento = sumar_dias_habiles(fecha, 5)
        elif self.tipo == 2:
            if self.es_proyecto:
                vencimiento = sumar_dias_habiles(fecha, 22)
            else:
                vencimiento = sumar_dias_habiles(fecha, 3)
        elif self.tipo == 4:
            vencimiento = datetime.strptime("%s/%s/%s" % (fecha.day, fecha.month, fecha.year+self.no_years), "%d/%m/%Y").date()
        
        return vencimiento


    def set_folio(self):
        if not self.folio:
            bitacoras = Bitacora.objects.filter(tipo=self.tipo)
            if bitacoras:
                bitacora = bitacoras.latest('folio')
                folio = bitacora.folio + 1
            else:
                folio = 1
            
            self.folio = folio

class Vacante(models.Model):
    
    CIUDADES = (
                ('Matriz Hermosillo', 'Matriz Hermosillo'),
                ('Sucursal Tijuana', 'Sucursal Tijuana'),
                ('Sucursal Culiacan', 'Sucursal Culiacan'),
                ('Sucursal Aguascalientes', 'Sucursal Aguascalientes'),
    )
    
    created = models.DateTimeField(auto_now_add=True)
    nombre = models.CharField(max_length=255)
    #ciudad = models.IntegerField(choices=CIUDADES)
    ciudad = models.CharField(max_length=255, choices=CIUDADES)
    descripcion = models.TextField(blank=False, verbose_name="Descripción")
    sueldo = models.CharField(max_length=255, blank=True)
    
    def __unicode__(self):
        return self.nombre
    

class SolicitudTrabajo(models.Model):
    created = models.DateTimeField(auto_now_add=True)
    
    nombre = models.CharField(max_length=255)
    apellido = models.CharField(max_length=255)
    telefono = models.CharField(max_length=255, verbose_name="Teléfono(Lada)")
    email = models.EmailField(blank=False, verbose_name="Correo Electrónico")
    vacante = models.ForeignKey(Vacante, related_name="solicitudes", blank=True, null=True, verbose_name="Puesto", on_delete=models.CASCADE)
    puesto = models.CharField(max_length=255, blank=True, null=True)
    aspiracion = models.CharField(max_length=255, verbose_name="Sueldo", blank=True)
    curriculum = models.FileField(upload_to='solicitudes_trabajo', max_length=10000000, verbose_name=u"Subir Curriculum")
    desactivar_email = models.BooleanField(default=False)

    class Meta:
        ordering = ('-created', )
        
    def tipo_object(self):
        return "Solicitud de Trabajo"
    
    def tipo(self):
        return 2
    
    
class MensajeContacto(models.Model):
    nombre = models.CharField(max_length=255, verbose_name=u"Nombre")
    empresa = models.CharField(max_length=255, verbose_name=u"Empresa")	
    email = models.EmailField(max_length=255, verbose_name=u"Correo electrónico")
    telefono = models.CharField(max_length=255, verbose_name=u"Teléfono")	
    comentarios = models.TextField(max_length=255, verbose_name=u"comentarios", blank=False)
    desactivar_email = models.BooleanField(default=False)
    
    def tipo_object(self):
        return "Contacto"
        
    def tipo(self):
        return 4
    
class Marca(models.Model):
    nombre = models.CharField(max_length=255, verbose_name=u"Nombre")
    logo = models.ImageField(upload_to='logos', max_length=1000000, blank=True, verbose_name=u"Logotipo")
    
    def __unicode__(self):
        return self.nombre
        

class Categoria(models.Model):
    nombre = models.CharField(max_length=255, verbose_name=u"Nombre")
    
    def __unicode__(self):
        return self.nombre
        
    class Meta:
        ordering = ('nombre', )
 
class SubCategoria(models.Model):
    categoria = models.ForeignKey(Categoria, related_name="subcategorias",  on_delete=models.PROTECT )
    nombre = models.CharField(max_length=255, verbose_name=u"Nombre")

    def __unicode__(self):
        return "%s - %s" % (self.categoria.nombre, self.nombre )    
    
    class Meta:
        ordering = ('nombre', )

class MarcaCategoria(models.Model):
    marca = models.ForeignKey(Marca, related_name="marcas",  on_delete=models.PROTECT)
    subcategoria = models.ForeignKey(SubCategoria, related_name="subcategorias",  on_delete=models.PROTECT)
    url = models.CharField(max_length=255)
   
    
    class Meta:
        unique_together = (
            ("marca", "subcategoria", ),
        )
    
    def marca_categoria(self):
        return "%s - %s - %s" % (self.marca.nombre, self.subcategoria.categoria.nombre, self.subcategoria.nombre )
    
    class Meta:
        ordering = ('marca__nombre', )

class EquipoRenta(models.Model):
    marca = models.CharField(max_length=255, verbose_name=u"Marca")
    modelo = models.CharField(max_length=255, verbose_name=u"Modelo")
    descripcion = models.CharField(max_length=255, verbose_name=u"Descripción")
    categoria = models.CharField(max_length=255, verbose_name=u"Categoria")
    disponible = models.BooleanField(default=True)
    valor = models.DecimalField(decimal_places=2, max_digits=12)
    no_serie = models.CharField(max_length=255, verbose_name=u"Numero de serie")
    sucursal = models.IntegerField(choices=SUCURSALES)
    
    def __unicode__(self):
        return "%s - %s - %s - $%s" % (self.marca, self.modelo, self.descripcion, self.valor)
        
    def establecer_disponible(self, renta):
        renta_detalles = RentaDetalle.objects.all()
        disponible = True
        for rd in renta_detalles:
            if renta != rd.renta:
                if not rd.renta.status:
                    if rd.equipo == self:
                        disponible = False
        
        self.disponible = disponible
        self.save()
    
    def esta_disponible(self):
        if not self.disponible:
            return RentaDetalle.objects.get(equipo=self, renta__status=False).renta.fecha_final  
        else:
            return u"Si"
    
    def url_renta(self):
        renta = RentaDetalle.objects.get(equipo=self, renta__status=False).renta
        return "/admin/renta/%s/" % renta.id


class Renta(models.Model):
    
    CONDICION = (
                 (1,'Prestamo'),
                 (2,'Renta')
                )
                 
    folio = models.PositiveIntegerField()
    numero_cliente = models.CharField(max_length=255, verbose_name=u"Número de cliente")
    created = models.DateTimeField(auto_now_add=True)
    cliente = models.CharField(max_length=255, verbose_name=u"Cliente")
    responsable = models.CharField(max_length=255, verbose_name=u"Responsable" )
    departamento = models.CharField(max_length=255, verbose_name="Departamento", blank=True)
    direccion = models.CharField(max_length=255, verbose_name=u"Dirección")
    ciudad = models.CharField(max_length=255, verbose_name=u"Ciudad")
    telefono = models.CharField(max_length=255, verbose_name=u"teléfono")
    condicion = models.IntegerField(choices=CONDICION, verbose_name=u"Condición")
    fecha_inicio = models.DateField(null=True, verbose_name=u"Fecha de inicio")
    fecha_final = models.DateField(null=True, verbose_name=u"Fecha final")
    status = models.BooleanField(default=False)
    observaciones = models.TextField(blank=True)

    
    
    
    def set_folio(self):
        try:
            ultimo_folio = Renta.objects.all().latest('folio').folio + 1
        except ObjectDoesNotExist:
            ultimo_folio = 1
        self.folio = ultimo_folio
    
    
    def save(self, *args, **kwargs):
        if not self.id:     
            self.set_folio()
        super(Renta, self).save(*args, **kwargs)
    
    def total(self):
        detalles = self.detalles.all()
        total = 0
        for d in detalles:
            total += d.equipo.valor
            
        return total

    def folio_4_d(self):
         return "%04d" % (self.folio)
 
    def vencimiento(self):
        return self.fecha

    def url(self):
        from django.conf import settings as s
        return '%s/admin/renta/%s/' % (s.ROOT_URL, self.id)

    

class SolicitarCredito(models.Model):
    distribuidor = models.BooleanField(default=False)
    dist = models.OneToOneField(Distribuidor, on_delete=models.CASCADE)
    razon_social = models.CharField(max_length=255, verbose_name=u"Nombre o Razón Social")
    created = models.DateTimeField(auto_now_add=True)
    
    #Referencias bancarias para pagos
    banco_1 = models.CharField(max_length=255, verbose_name=u"Banco(1)", blank=True)
    pagos_no_cuenta_1 = models.CharField(max_length=255, verbose_name=u"No. Cuenta", blank=True)
    pagos_banco_2 = models.CharField(max_length=255, verbose_name=u"Banco(2)", blank=True)
    pagos_no_cuenta_2 = models.CharField(max_length=255, verbose_name=u"No. Cuenta", blank=True)
    
    #Referencias comerciales
    rc_nombre_empresa_1 = models.CharField(max_length=255, verbose_name=u"1) Nombre de la Empresa")
    rc_ciudad_estado_1 = models.CharField(max_length=255, verbose_name=u"Ciudad/Estado")
    rc_atencion_1 = models.CharField(max_length=255, verbose_name=u"Atención")
    rc_telefono_1 = models.CharField(max_length=255, verbose_name=u"Teléfono/Ext")
    rc_antiguedad_1 = models.CharField(max_length=255, verbose_name=u"Antigüedad")
    rc_dias_credito_1 = models.CharField(max_length=255, verbose_name=u"Días de crédito")
    monto_credito_1 = models.CharField(max_length=255, verbose_name=u"Crédito")
    forma_pago_1 = models.CharField(max_length=255, verbose_name=u"Forma de pago")
    
    rc_nombre_empresa_2 = models.CharField(max_length=255, verbose_name=u"2) Nombre de la Empresa")
    rc_ciudad_estado_2 = models.CharField(max_length=255, verbose_name=u"Ciudad/Estado")
    rc_atencion_2 = models.CharField(max_length=255, verbose_name=u"Atención")
    rc_telefono_2 = models.CharField(max_length=255, verbose_name=u"Teléfono/Ext")
    rc_antiguedad_2 = models.CharField(max_length=255, verbose_name=u"Antigüedad")
    rc_dias_credito_2 = models.CharField(max_length=255, verbose_name=u"Días de crédito")
    monto_credito_2 = models.CharField(max_length=255, verbose_name=u"Crédito")
    forma_pago_2 = models.CharField(max_length=255, verbose_name=u"Forma de pago")
    
    rc_nombre_empresa_3 = models.CharField(max_length=255, verbose_name=u"3) Nombre de la Empresa")
    rc_ciudad_estado_3 = models.CharField(max_length=255, verbose_name=u"Ciudad/Estado")
    rc_atencion_3 = models.CharField(max_length=255, verbose_name=u"Atención")
    rc_telefono_3 = models.CharField(max_length=255, verbose_name=u"Teléfono/Ext")
    rc_antiguedad_3 = models.CharField(max_length=255, verbose_name=u"Antigüedad")
    rc_dias_credito_3 = models.CharField(max_length=255, verbose_name=u"Días de crédito")
    monto_credito_3 = models.CharField(max_length=255, verbose_name=u"Crédito")
    forma_pago_3 = models.CharField(max_length=255, verbose_name=u"Forma de pago")
    
    doc_req_1 = models.FileField(upload_to='docs', max_length=255, blank=False, null=True, verbose_name="Documentación")
    doc_req_2 = models.FileField(upload_to='docs', max_length=255, blank=False, null=True, verbose_name="Documentación")
    doc_req_3 = models.FileField(upload_to='docs', max_length=255, blank=False, null=True, verbose_name="Documentación")
    
    def mostrar_datos(self):
        t = '%s %s' % (self.banco_1, self.pagos_no_cuenta_1)
        
        return t
    
                
class RentaDetalle(models.Model):
    renta = models.ForeignKey(Renta, related_name="detalles", on_delete=models.CASCADE)
    equipo = models.ForeignKey(EquipoRenta, related_name="detalles", on_delete=models.PROTECT)
   
    def __init__(self, *args, **kwargs):
       
        super(RentaDetalle, self).__init__(*args, **kwargs)
        self.equipo_anterior = None
        if self.id:
            self.equipo_anterior = self.equipo
            
    def save(self, *args, **kwargs):
        if self.equipo != self.equipo_anterior:   
            if self.equipo_anterior and not self.renta.status:
                self.equipo_anterior.establecer_disponible(self.renta)
            
        super(RentaDetalle, self).save(*args, **kwargs)
   
    def delete(self, *args, **kwargs):     
        equipo = self.equipo
        equipo.disponible = True
        equipo.save()
        
        super(RentaDetalle, self).delete(*args, **kwargs)

class Block(models.Model):
    texto = models.TextField()


class Status(models.Model):
    creado = models.DateTimeField(auto_now_add=True, verbose_name=u"Fecha")
    usuario = models.ForeignKey(User, verbose_name=u"Usuario", on_delete=models.CASCADE)
    bitacora = models.ForeignKey(Bitacora, related_name="status", on_delete=models.CASCADE)
    status = models.TextField(verbose_name=u"Status")
    
    class Meta:
        ordering = ('-creado', )

class Actividad(models.Model):

    titulo = models.CharField(max_length=150, verbose_name="Titulo")
    creado = models.DateTimeField(auto_now_add=True)
    usuario_creado = models.ForeignKey(User, on_delete=models.CASCADE)
    usuario_asignado = models.ForeignKey(User, verbose_name="Asignar a", related_name="asignados", null=True, blank=True, on_delete=models.CASCADE)
    descripcion = models.TextField(verbose_name=u"Descripcion")
    confirmar = models.BooleanField(default=False)
    fecha_inicio = models.DateTimeField(verbose_name="Fecha de inico")  
    fecha_termino = models.DateTimeField(verbose_name="Fecha de termino")
    cancelado = models.BooleanField(default=False)
    
    
    def get_usuario_asignado(self):
        if self.usuario_asignado:
            return self.usuario_asignado
        else:
            return 'No asignado'
    

class EncuestaSatisfaccion(models.Model):
    

    creado = models.DateTimeField(auto_now_add=True)
    pregunta_1 = models.PositiveIntegerField(verbose_name=label_1)
    pregunta_2 = models.PositiveIntegerField(verbose_name=label_2)
    pregunta_3 = models.PositiveIntegerField(verbose_name=label_3)
    pregunta_4 = models.PositiveIntegerField(verbose_name=label_4)
    pregunta_5 = models.PositiveIntegerField(verbose_name=label_5)
    pregunta_6 = models.PositiveIntegerField(null=True,verbose_name=label_6)
    pregunta_6_1 = models.PositiveIntegerField(verbose_name=label_6_1)
    pregunta_6_2 = models.PositiveIntegerField(verbose_name=label_6_2)
    pregunta_6_3 = models.PositiveIntegerField(verbose_name=label_6_3)
    pregunta_6_4 = models.PositiveIntegerField(verbose_name=label_6_4)
    pregunta_6_5 = models.PositiveIntegerField(verbose_name=label_6_5)
    pregunta_6_6 = models.PositiveIntegerField(verbose_name=label_6_6)
    pregunta_6_7 = models.PositiveIntegerField(verbose_name=label_6_7)   
    
    pregunta_7 = models.PositiveIntegerField(null=True, verbose_name=label_7)
    pregunta_7_1 = models.PositiveIntegerField(verbose_name=label_7_1)
    pregunta_7_2 = models.PositiveIntegerField(verbose_name=label_7_2)
    pregunta_7_3 = models.PositiveIntegerField(verbose_name=label_7_3)
    pregunta_7_4 = models.PositiveIntegerField(verbose_name=label_7_4)
    pregunta_7_5 = models.PositiveIntegerField(verbose_name=label_7_5)
    
    pregunta_8 = models.PositiveIntegerField(verbose_name=label_8)
    pregunta_8_porque = models.CharField(max_length=255, null=True, blank=True)
    pregunta_9 = models.PositiveIntegerField(verbose_name=label_9)

    
    comentarios = models.TextField(verbose_name=label_10)
    razon_social = models.CharField(max_length=255)
    puesto = models.CharField(max_length=255)
    
class ImagenInicio(models.Model):
    creado = models.DateTimeField(auto_now_add=True)
    fecha_vencimiento = models.DateField(null=True, blank=False)
    activo = models.BooleanField(default=True, blank=True)
    imagen = models.ImageField(upload_to='imagen', max_length=2000000, blank=False, null=True)
    url = models.URLField(max_length=255)
    

class MundoTecnologia(models.Model):
    imagen = models.ImageField(upload_to='imagen', max_length=2000000, blank=False, null=True)


class BitacoraImagen(models.Model):
    bitacora = models.ForeignKey(Bitacora, related_name="imagenes", on_delete=models.CASCADE)
    imagen = models.ImageField(upload_to='imagen', max_length=2000000, blank=False, null=True)

class AvisoPrivacidad(models.Model):
    titulo = models.CharField(max_length=200)
    texto = models.TextField()
    creado = models.DateTimeField(auto_now_add=True)


class SoporteServiciosFinancieros(models.Model):
    service = models.CharField(max_length=200, blank=True, null=True)
    service_status = models.BooleanField(default=False)
    created = models.DateField(auto_now_add=True)
    updated = models.DateField(auto_now=True)

    def __str__(self):
        return self.service

    class Meta:
        verbose_name_plural = "SOPORTE A SERVICIOS FINANCIEROS" 

