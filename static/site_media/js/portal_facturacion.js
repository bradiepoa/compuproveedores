function validate_rfc(rfc) { 
    rfc = rfc.toUpperCase();
    
    if (rfc.length == 12) {
        var day =  rfc.substring(7,9);
        var month =  rfc.substring(5,7);
        
    } else if(rfc.length == 13) {
        var day =  rfc.substring(8,10);
        var month =  rfc.substring(6,8);
        
        
    } else {
        return "La extensión del RFC debe de ser de 12 caracteres para personas morales y 13 caracteres para personas físicas.";
    }
     
    if("A1234567890".indexOf(rfc.slice(-1))  == -1 ){
        return "El RFC debe terminar siempre en número o letra A";
    } 
    
    
    d = Date.parse(month + "/" + day + "/2000");
    if (isNaN(d)) {
        return "El RFC proporcionado corresponde a una fecha inválida";
    }
}
