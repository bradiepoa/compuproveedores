from core.functions import string_to_int, string_to_decimal
def cantidad_letra(num, moneda="PESOS", prefijo="M.N."):

    num = unicode(string_to_decimal(num))

    list = num.split('.')
    int = '00000'+list[0]
    de_pesos = False
    miles_millones = int[-12:-9]
    millones = int[-9:-6]
    miles = int[-6:-3]
    unidades = int[-3:]
    text = ''

    if miles_millones == '001': 
	    text += ' UN MIL '
	

    elif miles_millones > '001':
	    text += centena(miles_millones) + ' MIL '
	
    
    if millones == '001':
        text += ' UN MILLON '
    
    elif millones > '001' or miles_millones > '000':
        text += centena(millones) + ' MILLONES '
    
    
    if miles == '001':
        text += 'UN MIL ' 
    elif miles > '001':   
        text += centena(miles) + ' MIL '    
    
    if miles_millones > '000' or millones >= '001':
	    if miles == '000' and unidades == '000': 
	        text += centena(unidades) + 'DE %s' % moneda
	        de_pesos = True
 
    
    if not de_pesos: 
        text += centena(unidades) + ' %s' % moneda
    
    if len(list) > 1:
        dec = list[1]
    else:
        dec = '00' 
    if len(dec) > 2 :
        dec = dec[:2]
    elif len(dec) == 1 :
        dec = dec + '0'
    text += ' '+ dec + '/100 %s' % prefijo
    return text

def unidad(u):
    text = ''
    if u == '9':
        text = 'NUEVE'
    elif u == '8':
        text = 'OCHO'
    elif u == '7':
        text = 'SIETE'
    elif u == '6':
        text = 'SEIS'
    elif u == '5':
        text = 'CINCO'
    elif u == '4':
        text = 'CUATRO'
    elif u == '3':
        text = 'TRES'
    elif u == '2':
        text = 'DOS'
    elif u == '1':
        text = 'UN'
    return text

def decena(n):
    text = ''
    if len(n) < 2 :
        text = unidad(n)
    else:
        d = n[-2]
        u = n[-1]
        if d == '9' :
            if u == '0' :
                text = 'NOVENTA' 
            else :
                text = 'NOVENTA Y ' + unidad(u)
        elif d == '8':
            if u == '0' :
                text = 'OCHENTA'
            else :
                text = 'OCHENTA Y ' + unidad(u)
        elif d == '7':
            if u == '0' :
                text = 'SETENTA' 
            else :
                text = 'SETENTA Y ' + unidad(u)
        elif d == '6':
            if u == '0' :
                text = 'SESENTA'
            else :
                text = 'SESENTA Y  ' + unidad(u)
        elif d == '5':
            if u == '0' :
                text = 'CINCUENTA'
            else :
                text = 'CINCUENTA Y ' + unidad(u)
        elif d == '4':
            if u == '0' :
                text = 'CUARENTA'
            else :
                text = 'CUARENTA Y ' + unidad(u)
        elif d == '3':
            if u == '0' :
                text = 'TREINTA'
            else :
                text = 'TREINTA Y ' + unidad(u)
        elif d == '2':
            if u == '0' :
                text = 'VEINTE'
            else :
                text = 'VEINTI' + unidad(u)
        elif d == '1':
            if u == '0' :
                text = 'DIEZ'
            elif u == '1' :
                text = 'ONCE'
            elif u == '2' :
                text = 'DOCE'
            elif u == '3' :
                text = 'TRECE'
            elif u == '4' :
                text = 'CATORCE'
            elif u == '5' :
                text = 'QUINCE'
            else :
                text = 'DIECI' + unidad(u)
        else :
            text = unidad(u)
    return text

def centena(num):
    text = ''
    if len(num) < 3 :
        text = decena(num)
    else:
        c = num[-3]
        d = [num[-2], num[-1]]
        if c == '9' :
            text = 'NOVECIENTOS ' +decena(d)
        elif c == '8' :
            text = 'OCHOCIENTOS ' +decena(d)
        elif c == '7' :
            text = 'SETECIENTOS ' +decena(d)
        elif c == '6' :
            text = 'SEICIENTOS ' +decena(d)
        elif c == '5' :
            text = 'QUINIENTOS ' +decena(d)
        elif c == '4' :
            text = 'CUATROCIENTOS ' +decena(d)
        elif c == '3' :
            text = 'TRESCIENTOS ' +decena(d)
        elif c == '2' :
            text = 'DOSCIENTOS ' +decena(d)
        elif c == '1' :
            if d[0] == '0' and d[1] == '0':
                text = 'CIEN'
            else :
                text = 'CIENTO ' + decena(d)
        else:
           text = decena(d)
    return text
