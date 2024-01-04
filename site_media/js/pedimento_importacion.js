function get_total_invoices_seleccionados(){
    var total = 0;
    $.each($("input[type=checkbox]"), function(i,e){
        
        if($(e).prop("checked")){
            total += to_decimal($(e).attr("importe")) ;
        }
    });
    return total;
}

function get_incrementales_invoices_seleccionados(){
    var incrementales = 0;
    $.each($("input[type=checkbox]"), function(i,e){
        
        if($(e).prop("checked")){
            incrementales += to_decimal($(e).attr("incrementales")) ;
        }
    });
    return incrementales;
}

function set_fletes_mxn(){
    var tc = to_decimal($("#tipo_cambio").html());
    var fletes_mxn = Math.round(get_incrementales_invoices_seleccionados() * tc);
    $("#fletes_importacion").val(fletes_mxn);
}

function set_total_invoice(invoice_id){
    
    var total = 0;
    var incrementales = 0;
    $.each($("#detalles_" + invoice_id + " input[type=checkbox]"), function(i,e){
        if($(e).attr("checked")){
            total += to_decimal($(e).attr("importe")) ;
            incrementales += to_decimal($(e).attr("incrementales")) ;
        }
    });
    
    $("#total_invoice_" + invoice_id).html(format_currency(total+incrementales));
    $("#incrementales_invoice_" + invoice_id).html(format_currency(incrementales));
    set_totales();
    
    set_fletes_mxn();
    
    
}

function set_totales(){

    var tc = to_decimal($("#tipo_cambio").html());
    var total_invoices = get_total_invoices_seleccionados();
    //var incrementales = to_decimal($("#id_incrementales").val());
    var incrementales = get_incrementales_invoices_seleccionados();
    var valor_comercial = total_invoices * tc;
    var valor_dolares = total_invoices + incrementales
    var valor_aduana = valor_dolares * tc;
    
    var dta = to_decimal($("#id_dta").val());
    var iva = to_decimal($("#id_iva").val());
    var igi = to_decimal($("#id_igi").val());
    var prv = to_decimal($("#id_prv").val());
    var cnt = to_decimal($("#id_cnt").val());    
    var otros = to_decimal($("#id_otros").val());    
    
    var efectivo = dta + iva + igi + prv + cnt;
    var total = efectivo + otros;
    var prorratear = total - iva + to_decimal($("#id_envios").val()) + to_decimal($("#id_inspeccion").val()) + to_decimal($("#importe_gasto").html()); 
    
    $("#total_invoices").html(format_currency(total_invoices));
    $("#valor_dolares").html(format_currency(valor_dolares));
    $("#valor_aduana").html(format_currency(valor_aduana));
    $("#valor_comercial").html(format_currency(valor_comercial));
    $("#id_valor_comercial").val(valor_comercial);
    $("#id_valor_dolares").val(valor_dolares);
    $("#efectivo").html(format_currency(efectivo));
    $("#total").html(format_currency(total));
    $("#monto_prorratear").html(format_currency(prorratear));
}

function add_form(){

    var ind = parseInt($("#id_detalles-TOTAL_FORMS").val()) - 1;
    set_ac_invoice(ind);
    set_deleted();
    $("#id_detalles-"+ind+"-invoice_id").prev().attr("onclick", "dialog_detalles("+ind+")");
    $(".delete-row").hide()
}

function set_ac_invoice(ind){

    $().ready(function(){
        $("#id_detalles-"+ind+"-invoice").autocomplete({
            source:"/ajax/contains/invoice/",
            minLength:minLength_ac,
            select:function(event, ui){
                index = $(this).attr("id").split("-")[1];
                get_detalles_invoice(ui.item.id, index);

            }

        });
        
    });

    $(".delete-row").click(function(){
        set_dialog_detalles();
    });
}

function set_deleted(){
    $(".deleted").click(function(){
        if($(this).parent().parent().next().attr("class") != "dynamic-form"){
            $(this).parent().parent().next().remove();
        }
        $(this).next().click();
    })
}

function get_detalles_invoice(id, ind){

    $.ajax({
        url:"/ajax/get_detalles_invoice/?id="+id,
        dataType:"json",
        success:function(data){
            $("#id_detalles-"+ind+"-invoice_id").val(id);
            $("#id_detalles-"+ind+"-invoice_id").next().next().attr("onclick", "show_dialog("+id+")");
            $("#id_detalles-"+ind+"-invoice_id").next().next().show();
            $("#id_detalles-"+ind+"-invoice_id").next().next().next().attr("id", "detalles_"+id);

            set_data(data.detalles, id);
            set_info_invoice(data, ind);
        }
    });

}

function set_data(data, id){
    out = "<table><tr><th></th><th>Producto</th><th>Desc</th><th>Cantidad</th><th>PU</th><th>Importe</th></tr>";
    $.each(data, function(i, d){
        out += '<tr><td><input type="checkbox" name="detalles" checked="checked" value="'+d.id+'" id="detalle_'+d.id+'" importe="' + d.importe + '" incrementales="'+d.fletes+'"  onclick="set_total_invoice(' + id + ');"></td>';
        out += '<td><label for="detalle_'+d.id+'">'+d.codigo+'</label></td>';
        out += '<td><label for="detalle_'+d.id+'">'+d.producto+'</label></td>';
        out += '<td class="righttext"><label for="detalle_'+d.id+'">'+d.cantidad+'</label></td>';
        out += '<td class="righttext"><label for="detalle_'+d.id+'">'+d.precio_unitario+'</label></td>';
        out += '<td class="righttext"><label for="detalle_'+d.id+'">'+d.importe+'</label></td></tr>';
        did =d.id;
    });
    out += '</table>';
    $("#detalles_"+id+" .contenido_cd").html(out);
    set_total_invoice(id);
    
}

function show_dialog(id){

    $("#detalles_"+id).show();
    $("#detalles_"+id).addClass("pedimento_importacion_detalles_dialog");
    $(".cerrar_dialog").click(function(){
        $("#detalles_"+id).hide();
    });
}


function set_tipo_cambio(){
  
    var url = "/ajax/tipo_cambio_fecha/" + $("#id_fecha").val() + "/";
    
    $.get(url, function(tc){
        if (tc){
            $("#tipo_cambio").html(tc);
            set_totales();
            set_fletes_mxn();
        } else {
            alert("No se pudo obtener el tipo de cambio");    
        }
    });
}

function set_info_invoice_edit(id, ind){
    var url = "/ajax/get_detalles_invoice/?id="+id;
    if (id && id != undefined){
        $.ajax({
            url:url,
            dataType:"json",
            success:function(data){
                set_info_invoice(data, ind);
            }
        });
    }
}

function set_info_invoice(data, i){

    out = '<tr class="datos_invoices_tr"><td colspan="10"><table border="0">';
    out += '    <tr>';
    out += '        <th class="datos_invoices"> Num. Factura</th>';
    out += '        <th class="datos_invoices"> Fecha Fact. </th>';    
    out += '        <th class="datos_invoices"> Moneda Fact.</th>';
    out += '        <th class="datos_invoices"> Val.Mon.Fact. </th>';
    out += '        <th class="datos_invoices"> Incrementables</th>';
    out += '        <th class="datos_invoices"> % Incre.</th>';
    out += '        <th class="datos_invoices"> Val.Dolares </th>';
    out += '    </tr>';
    out += '    <tr>';
    out += '        <td class="resultados_invoices">'+data.num_factura+'</td>';
    out += '        <td class="resultados_invoices">'+data.fecha+'</td>';
    out += '        <td class="resultados_invoices">'+data.moneda+'</td>';
    out += '        <td class="resultados_invoices">'+format_currency(data.val_moneda)+'</td>';
    out += '        <td class="resultados_invoices" id="incrementales_invoice_' + data.id + '">'+format_currency(data.incrementables)+'</td>';
    out += '        <td class="resultados_invoices">'+format_currency(data.incre_porciento) +'</td>';
    out += '        <td class="resultados_invoices" id="total_invoice_' + data.id + '">'+format_currency(data.val_dolares)+'</td>';
    out += '    </tr>';
    out += '</table>';
    out += '<div class="linea_separador"></div></td></tr>';
    if($("#id_detalles-"+i+"-invoice").parent().parent().next().attr("class") == "datos_invoices_tr"){
        $("#id_detalles-"+i+"-invoice").parent().parent().next().remove();
    }
    $("#id_detalles-"+i+"-invoice").parent().parent().after(out);

}


function add_form_fletes () {
    var ind = parseInt($("#id_fletes-TOTAL_FORMS").val()) - 1;
    set_ac_flete(ind);

}

function set_ac_flete (ind) {
    $("#id_fletes-"+ind+"-gasto").autocomplete({
        source:"/ajax/contains/gasto_servicio/?tipo=1",
        minLength:minLength_ac,
        select:function(e,u) {
            var index = $(this).attr("id").split("-")[1];
            $("#id_fletes-"+index+"-gasto_id").val(u.item.id);
            $("#id_fletes-"+index+"-gasto").parent().next().html("Total: " + format_currency(u.item.total))
            $("#id_fletes-"+index+"-total").val(u.item.total);
            set_total_fletes()
        }
    });
}

function set_total_fletes () {
    var fs = parseInt($("#id_fletes-TOTAL_FORMS").val());

    total_fletes = string_to_decimal($("#fletes_importacion").val());
    for(var i = 0;i<fs; i++){
        total_fletes += string_to_decimal($("#id_fletes-"+i+"-total").val());
    }

    $("#total_fletes").html("$" + format_currency(total_fletes));
}
