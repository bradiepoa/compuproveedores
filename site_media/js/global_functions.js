function check_enter(e,fn){ 

	var characterCode; 

	if(e && e.which) {
		e = e; characterCode = e.which; 
	} else {
		e = e;characterCode = e.keyCode; 
	}

	if(characterCode == 13){
		fn();
	}
}



function validate_fecha_post(fecha){
    
    if(fecha){
        date = Date.parseExact(fecha,'dd/MM/yy');
        
        str_date = date.toString('yyyy-MM-dd');

        if(str_date > today){
            alert('No puede seleccionar una fecha mayor al día de hoy.');
            return false;
            
        } 
    }

    return true; 
}

