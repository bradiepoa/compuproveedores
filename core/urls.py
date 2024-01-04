from django.urls import path, re_path

from .views import (
    actualizar_datos, redireccion, index, en_construccion, productos, productos_servicios,
    directorio, contacto, contactanos, bolsa_trabajo, distribuidores,
    registro_distribuidor,
    encuesta, solicitar_credito_datos, solicitar_credito,
    seleccionar, nosotros, solicitar_credito_pdf, soluciones, solucion,
    distribuidor_pdf,
    ver_block, promociones, empresas, rastreo, nuestra_historia, resultado_bolsa_trabajo,
    mundo_tecnologia, certificaciones, concretar_cita,
    validate_contactanos, terminos_condiciones_garantias,
    soluciones_tecnologicas, aviso_privacidad
)

urlpatterns = [
    #     path('', redireccion, name="redireccion"),
    path('', index, name="index"),
    path('en_construccion/', en_construccion, name="en_construccion"),
    path('productos/', productos, name="productos"),
    path('productos_servicios/', productos_servicios, name="productos_servicios"),
    path('directorio/', directorio, name="directorio"),

    path('contacto/', contacto, name="contacto"),
    path('contactanos/', contactanos, name="contactanos"),
    path('bolsa_trabajo/', bolsa_trabajo, name="bolsa_trabajo"),
    path('distribuidores/', distribuidores, name="distribuidores"),
    path('registro_distribuidor/', registro_distribuidor,
         {'distribuidor': True}, name="registro_distribuidor"),
    re_path(r'^modificacion_distribuidor/(.+)/(.+)/$', registro_distribuidor,
            {'distribuidor': True}, name="modificacion_distribuidor"),
    re_path(r'^modificacion_empresa/(.+)/(.+)/$', registro_distribuidor,
            {'distribuidor': False}, name="modificacion_empresa"),
    path('encuesta/', encuesta, name="encuesta"),
    path('solicitar_credito_distribuidor/', solicitar_credito_datos,
         {'es_dis': True}, name="solicitar_credito_distribuidor_datos"),
    re_path(r'^solicitar_credito_distribuidor/(.*)/$', solicitar_credito,
            {'distribuidor': True}, name="solicitar_credito_distribuidor"),

    path('seleccionar/', seleccionar, name="seleccionar"),
    path('nosotros/', nosotros, name="nosotros"),
    path('soluciones/', soluciones, name="soluciones"),
    re_path(r'^solucion/(.*)/$', solucion, name="solucion"),

    path('distribuidor_pdf/(\d+)/$', distribuidor_pdf,
         {'distribuidor': True}, 'distribuidor_pdf'),
    path('alta_distribuidor_pdf/(\d+)/$', distribuidor_pdf,
         {'distribuidor': True, 'actualizacion': False}, 'distribuidor_pdf_alta'),
    path('distribuidores/actualizar_datos/', actualizar_datos,
         {'es_distribuidor': True}, 'actualizar_datos_distribuidor'),
    path('empresas/actualizar_datos/', actualizar_datos,
         {'es_distribuidor': False}, 'actualizar_datos_empresa'),
    path('empresa_pdf/(\d+)/$', distribuidor_pdf,
         {'distribuidor': False}, 'empresa_pdf'),
    path('empresa_pdf_alta/(\d+)/$', distribuidor_pdf,
         {'distribuidor': False, 'actualizacion': False}, 'empresa_pdf_alta'),

    path('solicitar_credito_dis_pdf/(\d+)/$', solicitar_credito_pdf,
         {'distribuidor': True}, 'solicitar_credito_dis_pdf'),
    path('solicitar_credito_cli_pdf/(\d+)/$', solicitar_credito_pdf,
         {'distribuidor': False}, 'solicitar_credito_cli_pdf'),

    path('ver_block/', ver_block, name="ver_block"),

    path('promociones/', promociones, name="promociones"),

    path('empresas/', empresas, name="empresas"),
    path('registro_empresa/', registro_distribuidor,
         {'distribuidor': False}, name="registro_empresa"),
    re_path(r'^solicitar_credito_empresa/(.*)/$', solicitar_credito,
            {'distribuidor': False}, "solicitar_credito_empresa"),
    path('solicitar_credito_empresa/', solicitar_credito_datos,
         {'es_dis': False}, "solicitar_credito_empresa_datos"),

    path('garantia/', rastreo, {'tipo': 0}, name="garantia"),
    path('servicio_tecnico/', rastreo, {'tipo': 1}, name="servicio"),
    path('nuestra_historia/', nuestra_historia, name="nuestra_historia"),
    path('resultado_bolsa_trabajo/', resultado_bolsa_trabajo,
         name="resultado_bolsa_trabajo"),

    path('mundo_tecnologia/', mundo_tecnologia, name="mundo_tecnologia"),
    path('certificaciones/', certificaciones, name="certificaciones"),
    re_path(r'^concretar_cita/(.+)/$', concretar_cita, name="concretar_cita"),

    path('validate_contactanos/', validate_contactanos,
         name="validate_contactanos"),
    path('terminos_condiciones_garantias/', terminos_condiciones_garantias,
         name="terminos_condiciones_garantias"),

    # Fijas
    re_path(r'^soluciones_tecnologicas/(.+)/$',
            soluciones_tecnologicas, name="soluciones_tecnologicas"),
    path('aviso_privacidad/', aviso_privacidad, name="aviso_privacidad"),
]
