from django.urls import path, re_path
from .views import (
    admin, administrar_productos, administrar_imagenes, administrar_directorio,
    usuarios, usuario, cambiar_password, eliminar_usuario, eliminar_lista,
    clientes, cliente, ver_distribuidor, cliente_contains, subir_clientes, eliminar_cliente, block, agregar_status,
    vacantes, vacante, eliminar_vacante, solicitudes_trabajo, bitacoras_sertec, bitacora_sertec, renovar_bitacora_sertec,
    bitacoras_garantia, bitacora_garantia,
    bitacoras_servicio, bitacora_servicio,
    bitacoras_interno, bitacora_interno, agregar_bitacora_sertec, agregar_bitacora_garantia,
    agregar_bitacora_servicio, agregar_bitacora_interno,
    imprimir_bitacora_sertec, imprimir_bitacora_garantia,
    imprimir_bitacora_servicio, imprimir_bitacora_interno,
    pdf_tablas,
    cancelar_bitacora, cerrar_bitacora, solicitudes_credito_distribuidor, solicitud_credito_distribuidor,
    solicitudes_credito_empresas, solicitud_credito_empresas,
    generar_clave_distribuidor,
    direcciones_email, generar_remitente,
    desactivar_email, activar_email, marca_categoria, edit_marca, edit_categoria, edit_subcategoria,
    edit_url, eliminar_marca, eliminar_categoria, eliminar_subcategoria,
    eliminar_url, equipo_renta, edit_equipo_renta, eliminar_equipo_renta,
    rentas, renta, renta_pdf, actividad, confirmar_actividad, actividades, eliminar_actividad,
    aviso_vencimiento, aviso_bitacoras_vencidas,
    encuestas, ver_encuesta,
    catalogo_vendedores, convertir_proyecto, cancelar_proyecto, eliminar_clientes_repetidos, vendedor,
    imagenes_inicio, admin_mundo_tecnologia,
    editar_distribuidor, eliminar_solicitud_trabajo, database_backup_compuproveedores,
    aviso_privacidad, avisos, subir_vendedores
)

urlpatterns = [
    path('admin/', admin, name="admin"),
    path('administrar_productos/', administrar_productos, name="administrar_productos"),
    path('administrar_imagenes/', administrar_imagenes, name="administrar_imagenes"),
    path('administrar_directorio/', administrar_directorio, name="administrar_directorio"),
    path('usuarios/', usuarios, name="usuarios"),
    re_path(r'^usuario/(.+)/$', usuario, name="usuario"),
    re_path(r'^cambiar_password/(\d+)/$', cambiar_password, name="cambiar_password"),
    re_path(r'^eliminar_usuario/(.+)/$', eliminar_usuario, name="eliminar_usuario"),
    re_path(r'^eliminar_lista/(\d+)/$', eliminar_lista, name="eliminar_lista"),

    path('clientes/', clientes, name="clientes"),
    re_path(r'^cliente/(.+)/$', cliente, name="cliente"),
    re_path(r'^ver_distribuidor/(.+)/$', ver_distribuidor, name="ver_distribuidor"),
    path('cliente_contains/', cliente_contains, name='cliente_contains'),


    path('subir_clientes/', subir_clientes, name="subir_clientes"),
    re_path(r'^eliminar_cliente/(.+)/$', eliminar_cliente, name="eliminar_cliente"),

    path('block/', block, name="block"),

    re_path(r'^agregar_status/(\d+)/$', agregar_status, name="agregar_status"),

    path('vacantes/', vacantes, name="vacantes"),
    re_path(r'^vacante/(.+)/$', vacante, name="vacante"),
    re_path(r'^eliminar_vacante/(\d+)/$', eliminar_vacante, name="eliminar_vacante"),
    path('solicitudes_trabajo/', solicitudes_trabajo, name="solicitudes_trabajo"),

    path('bitacoras_sertec/', bitacoras_sertec, name="bitacoras_sertec"),
    re_path(r'^bitacora_sertec/(.*)/$', bitacora_sertec, name="bitacora_sertec"),
    re_path(r'^renovar_bitacora_sertec/(.*)/$', renovar_bitacora_sertec, name="renovar_bitacora_sertec"),

    path('bitacoras_garantia/', bitacoras_garantia, name="bitacoras_garantia"),
    re_path(r'^bitacora_garantia/(.*)/$', bitacora_garantia, name="bitacora_garantia"),

    path('bitacoras_servicio/', bitacoras_servicio, name="bitacoras_servicio"),
    re_path(r'^bitacora_servicio/(.*)/$', bitacora_servicio, name="bitacora_servicio"),

    path('bitacoras_reporte_tecnico_interno/', bitacoras_interno, name="bitacoras_interno"),
    re_path(r'^bitacora_reporte_tecnico_interno/(\d+)/$', bitacora_interno, name="bitacora_interno"),


    path('agregar_bitacora_sertec/', agregar_bitacora_sertec, name="agregar_bitacora_sertec"),
    path('agregar_bitacora_garantia/', agregar_bitacora_garantia, name="agregar_bitacora_garantia"),
    path('agregar_bitacora_servicio/', agregar_bitacora_servicio, name="agregar_bitacora_servicio"),
    path('agregar_bitacora_interno/', agregar_bitacora_interno, name="agregar_bitacora_interno"),

    re_path(r'^imprimir_bitacora_sertec/(.+)/$', imprimir_bitacora_sertec, name="imprimir_bitacora_sertec"),
    re_path(r'^imprimir_bitacora_garantia/(.+)/$', imprimir_bitacora_garantia, name="imprimir_bitacora_garantia"),
    re_path(r'^imprimir_bitacora_servicio/(.+)/$', imprimir_bitacora_servicio, name="imprimir_bitacora_servicio"),
    re_path(r'^imprimir_bitacora_interno/(.+)/$', imprimir_bitacora_interno, name="imprimir_bitacora_interno"),

    re_path(r'^pdf_tablas/(\d+)/$', pdf_tablas, name="pdf_tablas"),

    re_path(r'^cancelar_bitacora_sertec/(.+)/$', cancelar_bitacora, {'tipo': 4}, name="cancelar_bitacora_sertec"),
    re_path(r'^cerrar_bitacora_sertec/(.+)/$', cerrar_bitacora, {'tipo': 4}, name="cerrar_bitacora_sertec"),

    re_path(r'^cancelar_bitacora_garantia/(.+)/$', cancelar_bitacora, {'tipo': 0}, name="cancelar_bitacora_garantia"),
    re_path(r'^cerrar_bitacora_garantia/(.+)/$', cerrar_bitacora, {'tipo': 0}, name="cerrar_bitacora_garantia"),

    re_path(r'^cancelar_bitacora_servicio/(.+)/$', cancelar_bitacora, {'tipo': 1}, name="cancelar_bitacora_servicio"),
    re_path(r'^cerrar_bitacora_servicio/(.+)/$', cerrar_bitacora, {'tipo': 1}, name="cerrar_bitacora_servicio"),

    re_path(r'^cancelar_bitacora_interno/(.+)/$', cancelar_bitacora, {'tipo': 2}, name="cancelar_bitacora_interno"),
    re_path(r'^cerrar_bitacora_interno/(.+)/$', cerrar_bitacora, {'tipo': 2}, name="cerrar_bitacora_interno"),

    path('solicitudes_credito_distribuidores/', solicitudes_credito_distribuidor, name="solicitudes_credito_distribuidor"),
    re_path(r'^solicitud_credito_distribuidor/(.+)/$', solicitud_credito_distribuidor, name="solicitud_credito_distribuidor"),

    path('solicitudes_credito_empresas/', solicitudes_credito_empresas, name="solicitudes_credito_empresas"),
    re_path(r'^solicitud_credito_empresas/(.+)/$', solicitud_credito_empresas, name="solicitud_credito_empresas"),

    re_path(r'^generar_clave_distribuidor/(.+)/$', generar_clave_distribuidor, name="generar_clave_distribuidor"),

    path('direcciones_email/', direcciones_email, name="direcciones_email"),
    path('generar_remitente/', generar_remitente, name="generar_remitente"),
    re_path(r'^desactivar_email/(.+)/(.+)/$', desactivar_email, name="desactivar_email"),
    re_path(r'^activar_email/(.+)/(.+)/$', activar_email, name="activar_email"),

    path('marca_categoria/', marca_categoria, name="marca_categoria"),
    re_path(r'^edit_marca/(.+)/$', edit_marca, name="edit_marca"),
    re_path(r'^edit_categoria/(.+)/$', edit_categoria, name="edit_categoria"),
    re_path(r'^edit_subcategoria/(.+)/$', edit_subcategoria, name="edit_subcategoria"),
    re_path(r'^edit_url/(.+)/$', edit_url, name="edit_url"),
    re_path(r'^eliminar_marca/(.+)/$', eliminar_marca, name="eliminar_marca"),
    re_path(r'^eliminar_categoria/(.+)/$', eliminar_categoria, name="eliminar_categoria"),
    re_path(r'^eliminar_subcategoria/(.+)/$', eliminar_subcategoria, name="eliminar_subcategoria"),
    re_path(r'^eliminar_url/(.+)/$', eliminar_url, name="eliminar_url"),

    path('equipo_renta/', equipo_renta, name="equipo_renta"),
    re_path(r'^edit_equipo_renta/(.+)/$', edit_equipo_renta, name="edit_equipo_renta"),
    re_path(r'^eliminar_equipo_renta/(.+)/$', eliminar_equipo_renta, name="eliminar_equipo_renta"),

    path('rentas/', rentas, name="rentas"),
    re_path(r'^renta/(.+)/$', renta, name="renta"),
    re_path(r'^renta_pdf/(.+)/$', renta_pdf, name="renta_pdf"),

    re_path(r'^actividad/(\d+)/$', actividad, name="actividad"),
    re_path(r'^confirmar_actividad/(\d+)/$', confirmar_actividad, name="confirmar_actividad"),
    path('actividades/', actividades, name="actividades"),
    re_path(r'^eliminar_actividad/(\d+)/$', eliminar_actividad, name="eliminar_actividad"),

    path('aviso_vencimiento/', aviso_vencimiento, name="aviso_vencimiento"),
    path('aviso_bitacoras_vencidas/', aviso_bitacoras_vencidas, name="aviso_bitacoras_vencidas"),

    path('encuestas/', encuestas, name="encuestas"),
    re_path(r'^ver_encuesta/(\d+)/$', ver_encuesta, name="ver_encuesta"),

    path('catalogo_vendedores/', catalogo_vendedores, name="catalogo_vendedores"),
    re_path(r'^convertir_proyecto/(.*)/$', convertir_proyecto, name="convertir_proyecto"),
    re_path(r'^cancelar_proyecto/(.*)/$', cancelar_proyecto, name="cancelar_proyecto"),


    path('eliminar_clientes_repetidos/', eliminar_clientes_repetidos, name="eliminar_clientes_repetidos"),
    re_path(r'^vendedor/(.*)/$', vendedor, name="admin-vendedor"),

    path('imagenes_inicio/', imagenes_inicio, name="admin-imagenes_inicio"),
    path('mundo_tecnologia/', admin_mundo_tecnologia, name="admin_mundo_tecnologia"),
    re_path(r'^editar_distribuidor/(.*)/$', editar_distribuidor, {"distribuidor": True}, name="admin_editar_distribuidor"),
    re_path(r'^editar_empresa/(.*)/$', editar_distribuidor, {"distribuidor": False}, name="admin_editar_empresa"),
    re_path(r'^eliminar_solicitud_trabajo/(\d+)/$', eliminar_solicitud_trabajo, name="eliminar_solicitud_trabajo"),
    path('database_backup_compuproveedores/', database_backup_compuproveedores, name="database_backup_compuproveedores"),

    path('aviso_privacidad/', aviso_privacidad, name="admin-aviso_privacidad"),
    path('avisos/', avisos, name="admin-avisos"),
    path('subir_vendedores/', subir_vendedores, name="admin-subir_vendedores"),

]
