function cantidad_letra(num) {

	num = num.replace("$","").replace(/,/g,"");
    list = num.split('.');
    int_part = '00000'+list[0];
	len = int_part.length;
	miles_millones = int_part.substring(len-12,len-9);
	millones = int_part.substring(len-9,len-6);
    miles = int_part.substring(len-6,len-3);
    unidades = int_part.substring(len-3, len);
    de_pesos = false;
    text = '';
    
	if (miles_millones == '001') {
		text += ' UN MIL ';
	}

	else if (miles_millones > '001'){
		text += centena(miles_millones) + ' MIL ';
	} 
    
    if (millones == '001' ){
        text += ' UN MILLON '
    }
    else if (millones > '001' || miles_millones > '000'){
        text += centena(millones) + ' MILLONES ';
    }
    
	if (miles == '001') {
		text += ' UN MIL ';
	}
	
	
	else if (miles > '001'){
		text += centena(miles) + ' MIL ';
	} 
	

	if (miles_millones > '000' || millones >= '001'){
	    if (miles == '000' && unidades == '000'){ 
	        text += centena(unidades) + ' DE PESOS';
	        de_pesos = true;
        }
    }
    
    if(de_pesos==false){ 
            text += centena(unidades) + ' PESOS';
    }
    
    if (list.length > 1 )
        dec = list[1];
    else
        dec = '00';
        
    if (dec.length > 2 )
        dec = dec.substring(0,2);
    else if(dec.length == 1)
        dec = dec + '0';
    text += ' '+ dec + '/100 M.N.';
    return text;
}

function unidad(u){
	var text = '';
    if(u == '9')
        text = 'NUEVE';
    else if(u == '8')
        text = 'OCHO';
    else if(u == '7')
        text = 'SIETE';
    else if(u == '6')
        text = 'SEIS';
    else if(u == '5')
        text = 'CINCO';
    else if(u == '4')
        text = 'CUATRO';
    else if(u == '3')
        text = 'TRES';
    else if(u == '2')
        text = 'DOS';
    else if(u == '1')
        text = 'UN';
    return text
}

function decena(n){
    text = '';
    if(n.length < 2 ){
		text = unidad(n)
	} else {
        d = n[n.length-2]
        u = n[n.length-1]
		
        if(d == '9')
            if(u == '0')
                text = 'NOVENTA'; 
            else
                text = 'NOVENTA Y ' + unidad(u);
        else if(d == '8')
            if(u == '0')
                text = 'OCHENTA';
            else
                text = 'OCHENTA Y ' + unidad(u);
        else if(d == '7')
            if(u == '0')
                text = 'SETENTA'; 
            else
                text = 'SETENTA Y ' + unidad(u);
        else if(d == '6')
            if(u == '0')
                text = 'SESENTA'
            else
                text = 'SESENTA Y  ' + unidad(u)
        else if(d == '5')
            if(u == '0')
                text = 'CINCUENTA'
            else
                text = 'CINCUENTA Y ' + unidad(u)
        else if(d == '4')
            if(u == '0')
                text = 'CUARENTA'
            else
                text = 'CUARENTA Y ' + unidad(u)
        else if(d == '3')
            if(u == '0')
                text = 'TREINTA'
            else
                text = 'TREINTA Y ' + unidad(u)
        else if(d == '2')
            if(u == '0')
                text = 'VEINTE'
            else
                text = 'VEINTI' + unidad(u)
        else if(d == '1')
            if(u == '0')
                text = 'DIEZ'
            else if(u == '1')
                text = 'ONCE'
            else if(u == '2')
                text = 'DOCE'
            else if(u == '3')
                text = 'TRECE'
            else if(u == '4')
                text = 'CATORCE'
            else if(u == '5')
                text = 'QUINCE'
            else
                text = 'DIECI' + unidad(u)
        else
            text = unidad(u)
	}
    return text
}
function centena(num) {
    text = '';
	
    if(num.length < 3) 
        text = decena(num);
    else {
		l = num.length;
        c = num[l-3];
        d = num.substring(l-2, l);

        if(c == '9')
            text = 'NOVECIENTOS ' +decena(d)
        else if(c == '8')
            text = 'OCHOCIENTOS ' +decena(d)
        else if(c == '7')
            text = 'SETECIENTOS ' +decena(d)
        else if(c == '6')
            text = 'SEICIENTOS ' +decena(d)
        else if(c == '5')
            text = 'QUINIENTOS ' +decena(d)
        else if(c == '4')
            text = 'CUATROCIENTOS ' +decena(d)
        else if(c == '3')
            text = 'TRESCIENTOS ' +decena(d)
        else if(c == '2')
            text = 'DOSCIENTOS ' +decena(d)
        else if(c == '1')
            if((d[0] == 0) && (d[1] == 0))
                text = 'CIEN';
            else
                text = 'CIENTO ' +decena(d);
        else
           text = decena(d);
	}
    return text
}
