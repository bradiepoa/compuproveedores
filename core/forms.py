
# -*- coding: utf-8 -*- 
from django import forms
from django.forms.models import modelformset_factory
from .models import *
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth.models import User
from annoying.functions import get_object_or_None
from core.preguntas_respuestas import *
from django.forms.utils import ErrorList
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

class ListaForm(forms.ModelForm):
    class Meta:
        model = Lista
        exclude = ()
    fecha_vencimiento = CalendarDateField(required=False)
    

class ConcretarCitaForm(forms.ModelForm):
    class Meta:
        model = ConcretarCita
        exclude = ('desactivar_email', 'created', 'solucion')
        #fields=("texto", )
        
        
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris',  }) ) 
    telefono = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris telefono_lada', }), label=("Teléfono")) 
    email = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label=("E-mail") ) 
    empresa = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label=("Empresa"), required=False) 
    comentarios = forms.CharField(widget=forms.Textarea(attrs={'class':'input_gris_comentarios', },), required=True)

    def __init__(self, *args, **kwargs):
        super(ConcretarCitaForm, self).__init__(*args, **kwargs)

    

class SolicitudTrabajoForm(forms.ModelForm):
    class Meta:
        model = SolicitudTrabajo
        exclude = ('desactivar_email', 'created', 'apellido', 'vacante' )
        #fields=("texto", )
        
        
    curriculum = forms.FileField(widget=forms.FileInput(attrs={}), label="", )
    
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris',  }) ) 
    telefono = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris telefono_lada', }), label=("Teléfono (Lada)")) 
    email = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label=("Correo Electrónico") ) 
    puesto = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label=("Puesto"), required=False) 
    aspiracion = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label="Sueldo", required=False ) 

    def __init__(self, *args, **kwargs):
        super(SolicitudTrabajoForm, self).__init__(*args, **kwargs)

        
class MensajeContactoForm(forms.ModelForm):
    class Meta:
        model = MensajeContacto
        exclude = ('desactivar_email', )
        
    nombre = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris',  }) ) 
    telefono = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris telefono_lada', }), label=("Teléfono")) 
    empresa = forms.CharField(widget=forms.TextInput(attrs={'class':'input_gris', }), label=("Empresa") ) 
    comentarios = forms.CharField(widget=forms.Textarea(attrs={'class':'input_gris_comentarios', },), required=True)
    
class ObtenerBitacoraForm(forms.Form):
    
    guia_garantia = forms.CharField(widget=forms.PasswordInput(attrs={'class':'input_gris'}), max_length=7, required=False)
    guia_servicio = forms.CharField(widget=forms.PasswordInput(attrs={'class':'input_gris'}), max_length=7, required=False)
    
    def clean_guia_garantia(self):
        garantia = self.data.get("garantia")
        guia = self.cleaned_data['guia_garantia']
        
        if garantia:
            if guia:
                bitacora = get_object_or_None(Bitacora, tipo=0, guia=guia)
                if not bitacora:
                    raise forms.ValidationError("Código Inválido")
            else:
                raise forms.ValidationError("Este campo es obligatorio")
        return guia

    def clean_guia_servicio(self):
        servicio = self.data.get("servicio")
        guia = self.cleaned_data['guia_servicio']
        
        if servicio:
            if guia:
                bitacora = get_object_or_None(Bitacora, tipo=1, guia=guia)
                if not bitacora:
                    raise forms.ValidationError("Código Inválido")
            else:
                raise forms.ValidationError("Este campo es obligatorio")
        return guia
        

class DistribuidorForm(forms.ModelForm):
    class Meta:
        model = Distribuidor
        exclude = ('clave_modificacion',
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
                   'no_clientes_interno',
                   'clasificacion_interno',
                   'no_vendedor_interno',
                   'dias_credito_interno',
                   'limite_credito_interno',
                   'encargado_entregas_pago',
                   'pagina_web_pago', 
                   'titular_cuenta',
                   'banco',
                   'ejecutivo',
                   'no_cuenta',
                   'telefono_bancarias',
                   'promedio_mensual',
                   'antiguedad_bancarias',
                   'tipo_distribuidor',
                   'vendedor_interno',
                   )



    SUCURSALES = (
          ("", '---------'),
          (1, 'TIJUANA'),
          (2, 'HERMOSILLO'),
          (3, 'CULIACAN'),
          (4, 'AGUASCALIENTES'),
    )
    sucursal = forms.ChoiceField(choices=SUCURSALES, required=True) 

    def clean(self):
        p_required_fields = [
    
    "pagos_banco_1",
    "pagos_no_cuenta_1",
    "pagos_banco_2",
    "pagos_no_cuenta_2",
    "contacto_revision_facturas",
    "dias_revision",
    "horario_revision",
    "telefono_revision",
    "doc_revision",    
    "encargado_departamento_pago",
    "email_pago",
    "telefono_pago",
    "dias_pago",
    "horario_pago",
    "correo_envio_facturas",
    "documento_revision_pago",
    "nombre_empresa",
    "ciudad_comerciales",
    "estado_comerciales",
    "atencion_comerciales",
    "telefono_comerciales",
    "nombre_empresa_2",
    "ciudad_comerciales_2",
    "estado_comerciales_2",
    "atencion_comerciales_2",
    "telefono_comerciales_2",
    "nombre_empresa_3",
    "ciudad_comerciales_3",
    "estado_comerciales_3",
    "atencion_comerciales_3",
    "telefono_comerciales_3",
    
    
]
    
        cleaned_data = self.cleaned_data
        for f in p_required_fields:
            if not cleaned_data["no_usar_datos_bancarios"] and not cleaned_data[f]:
                self._errors[f] = ErrorList(["Campo requerido."])
                
        return cleaned_data
        
        
    def __init__(self, *args, **kwargs):
        super(DistribuidorForm, self).__init__(*args, **kwargs)
  
                                    

class SolicitarCreditoForm(forms.ModelForm):
    class Meta:
        model = SolicitarCredito
        exclude = (
            'created', 
            'distribuidor',
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
            'razon_social',
            'dist',
        )



class BuscarVacanteForm(forms.Form):
    
    CIUDADES = (
                (0, "Todas"),
                ('Matriz Hermosillo', 'Matriz Hermosillo'),
                ('Sucursal Tijuana', 'Sucursal Tijuana'),
                ('Sucursal Culiacan', 'Sucursal Culiacan'),
                ('Sucursal Aguascalientes', 'Sucursal Aguascalientes'),
    )
    q = forms.CharField(max_length="250", required=False, widget=forms.TextInput(attrs={'size':'30', 'class':"input_gris"}))
    ciudad = forms.ChoiceField(choices=CIUDADES)
class CurriculumForm(forms.ModelForm):
    class Meta:
        model = SolicitudTrabajo
        fields = ('curriculum', )
        
class ContactanosForm(forms.Form):
    
    serie = forms.CharField(max_length=255, widget=forms.TextInput(attrs={'size':'8', 'class':"input_gris"}))
    folio = forms.IntegerField(widget=forms.TextInput(attrs={'size':'8', 'class':"input_gris"}))   
    
    
    
    def clean_serie(self):
        serie = self.cleaned_data['serie'].upper()
        serie_correcta = False
        series = ["H", "CUL", "AGS", "TIJ"] 
        
        for s in series:
            if s == serie:
                serie_correcta = True
        
        if not serie_correcta:
            raise forms.ValidationError('La serie es incorrecta')

        return serie

class EmailForm(forms.Form):
    
    nombre = forms.CharField(max_length=250, widget=forms.TextInput(attrs={'size':'30', 'style':"color:#BCBCBC; "}))
    destinatario = forms.EmailField(widget=forms.TextInput(attrs={'size':'30', 'style':"color:#BCBCBC;"}))
    
    def __init__(self, *args, **kwargs):
        super(EmailForm, self).__init__(*args, **kwargs)
        self.initial['nombre'] = "Tu nombre"
        self.initial['destinatario'] = "Correo electrónico"
        



class EncuestaSatisfaccionForm(forms.ModelForm):
    class Meta:
        model = EncuestaSatisfaccion
        exclude = ('pregunta_6', 'pregunta_7')
        
    
    
    pregunta_1 = forms.ChoiceField(choices=choices_1, widget=forms.RadioSelect, label=label_1)
                                   
    pregunta_2 = forms.ChoiceField(choices=choices_2, widget=forms.RadioSelect, label=label_2)
    pregunta_3 = forms.ChoiceField(choices=choices_3, widget=forms.RadioSelect, label=label_3)
    pregunta_4 = forms.ChoiceField(choices=choices_4, widget=forms.RadioSelect, label=label_4)
    pregunta_5 = forms.ChoiceField(choices=choices_5, widget=forms.RadioSelect, label=label_5)
    
    pregunta_6 = forms.CharField(label=label_6, required=False)
    pregunta_6_1 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_1)
    pregunta_6_2 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_2)
    pregunta_6_3 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_3)
    pregunta_6_4 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_4)
    pregunta_6_5 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_5)
    pregunta_6_6 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_6)
    pregunta_6_7 = forms.ChoiceField(choices=choices_6, widget=forms.RadioSelect, label=label_6_7)
    
    pregunta_7 = forms.CharField(label=label_7, required=False)
    pregunta_7_1 = forms.ChoiceField(choices=choices_7, widget=forms.RadioSelect, label=label_7_1)
    pregunta_7_2 = forms.ChoiceField(choices=choices_7, widget=forms.RadioSelect, label=label_7_2)
    pregunta_7_3 = forms.ChoiceField(choices=choices_7, widget=forms.RadioSelect, label=label_7_3)
    pregunta_7_4 = forms.ChoiceField(choices=choices_7, widget=forms.RadioSelect, label=label_7_4)
    pregunta_7_5 = forms.ChoiceField(choices=choices_7, widget=forms.RadioSelect, label=label_7_5)
    
    pregunta_8 = forms.ChoiceField(choices=choices_8, widget=forms.RadioSelect, label=label_8)
    pregunta_9 = forms.ChoiceField(choices=choices_9, widget=forms.RadioSelect, label=label_9)

    comentarios = forms.CharField(widget=forms.Textarea, label=label_10)
    
    

#    def clean(self):
#        """
#        A workaround as the cleaned_data seems to contain u'1' and u'0'. There may be a better way.
#        """
        #self.cleaned_data['to_send_form'] = int(self.cleaned_data['to_send_form'])
        #return self.cleaned_data

class ActualizarDatosDForm(forms.Form):

    no_distribuidor = forms.CharField(widget=forms.TextInput(attrs={'size':'30', 'class':"input_gris"}))    
    rfc = forms.CharField(widget=forms.TextInput(attrs={'size':'30', 'class':"input_gris"}))  

    def clean(self):
        cleaned_data = self.cleaned_data
        rfc = cleaned_data.get("rfc")
        no_distribuidor = cleaned_data.get("no_distribuidor")

        if rfc and no_distribuidor:
            distribuidor = get_object_or_None(Distribuidor, rfc=rfc, tipo_distribuidor=1)
            if not distribuidor:
                self._errors["non_field_error"] = ErrorList(["Registro de proveedor no encontrado, Contacte un administrativo."])

        return cleaned_data    

class ActualizarDatosCForm(forms.Form):

    no_distribuidor = forms.CharField(widget=forms.TextInput(attrs={'size':'30', 'class':"input_gris"}))    
    rfc = forms.CharField(widget=forms.TextInput(attrs={'size':'30', 'class':"input_gris"}))  

    def clean(self):
        cleaned_data = self.cleaned_data
        rfc = cleaned_data.get("rfc")
        no_distribuidor = cleaned_data.get("no_distribuidor")

        if rfc and no_distribuidor:
            distribuidor = Distribuidor.objects.filter(rfc=rfc, tipo_distribuidor=2)
            if not distribuidor:
                self._errors["non_field_error"] = ErrorList(["Registro de proveedor no encontrado, Contacte un administrativo."])

        return cleaned_data
        


    
