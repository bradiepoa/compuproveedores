# -*- coding: utf-8 -*- 
from core.models import Imagen, Categoria
from django.conf import settings
def custom(request):
    
    import datetime
    hoy = datetime.date.today().strftime("%Y-%m-%d")
    
    soluciones_tecnologicas = (
        ['active_directory', 'ACTIVE DIRECTORY'],
        ['aulas_interactivas', 'AULAS INTERACTIVAS'],
        ['dynamic_print_routing', 'DYNAMIC PRINT ROUTING'],
        ['hp_data_protector', 'HP DATA PROTECTOR SOFTWARE PARA PC’S.'],
        ['hp_web_jetadmin', 'HP WEB JETADMIN'],
        ['hp_bto', 'HP’ S BUSINESS TECHNOLOGY OPTIMIZATION'],
        ['ipm', 'INTELLIGENT PRINT MANAGEMENT'],
        ['megatrack', 'MEGATRACK'],
        ['networking', 'NETWORKING'],
        ['office_365', 'OFFICE 365'],
        ['servidores', 'SERVIDORES'],
        ['sitescope', 'SITESCOPE'],
        ['storage', 'STORAGE'],
        ['symantec_system_recovery', 'SYMANTEC SYSTEM RECOVERY 2011'],
        ['virtualizacion', 'VIRTUALIZACIÓN'],
        #['catalogo_soluciones', 'CATÁLOGO DE SOLUCIONES'],
        
    )    
    
    
    
    variables = {'imagenes':Imagen.objects.filter(activo=True).exclude(fecha_vencimiento__lte=hoy),
                 'categorias_menu':Categoria.objects.all(), 
                 'soluciones_tecnologicas':soluciones_tecnologicas,
                 "STATIC_URL":settings.STATIC_URL,
                 }
    return variables
    
