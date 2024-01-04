function set_existencias_almacenes(codigo, existencias_almacenes, extra, extra2){
    html_text = ""
    if(existencias_almacenes){
        for (var almacen_id in existencias_almacenes) {
            html_text += "<tr><td>" + nombre_almacen[almacen_id] + 
                '</td><td class="righttext">' + 
                    format_currency(existencias_almacenes[almacen_id]) + 
                '</td></tr>'
        } 
    } else {
        html_text = "Sin existencias"
    }
    if(extra){
        html_text += "<tr><td>" + extra.nombre +
                '</td><td class="righttext">' + 
                    format_currency(extra.existencia) + 
                '</td></tr>'
    }
    if(extra2){
        html_text += "<tr><td>" + extra2.nombre +
                '</td><td class="righttext">' + 
                    format_currency(extra2.existencia) + 
                '</td></tr>'
    }
    $("#tabla_existencias").html(html_text);
    $("#titulo_existencias").html('<th style="color:red; font-weight:900;">'+codigo+"</th>"+"<th>Cant</th>");

}
