var price_digits = 2;
var default_iva = 0.16;
var id_prov=0;
var dbg = 0;
var porcentaje_ieps = 0;
function set_factor_costo(){
    costo = (string_to_decimal($("#id_costo_reposicion_span").html()) + string_to_decimal($("#id_fletes_pesos").val())) / string_to_decimal($("#id_importe").val())
    costo_100 = costo * 100
    fu = (1 - costo) * 100
    $("#id_factor_costo").html(costo_100.toFixed(price_digits));
    $("#id_factor_utilidad2").html((fu).toFixed(price_digits));
    
}

function set_fletes_porciento(){
    percent = string_to_decimal($("#id_fletes_pesos").val()) * 
              100 / string_to_decimal($("#id_costo_reposicion_span").html()) ;
    $("#id_fletes_porciento").val(string_to_decimal(percent).toFixed(4));
}

function set_fletes_pesos(){
    pesos = string_to_decimal($("#id_costo_reposicion_span").html()) * 
            string_to_decimal($("#id_fletes_porciento").val()) / 100 ;
    $("#id_fletes_pesos").val(string_to_decimal(pesos));
}

function set_mu_porciento(){
    pesos = string_to_decimal($("#id_mu_pesos").val());

    costo_con_flete = string_to_decimal($("#id_costo_con_flete").html());

    if(costo_con_flete){
        value = pesos * 100 / costo_con_flete;  
    }else{
        value = 0;
    }
    $("#id_mu_porciento").val(value.toFixed(4));
 
    
}

function set_mu_pesos(){
    ct = string_to_decimal($("#id_costo_con_flete").html());
    mu_porciento = string_to_decimal($("#id_mu_porciento").val())
    value = (ct * mu_porciento) / 100 ;
    v = string_to_decimal(value);
    $("#id_mu_pesos").val(v);
}

function set_iva_f_importe(){
    $("#id_iva").html(format_currency((string_to_decimal($("#id_importe").val()) * default_iva).toFixed(price_digits)));
    
    var ieps = ((string_to_decimal($("#id_importe").val()) * porcentaje_ieps / 100).toFixed(price_digits));
    $("#id_ieps").html(ieps);
}

function set_mu_f_importe(){
    value = string_to_decimal($("#id_importe").val()) -
            string_to_decimal($("#id_costo_con_flete").html());
    
    $("#id_mu_pesos").val(value.toFixed(price_digits));

    set_mu_porciento();
}

function importe_change(){
    value = string_to_decimal($("#id_importe").val());
    set_iva_f_importe();
    precio = value + string_to_decimal($("#id_iva").html()) + string_to_decimal($("#id_ieps").html());
    $("#id_precio").val(precio.toFixed(price_digits));
    set_mu_f_importe();
    set_factor_costo();
    
}

function precio_change(){
    var precio_neto = string_to_decimal($("#id_precio").val());
    var porciento_impuesto = (default_iva * 100) + porcentaje_ieps;
    var importe_antes_iva = (precio_neto / (1 + (porciento_impuesto / 100)));
    $("#id_importe").val(importe_antes_iva.toFixed(price_digits));
    set_mu_f_importe();
    set_iva_f_importe();
}

function mu_pesos_change() {

    costo_con_flete = string_to_decimal($("#id_costo_con_flete").html())
    
    value = string_to_decimal($("#id_mu_pesos").val());
    v = value + costo_con_flete
    if(costo_con_flete > 0){
        $("#id_importe").val(v.toFixed(price_digits));
    }
    
    importe_change();
    set_mu_porciento();
    set_factor_costo();
}

function fletes_pesos_change() {
    value = string_to_decimal($("#id_fletes_pesos").val());
    valor = value + string_to_decimal($("#id_costo_reposicion_span").html())
    
    $("#id_costo_con_flete").html(format_currency(valor));
    set_fletes_porciento();
    set_factor_costo();
    importe_change();
}

function mu_porciento_change(){
    set_mu_pesos();
    mu_pesos_change();
}

function costo_change(){
    
    if(string_to_decimal($("#id_costo_reposicion_span").html()) == 0){    
        $("#id_fletes_pesos").val(0);
    }
    fletes_pesos_change();
}

function fletes_porciento_change(){
    set_fletes_pesos();
    fletes_pesos_change();
}
function show_backorder(pa_id){
    $.ajax({
        url:'/ajax/backorder_info/' + pa_id + '/',
        dataType:'json',
        success:function(data){
            
            var out = '<table><tr><th>Cant.</th><th>Fecha</th><th>Días</th></th></tr>'
            $.each(data, function(i, oc){
                out += '<tr>';
                out += '<td class="righttext"><a href="' + oc.url + '">' + oc.cantidad + '</a></td>';
                out += '<td><a href="' + oc.url + '">' + oc.fecha + '</a></td>';
                out += '<td class="righttext"><a href="' + oc.url + '">' + oc.dias + '</a></td>';
                out += '</tr>';
            })
            out += '</table>'
            $("#backorder_info").html(out);
        },
        error:function(){
            alert('Ocurrió un error al obtener el backorder');
        }
    });
}
