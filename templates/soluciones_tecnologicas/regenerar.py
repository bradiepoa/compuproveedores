# -*- coding: utf-8 -*- 
import subprocess
soluciones_tecnologicas = (
        #['active_directory', 'ACTIVE DIRECTORY'],
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

for s in soluciones_tecnologicas:
    
    ac = open("active_directory.html", 'r')
    str_command = 'cp %s.html %s_respaldo.html' % (s[0], s[0])
    print str_command
    subprocess.call("pwd")
    #subprocess.call(str_command)
    
    f = open("%s.html" % s[0], 'w')
    txt = ac.read()
    txt = txt.replace('    ACTIVE DIRECTORY', '    %s' % s[1])
    f.write(txt)
    f.close()
