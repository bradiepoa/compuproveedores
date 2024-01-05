# -*- coding: utf-8 -*- 
from django import forms
from django.forms.models import modelformset_factory
from core.models import *
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
from django.db.models import Q
from django.forms.utils import ErrorList
from custom_admin.functions import *
from annoying.functions import get_object_or_None
from datetime import date, datetime

ESTADO = (
       ('','-------'),
       (0,'Recibido'),
       (1,'Proceso'),
       (2,'Cerrado'),
       (3,'Cancelado'),
      )

SUCURSALES = (
          ('','-------'),
          (1, 'TIJUANA'),
          (2, 'HERMOSILLO'),
          (3, 'CULIACAN'),
          (4, 'AGUASCALIENTES'),
)

TIPOS_GARANTIA = (
              ("", '----------'),
              (1, 'Equipo'),
              (2, 'Consumible'), 
              (3, 'Refacciones'),             
             )

TIPOS_SERVICIO = (  ("", '----------'),
                    (1, u"Preventivo/Correctivo"),
                    (2, u"Diagnóstico/Cotización"),
                    (3, u"Instalación/Configuración"),
    )

PERMISOS = (("", "--------"),
                ('mercadotecnia', 'MERCADOTECNIA'  ),
                ("recursos_humanos", 'RECURSOS HUMANOS'   ),
                ("credito_cobranza", 'CREDITO Y COBRANZA'),
                ("telemarketing", 'TELEMARKETING' ),
                ("administracion_sucursales", 'ADMINISTRACION SUCURSALES'   ),
                ("soporte_tecnico", 'SOPORTE TECNICO'),
                ("ventas", 'VENTAS'    ),
                ("gerencia_administrativa",  'GERENCIA ADMINISTRATIVA' ),
                ("soluciones_tecnologicas", 'SOLUCIONES TECNOLOGICAS'),
                ('reporte_interno', 'Reporte Interno'),
                ('administrador', 'ADMINISTRADOR'),
    )

SI_NO = (
        ("", "---------"),
        (1, "Si"),
        (2, "No"), 
    )

LUGARES_SER = (
                ("", "---------"),
                (1, "Taller"), 
                (2, "Sitio"),
)

TIPOS_EQUIPO = (
                    ("", "---------"),
                    (1, "Portatil"), 
                    (2, "Computadora"), 
                    (3, "Impresora"), 
                    (4, "Otros")
    )

class CalendarWidget(forms.DateInput):
    def __init__(self, attrs={}):
        attrs['class'] = 'has_datepicker'
        attrs['size'] = '8'
        
        super(CalendarWidget, self).__init__(attrs=attrs)

class CalendarDateField(forms.DateField):
    def __init__(self, *args, **kwargs):
        super(CalendarDateField, self).__init__(
            input_formats=('%d/%m/%y', '%d/%m/%Y', ), 
            widget=CalendarWidget,
            *args, **kwargs
        )

class CalendarHWidget(forms.DateInput):
    def __init__(self, attrs={}):
        attrs['class'] = 'has_datetimepicker'
        attrs['size'] = '15'
        
        super(CalendarHWidget, self).__init__(attrs=attrs)

class CalendarDateTimeField(forms.DateTimeField):
    def __init__(self, *args, **kwargs):
        super(CalendarDateTimeField, self).__init__(
            input_formats=('%d/%m/%Y %H:%M', '%d/%m/%y %H:%M', ), 
            widget=CalendarHWidget,
            *args, **kwargs
        )

class PerfilForm(forms.ModelForm):
    class Meta:
        model = Perfil
        exclude = ('usuario', )

class ListaForm(forms.ModelForm):
    class Meta:
        model = Lista
        exclude = ()

    fecha_vencimiento = CalendarDateField(required=False)
    
class UserForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'email', 'first_name',)

    permiso = forms.ChoiceField(choices=PERMISOS, required=True)
    
    def __init__(self, *args, **kwargs):
        super(UserForm, self).__init__(*args, **kwargs)
        if self.instance.id:
            self.initial['permiso'] = self.instance.last_name

class ImagenForm(forms.ModelForm):
    class Meta:
        model = Imagen
        exclude = ()
        #fields=("texto", )
    fecha_vencimiento = CalendarDateField(required=False)

class BuscarUsuariosForm(forms.Form):    
    q = forms.CharField(max_length=230, required=False)    
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=False)
    permiso = forms.ChoiceField(choices=PERMISOS, required=False)
    
    #def __init__(self, *args, **kwargs):
    #    super(BuscarForm, self).__init__(*args, **kwargs)
    #    if self.data.get('activos') is None:
    #        self.data['activos'] = 1


class BuscarForm(forms.Form):

    ACTIVOS = (
               (1,'Activados'),
               (2,'Desactivados')
              )

    q = forms.CharField(max_length=230, required=False)    
    activos = forms.ChoiceField(choices=ACTIVOS, required=False)
    
    def __init__(self, *args, **kwargs):
        super(BuscarForm, self).__init__(*args, **kwargs)
        if self.data.get('activos') is None:
            self.data['activos'] = 1


class BuscarBitacoraInternoForm(forms.Form):
    q = forms.CharField(max_length=230, required=False)    
    estado = forms.ChoiceField(choices=ESTADO, required=False)
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=False)
    tipo = forms.ChoiceField(choices=(('0','---'), ('1','Interno'), ('2','Proyecto'), ), required=False)


class BuscarBitacoraForm(forms.Form):
    q = forms.CharField(max_length=230, required=False)    
    estado = forms.ChoiceField(choices=ESTADO, required=False)
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=False)
    tipo_servicio = forms.ChoiceField(choices=TIPOS_SERVICIO, required=False)
    lugar_servicio = forms.ChoiceField(choices=LUGARES_SER, required=False)
    tipo_equipo = forms.ChoiceField(choices=TIPOS_EQUIPO, required=False)

class FiltroBitacoraGarantiaForm(forms.Form):

    q = forms.CharField(max_length=230, required=False)    
    estado = forms.ChoiceField(choices=ESTADO, required=False)
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=False)
    tipo_garantia = forms.ChoiceField(choices=TIPOS_GARANTIA, required=False)
    con_costo = forms.ChoiceField(choices=SI_NO, required=False)
    
    

class VacanteForm(forms.ModelForm):
    class Meta:
        model = Vacante
        exclude = ()
        #fields=("texto", )
        
        
class EquipoRentaForm(forms.ModelForm):
    class Meta:
        model = EquipoRenta
        exclude = ('disponible', )

    def __init__(self, *args, **kwargs):
        super(EquipoRentaForm, self).__init__(*args, **kwargs)

        
class RentaForm(forms.ModelForm):
    class Meta:
        model = Renta
        exclude = ('folio', )
    fecha_final = CalendarDateField(required=True)
    fecha_inicio = CalendarDateField(required=True)
    
    STATUS = ((True,'Finalizado'), (False, 'En curso'))
    
    status = forms.ChoiceField(choices=STATUS)

    def clean(self):    

        cleaned_data = self.cleaned_data    
        fecha_inicio = cleaned_data.get("fecha_inicio")
        fecha_final = cleaned_data.get("fecha_final")
            
        if fecha_inicio and fecha_final:
            if fecha_inicio > fecha_final:     
                self._errors['fecha_inicio'] = ErrorList(['La fecha de inicio no debe ser mayor a la fecha final']) 
            
        return cleaned_data

    def clean_telefono(self):
        telefono = self.cleaned_data['telefono']
        
        if telefono:
            if not "(" in telefono and not ")" in telefono:
                raise forms.ValidationError("Introduzca la clave lada entre paréntesis")
            else:
                lada = telefono.split("(")[1].split(")")[0]
                lada = lada.replace(" ", "")
          
                if not lada.isnumeric():
                    raise forms.ValidationError("Lada incorrecta")
            
        return telefono
    
    def clean_status(self):
        status = self.cleaned_data['status']
        return eval(status)
    
class RentaDetalleForm(forms.ModelForm):
    class Meta:
        model = RentaDetalle
        fields = ('equipo', )
                                                                        
    equipo = forms.ModelChoiceField(queryset=EquipoRenta.objects.all(), widget=forms.Select(attrs={"style":"width:200px;", }) )
    def __init__(self, *args,**kwargs):
        super (RentaDetalleForm,self ).__init__(*args,**kwargs)
        
        if self.instance.id:    
            self.fields['equipo'].queryset = EquipoRenta.objects.filter(Q(disponible=True) |
                                                                        Q(id=self.instance.equipo.id))
        else:         
            self.fields['equipo'].queryset = EquipoRenta.objects.filter(disponible=True)
        
        
    def clean_equipo(self):
        equipo = self.cleaned_data['equipo'] 
        renta_detalles = RentaDetalle.objects.filter(equipo=equipo, equipo__disponible=False, renta__status=False).exclude(id=self.instance.id)
        if renta_detalles:
            raise forms.ValidationError('El equipo no esta disponible')  

        return equipo
             


class DistribuidorInternoForm(forms.ModelForm):
    class Meta:
        model = Distribuidor
        exclude = (
           'clave_modificacion',
           'distribuidor',
           'fecha_clave', 
           'vendedor', 
           'dias_credito', 
           'limite_credito', 
           'observaciones', 
           'antiguedad_comerciales',
           'dias_credito_comerciales',
           'credito_comerciales',
           'forma_pago_comerciales',
           'desactivar_email',
           'encargado_entregas_pago',
           'pagina_web_pago', 
           'titular_cuenta',
           'banco',
           'no_cuenta',
           'ejecutivo',
           'telefono_bancarias',
           'promedio_mensual',
           'antiguedad_bancarias',
        )

class BitacoraInternoForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = (
                'falla', 
                'acciones_correctivas', 
                'refacciones', 
                'observaciones',
        )
    
    def __init__(self, *args, **kwargs):
        super(BitacoraInternoForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 2


    def _get_validation_exclusions(self):
        exclude = super(BitacoraInternoForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude


    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla 
    

class EditarBitacoraGarantiaForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = ( 
                'falla', 
                'refacciones', 
                'observaciones',
                'no_serie',
                'fecha_recepcion',
                'factura_costo_garantia',
                'acciones_correctivas', 
                )
    #fecha_factura = CalendarDateField(required=True)
    fecha_recepcion = CalendarDateField(required=True)

    def __init__(self, *args, **kwargs):
        super(EditarBitacoraGarantiaForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 0
 
    def _get_validation_exclusions(self):
        exclude = super(EditarBitacoraGarantiaForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude

  

    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla    

    
class BitacoraSerTecForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = (
            "cliente", 
            'falla', 
            'refacciones', 
            'observaciones',
            'sucursal',
            'tipo_sertec',
            'no_serie',
            'fecha_recepcion',
            'factura_costo_garantia',
            'garantia_costo',
            'acciones_correctivas', 
            'no_years',
            'marca',
            'modelo',
            'tipo_equipo',
            'factura_costo_garantia',
        )

    cliente_txt = forms.CharField(widget=forms.TextInput(attrs={ 'id':'id_cliente', }))
    cliente = forms.CharField(widget=forms.HiddenInput(attrs={ 'id':'id_cliente_hidden', }))
    fecha_recepcion = CalendarDateField(required=False)

    def __init__(self, *args, **kwargs):
        super(BitacoraSerTecForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 4
        if self.instance.cliente:
            cliente = self.instance.cliente
            if cliente.distribuidor.no_clientes_interno:
                self.initial['cliente_txt'] = "%s - %s" % (cliente.distribuidor.no_clientes_interno, cliente.nombre)
            else:  
                self.initial['cliente_txt'] = "%s" % (cliente.nombre)



    def _get_validation_exclusions(self):
        exclude = super(BitacoraSerTecForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude

    def clean_cliente(self):
        cliente_id = string_to_int(self.cleaned_data['cliente'])
        data = self.data.get("cliente_txt")
        sucursal = string_to_int(self.data.get("sucursal"))
        #if "-" in data:
        #    arr = data.split(" - ")
        #    if arr[0].isnumeric():
        #        numero = arr[0]
        #        try:
        #            nombre = arr[1]
        #        except IndexError:
        #            nombre = ""
        #    else:
        #        numero = ""
        #        nombre = ""
        # 
        #   if numero and nombre:
        #        cliente = get_object_or_None(Cliente, numero=numero, nombre=nombre, sucursal=sucursal)
        #    else:
        #        cliente = None
        #else:
        #    cliente = get_object_or_None(Cliente, nombre=data, sucursal=sucursal, numero__isnull=True)
        if cliente_id:
            cliente = get_object_or_None(Cliente, id=cliente_id)
        else:
            cliente = None
        if not cliente:
            raise forms.ValidationError('No se encuentra ese cliente')
        self.cleaned_data['cliente'] = cliente.id
        
        return cliente

    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla    

    def clean_garantia_costo(self):
        gc = self.cleaned_data["garantia_costo"]
        if self.instance.id:
            gc = self.instance.garantia_costo

        return gc

class EditarBitacoraSerTecForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = (
            'refacciones', 
            'observaciones',
            'no_serie',
            'fecha_recepcion',
            'factura_costo_garantia',
            'acciones_correctivas', 
        )

    fecha_recepcion = CalendarDateField(required=False)

    def __init__(self, *args, **kwargs):
        super(EditarBitacoraSerTecForm, self).__init__(*args, **kwargs)
        if self.instance.id:
            if self.instance.garantia_costo:
                self.fields["factura_costo_garantia"].required = False

    def _get_validation_exclusions(self):
        exclude = super(EditarBitacoraSerTecForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude
  


class EditarBitacoraServicioForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = ( 
                'refacciones', 
                'observaciones',
                'no_serie',
                'acciones_correctivas',
                'accesorios_incluye',
                'fecha_inicio',
                'fecha_termino',
                'factura_costo_garantia',
                )
    #fecha_factura = CalendarDateField(required=True)
    #fecha_recepcion = CalendarDateField(required=False)
    fecha_inicio = CalendarDateTimeField(required=False)
    fecha_termino = CalendarDateTimeField(required=False)

    def __init__(self, *args, **kwargs):
        super(EditarBitacoraServicioForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 1
        if self.instance.id:
            if self.instance.fecha_inicio:
                self.initial['fecha_inicio'] = self.instance.fecha_inicio.strftime("%d/%m/%y %H:%M")
            if self.instance.fecha_termino:
                self.initial['fecha_termino'] = self.instance.fecha_termino.strftime("%d/%m/%y %H:%M")
                

    def _get_validation_exclusions(self):
        exclude = super(EditarBitacoraServicioForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude

    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla    

    def clean(self):
        cleaned_data = self.cleaned_data
        
        if str(self.instance.lugar_servicio) == "2":
            if not cleaned_data.get("fecha_inicio"):
                self._errors["fecha_inicio"] = ErrorList(["Este campo es obligatorio."])
            if not cleaned_data.get("fecha_termino"):
                self._errors["fecha_termino"] = ErrorList(["Este campo es obligatorio."])
        return cleaned_data


class BitacoraServicioForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        exclude=("tipo", 
                 'guia', 
                 'usuario', 
                 'usuario_modificado', 
                 'clave', 
                 'descripcion', 
                 'accesorios', 
                 'num_factura',
                 'fecha_factura',
                 'estado',
                 'fecha_vencimiento',
                 'fecha_aviso',
                 'fecha_diagnostico', 
                 'fecha_recepcion', 
                 'factura_costo_garantia',
                 'garantia_costo',
                 'fecha',
                 'folio',
                 'equipo',
                 'fecha_cierre',
                 'no_years',
                 'tipo_sertec',
                 'poliza_original',
        )
    cliente_txt = forms.CharField(widget=forms.TextInput(attrs={ 'id':'id_cliente', }))
    cliente = forms.CharField(widget=forms.HiddenInput(attrs={ 'id':'id_cliente_hidden', }))
    fecha_inicio = CalendarDateTimeField(required=False)
    fecha_termino = CalendarDateTimeField(required=False)
    otros = forms.CharField(required=False)

    def __init__(self, *args, **kwargs):
    
        super(BitacoraServicioForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 1

        if self.instance.cliente:
            cliente = Cliente.objects.get(id=self.initial['cliente'])
            if cliente.get_numero():
                self.initial['cliente_txt'] = "%s - %s" % (cliente.get_numero(), cliente.nombre)
            else:  
                self.initial['cliente_txt'] = "%s" % (cliente.nombre)
        
        if self.instance.id:            
            self.initial['fecha_inicio'] = self.instance.fecha_inicio.strftime("%d/%m/%y %H:%M")
            self.initial['fecha_termino'] = self.instance.fecha_termino.strftime("%d/%m/%y %H:%M")
   
    def _get_validation_exclusions(self):
        exclude = super(BitacoraServicioForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude
        
    def clean_cliente(self):
        cliente_id = string_to_int(self.cleaned_data['cliente'])
        data = self.data.get("cliente_txt")
        sucursal = string_to_int(self.data.get("sucursal"))
        #if "-" in data:
        #    arr = data.split(" - ")
        #    if arr[0].isnumeric():
        #        numero = arr[0]
        #        try:
        #            nombre = arr[1]
        #        except IndexError:
        #            nombre = ""
        #    else:
        #        numero = ""
        #        nombre = ""
        # 
        #   if numero and nombre:
        #        cliente = get_object_or_None(Cliente, numero=numero, nombre=nombre, sucursal=sucursal)
        #    else:
        #        cliente = None
        #else:
        #    cliente = get_object_or_None(Cliente, nombre=data, sucursal=sucursal, numero__isnull=True)
        if cliente_id:
            cliente = get_object_or_None(Cliente, id=cliente_id)
        else:
            cliente = None
        if not cliente:
            raise forms.ValidationError('No se encuentra ese cliente')
        self.cleaned_data['cliente'] = cliente.id
        
        return cliente

    def clean(self):
        cleaned_data = self.cleaned_data
        if cleaned_data["lugar_servicio"] == 2:
            if not cleaned_data["fecha_inicio"]:
                self._errors["fecha_inicio"] = ErrorList(["Este campo es obligatorio."])
            if not cleaned_data["fecha_termino"]:
                self._errors["fecha_termino"] = ErrorList(["Este campo es obligatorio."])
        return cleaned_data

    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla 
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla 

    
class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        exclude = ('desactivar_email', 'numero', 'distribuidor', )
    
    # vendedor = forms.ModelChoiceField(queryset=Vendedor.objects.all(), required=False)

    def __init__(self, *args, **kwargs):
        super(ClienteForm, self).__init__(*args, **kwargs)

    def clean(self):
        cleaned_data = self.cleaned_data
        nombre = cleaned_data.get("nombre")
        sucursal = cleaned_data.get("sucursal")
        clientes = None
        if not self.instance.get_numero():
            clientes = Cliente.objects.filter(nombre=nombre, sucursal=sucursal,
            #numero__isnull=True,
            ).exclude(id=self.instance.id)

        if clientes:
            self._errors["non_field_error"] = ErrorList(["Ya exite un cliente con este nombre y sucursal"])
            
        return cleaned_data
    
    def clean_telefono(self):
        telefono = self.cleaned_data['telefono']
        
        if telefono:
            if not "(" in telefono and not ")" in telefono:
                raise forms.ValidationError("Introduzca la clave lada entre paréntesis")
            else:
                lada = telefono.split("(")[1].split(")")[0]
                lada = lada.replace(" ", "")
          
                if not lada.isnumeric():
                    raise forms.ValidationError("Lada incorrecta")
        return telefono

    def clean_telefono_extra(self):
        telefono = self.cleaned_data['telefono_extra']
        
        if telefono:
            if not "(" in telefono and not ")" in telefono:
                raise forms.ValidationError("Introduzca la clave lada entre paréntesis")
            else:
                lada = telefono.split("(")[1].split(")")[0]
                lada = lada.replace(" ", "")
          
                if not lada.isnumeric():
                    raise forms.ValidationError("Lada incorrecta")
        return telefono


class MarcaForm(forms.ModelForm):
    class Meta:
        model = Marca
        exclude = ()
class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria    
        exclude = ()
class SubCategoriaForm(forms.ModelForm):
    class Meta:
        model = SubCategoria       
        exclude = ()
class MarcaCategoriaForm(forms.ModelForm):
    class Meta:
        model = MarcaCategoria   
        exclude = ()
class PersonaAutorizadaForm(forms.ModelForm):
    class Meta:
        model = PersonaAutorizada
        exclude = ('distribuidor', )
        
class BlockForm(forms.ModelForm):
    class Meta:
        model = Block
        exclude = ()
class StatusForm(forms.ModelForm):
    class Meta:
        model = Status
        fields = ('status',)
        
class DateForm(forms.Form):
    
    fecha = CalendarDateField(required=True)

class ActividadConfirmarForm(forms.ModelForm):
    class Meta:    
        model = Actividad
        fields = ('usuario_asignado', )
         
    
class ActividadForm(forms.ModelForm):
    class Meta:
        model = Actividad
        exclude = ('creado', 'usuario_creado', 'confirmar', 'cancelado', 'usuario_asignado')
    
    fecha_termino = CalendarDateTimeField(required=True)
    fecha_inicio = CalendarDateTimeField(required=True)
    
    def clean(self):    

        cleaned_data = self.cleaned_data    
        fecha_inicio = cleaned_data.get("fecha_inicio")
        fecha_termino = cleaned_data.get("fecha_termino")
            
        if fecha_inicio and fecha_termino:
            if fecha_inicio > fecha_termino:     
                self._errors['fecha_inicio'] = ErrorList(['La fecha de inicio no debe ser mayor a la fecha de termino']) 
            
        return cleaned_data
        
    def __init__(self, *args, **kwargs):
        super(ActividadForm, self).__init__(*args, **kwargs)
        
        if self.instance.id:
            self.initial['fecha_inicio'] = self.instance.fecha_inicio.strftime("%d/%m/%y %H:%M")
            self.initial['fecha_termino'] = self.instance.fecha_termino.strftime("%d/%m/%y %H:%M")

class SolicitudCreditoFilterForm(forms.Form):
    q = forms.CharField(required=False)



class SolicitarCreditoAdminForm(forms.ModelForm):
    class Meta:
        model = SolicitarCredito
        fields = (
            'rc_antiguedad_1',
            'rc_dias_credito_1',
            'monto_credito_1',
            'forma_pago_1',
            'rc_antiguedad_2',
            'rc_dias_credito_2',
            'monto_credito_2',
            'forma_pago_2',
            'rc_antiguedad_3',
            'rc_dias_credito_3',
            'monto_credito_3',
            'forma_pago_3',
            "doc_req_1",
            "doc_req_2",
            "doc_req_3",
        )

        
class EquipoRentaFilterForm(forms.Form):

    OPCIONES_DIS = ( 
                    ("", "-------"),
                    (1, "Disponibles"),
                    (0, "No disponibles"),
    )
    q = forms.CharField(required=False)
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=False)
    disponible = forms.ChoiceField(choices=OPCIONES_DIS, required=False)

class ImagenInicioForm(forms.ModelForm):
    class Meta:
        model = ImagenInicio
        exclude = ('creado', )
    
    fecha_vencimiento = CalendarDateField(required=True)
    url = forms.CharField(widget=forms.TextInput(attrs={'size':30, }))
    
class ContactoForm(forms.ModelForm):
    """
    Esta es el formulario que se utilizará para 
    generar la página de directorio.
    """
    class Meta:
        model = Contacto
        exclude = ()
    nombre = forms.CharField(widget=forms.TextInput(attrs={'size':50, }))
    email = forms.EmailField(widget=forms.TextInput(attrs={'size':50, }))

    
class MundoTecnologiaForm(forms.ModelForm):
    class Meta:	
        model = MundoTecnologia
        exclude = ()
class ClienteFilterForm(forms.Form):
    TIPOS_DISTRIBUIDOR = (
                    ("", "---------"),
                    (1, "D"),
                    (2, "C"),
                    (3, "G")
        )
    q = forms.CharField(required=False)
    tipo = forms.ChoiceField(choices=TIPOS_DISTRIBUIDOR, required=False)

class BitacoraImagenForm(forms.ModelForm):
    class Meta:
        model = BitacoraImagen
        fields = ("imagen", )

class VendedorForm(forms.ModelForm):
    class Meta:
        model = Vendedor
        exclude = ()
        
class AvisoPrivacidadForm(forms.ModelForm):
    class Meta:
        model = AvisoPrivacidad
        fields = ("texto", "titulo", )

class ImportarClienteForm(forms.Form):

    archivo = forms.FileField()
    sucursal = forms.ChoiceField(choices=SUCURSALES) 

    def clean_archivo(self):
        archivo = self.cleaned_data["archivo"]

        if not archivo:
            raise forms.ValidationError('Introduzca un archivo')
        
        if not archivo.name.endswith('.xls') and not archivo.name.endswith('.xlsx'):
            raise forms.ValidationError('Debe ser un archivo con terminación xls o xlsx')
        
        return archivo

class BitacoraGarantiaForm(forms.ModelForm):
    class Meta:
        model = Bitacora
        fields = ("cliente", 
                "fecha_factura", 
                'clave',
                'descripcion', 
                "accesorios", 
                "num_factura", 
                'falla', 
                'refacciones', 
                'observaciones',
                'sucursal',
                'tipo_garantia',
                'no_serie',
                'fecha_recepcion',
                'factura_costo_garantia',
                'garantia_costo',
                'acciones_correctivas', 
                )
    fecha_factura = CalendarDateField(required=True)
    cliente_txt = forms.CharField(widget=forms.TextInput(attrs={ 'id':'id_cliente', }))
    cliente = forms.CharField(widget=forms.HiddenInput(attrs={ 'id':'id_cliente_hidden', }))
    fecha_recepcion = CalendarDateField(required=False)

    def __init__(self, *args, **kwargs):
        super(BitacoraGarantiaForm, self).__init__(*args, **kwargs)
        self.instance.tipo = 0
        if self.instance.cliente:
            cliente = self.instance.cliente
            if cliente.distribuidor.no_clientes_interno:
                self.initial['cliente_txt'] = "%s - %s" % (cliente.distribuidor.no_clientes_interno, cliente.nombre)
            else:  
                self.initial['cliente_txt'] = "%s" % (cliente.nombre)

        if self.instance.id:
            if self.instance.garantia_costo:
                self.fields["factura_costo_garantia"].required = False




 
    def _get_validation_exclusions(self):
        exclude = super(BitacoraGarantiaForm, self)._get_validation_exclusions()
        exclude.remove('tipo')
        return exclude

    def clean_cliente(self):
        cliente_id = string_to_int(self.cleaned_data['cliente'])
        data = self.data.get("cliente_txt")
        sucursal = string_to_int(self.data.get("sucursal"))
        #if "-" in data:
        #    arr = data.split(" - ")
        #    if arr[0].isnumeric():
        #        numero = arr[0]
        #        try:
        #            nombre = arr[1]
        #        except IndexError:
        #            nombre = ""
        #    else:
        #        numero = ""
        #        nombre = ""
        # 
        #   if numero and nombre:
        #        cliente = get_object_or_None(Cliente, numero=numero, nombre=nombre, sucursal=sucursal)
        #    else:
        #        cliente = None
        #else:
        #    cliente = get_object_or_None(Cliente, nombre=data, sucursal=sucursal, numero__isnull=True)
        if cliente_id:
            cliente = get_object_or_None(Cliente, id=cliente_id)
        else:
            cliente = None
        if not cliente:
            raise forms.ValidationError('No se encuentra ese cliente')
        self.cleaned_data['cliente'] = cliente.id
        
        return cliente

    def clean_falla(self):
        falla = self.cleaned_data["falla"]
        if self.instance.id:
            falla = self.instance.falla
        else:
            if not falla:
                raise forms.ValidationError("Este campo es obligatorio.")

        return falla    

    def clean_garantia_costo(self):
        gc = self.cleaned_data["garantia_costo"]
        if self.instance.id:
            gc = self.instance.garantia_costo

        return gc


class BitacoraRenovacionSertec(forms.Form):
    no_years = forms.ChoiceField(choices=Bitacora.NO_YEARS_OP) 
    factura_costo_garantia = forms.CharField()


BitacoraImagenFS = modelformset_factory(BitacoraImagen, form=BitacoraImagenForm, can_delete=True, extra=1)  
MundoTecnologiaFS = modelformset_factory(MundoTecnologia, form=MundoTecnologiaForm, can_delete=True, extra=1)
ContactoFS = modelformset_factory(Contacto, form=ContactoForm, can_delete=True, extra=1)
ImagenInicioFS = modelformset_factory(ImagenInicio, form=ImagenInicioForm, can_delete=True, extra=1)
BlockFS = modelformset_factory(Block, form=BlockForm, can_delete=True, extra=1)
ImagenFS = modelformset_factory(Imagen, form=ImagenForm, can_delete=True, extra=1)
RentaDetalleFS = modelformset_factory(RentaDetalle, form=RentaDetalleForm, can_delete=True, extra=1)
PersonaAutorizadaFS = modelformset_factory(PersonaAutorizada, form=PersonaAutorizadaForm, can_delete=False, extra=5)

