# -*- coding: utf-8 -*- 
soluciones = (['active_directory', 'ACTIVE DIRECTORY'],
        ['aulas_interactivas', 'AULAS INTERACTIVAS'],
        ['dynamic_print_routing', 'DYNAMIC PRINT ROUTING'],
        ['hp_data_protector', 'HP DATA PROTECTOR SOFTWARE PARA PC’S.'],
        ['hp_web_jetadmin', 'HP WEB JETADMIN'],
        ['hp_bto', 'HP’ S BUSINESS TECHNOLOGY OPTIMIZATION (BTO)'],
        ['ipm', 'INTELLIGENT PRINT MANAGEMENT'],
        ['megatrack', 'MEGATRACK'],
        ['networking', 'NETWORKING'],
        ['office_365', 'OFFICE 365'],
        ['servidores', 'SERVIDORES'],
        ['sitescope', 'SITESCOPE'],
        ['storage', 'STORAGE'],
        ['symantec_systema_recovery', 'SYMATEC SYSTEM RECOVERY 2011'],
        ['virtualizacion', 'VIRTUALIZACIÓN'],
        ['catalogo_soluciones', 'CATÁLOGO DE SOLUCIONES'],
)

for s in soluciones:
    t = """{% extends "soluciones_tecnologicas/base.html" %}
{% block soluciones_title %}
    """+ (s[1]) +"""
{% endblock %}

{% block soluciones_text %}

{% endblock %}"""
    f = open("%s.html" % s[0], 'w')
    f.write(t)
    f.close()
            
