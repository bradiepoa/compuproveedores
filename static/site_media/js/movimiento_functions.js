var max_descuento = 0.0;
var emails = [];
var fields = ['#id_direccion',
              '#id_colonia',
              '#id_ciudad', 
              '#id_estado', 
              '#id_rfc'];

var show_dialog = false;
var motivo_suspendido = "";
var tipo_del_movimiento = "entrada";


function set_emails(emails, tipo_mov){
    var out = '';
    
    if(tipo_mov == "pedido" || tipo_mov == "entrada"){
    	return ""
    }
    if(emails){
        $.each(emails, function(i,contacto){
            checked = '';
            if(tipo_mov == 'salida' || tipo_mov == 'nota_venta'){
                if(contacto.factura){
                    checked = 'checked="checked"'
                }
            
            }
            
            if(tipo_mov == 'cotizacion'){
                if(contacto.cotizacion_c){
                    checked = 'checked="checked"'
                }
            
            }
            
            if(tipo_mov == 'orden'){
                if(contacto.orden_compra){
                    checked = 'checked="checked"';
                }
            
            }
            out += '<div><input type="checkbox"' + checked  + 'name="emails" value="'+contacto.email+'" id="email_'+i+'" class="emails_enviar">'
            out += '<label for="email_'+i+'">'+contacto.nombre +' - '+ contacto.email +'</label></div>';
        });
    }

    $("#emails").html(out);
    if(tipo_mov == "cotizacion" || tipo_mov == "orden"){
    	set_enviar_button();
    	$(".emails_enviar").change(set_enviar_button);
    }
    
}

function set_enviar_button(){

    var selec = false;
    $.each(emails, function(i,contacto){
        if($(" #email_"+i).attr("checked")){
            selec = true;
        }
    });
    
    if( $("#id_email_cotizacion").val() ){
        selec = true;
    };
    
    if(selec){
        $(" .enviar_orden_cotizacion ").val("Guardar y Enviar");
        
    } else {
        $(" .enviar_orden_cotizacion ").val("Guardar")
    }
    


}

function set_vencimiento(es_venta){
    var dias = parseInt($('#id_condicion').val(), 10);
    
    if(es_venta) {
		_fecha_base = $('#id_fecha_factura').val();
    } else {
	    _fecha_base = $('#id_fecha').val(); 
	}
    if (!_fecha_base){
        _fecha_base = $('#id_fecha_factura').val();
    }

    fecha = Date.parseExact(_fecha_base,'dd/MM/yy')
    if(fecha){
        fecha.addDays(dias);
        $('#fecha_vencimiento_div').html(fecha.toString('dd/MM/yy'));
        $('#id_fecha_vencimiento').val(fecha.toString('dd/MM/yy'));
    }
 
}

function proveedor_change(avoid_dialog, es_venta, rs){
    
    
    if (rs != ''){
        
        a_url = "/ajax/existe_cliente/?rs=" + encodeURIComponent(rs);
        $.ajax({
            url:a_url,  
            dataType:'json',
            success: function(cliente) {
                $("#span_rs").html(cliente.razon_social);
			    emails = cliente.emails;
			    set_emails(emails, tipo_del_movimiento);
			    
			    html_sucursales = '<option value selected="selected">Mismo lugar</option>';
                if(cliente.direcciones){
                    for(i=0; i < cliente.direcciones.length; i++) {
                        html_sucursales += '<option value="' + cliente.direcciones[i].id + '">'+cliente.direcciones[i].nombre+'</option>';
                    }   
                }
                $('#id_sucursal').html(html_sucursales);
                var suc = $('#id_hidden_sucursal').val();
                if (suc){
                    $('#id_sucursal').val(suc);
                }
			    
			    if (!avoid_dialog){
			        $.ajax({
			            url:"/ajax/get_ordenes_cliente/" + encodeURIComponent(cliente.razon_social) + '/', 
			            dataType:'json',
			            success: function(ordenes) {
                            if(ordenes[0]){
                                html = '<div>Desea dar entrada a alguna de las &oacute;rdenes de compra?</div>';
                                html += '<div class="bold">'+ cliente.razon_social +'</div>';
                                html += '<table class="list-table"><tr><th>O.C.</th><th>Fecha</th><th>Total</th></tr>';
                                $.each(ordenes, function(i,item){
                                    klass = i%2 ? 'odd' : 'even';
                                    ahref = '<a href="javascript:window.location=\'/admin/orden_liquidar/'+item.id+'/\';">';
                                    html += '<tr class='+ klass +'><td class="righttext">' + ahref + item.folio + '</a></td><td class="righttext">' +
                                            ahref + item.fecha + '</a></td><td class="righttext">' + ahref +
                                            formatCurrency(item.total)+'</a></td></tr>';
                                });
                                html += "</table>";
                                $("#ordenes_dialog").html(html).dialog({
                                    bgiframe: true,
                                    height: 400,
                                    width: 600,
                                    buttons: {
                                        'Cancelar': function() {
                                            $("#ordenes_dialog").dialog('close');
                                        }
                                    }
                                });
                                $("#edit_dialog").dialog('open');
                            }
                        },
                        error:function(){
                            alert('Hubo un error al intentar obtener las órdenes de \
                                   compra de este proveedor');
                        }
                    }); 
                

                    
                    $("#id_tipo_pago").val(cliente.tipo_pago);

                    if(cliente.condicion)
                    {    
                        $("#id_condicion").val(cliente.condicion);

                    } else {
                        $("#id_condicion").val(0);
                    }

                    set_vencimiento();
                    
                    if(cliente.fecha_pago){
                        _fecha_base = $('#id_fecha_factura').val();
                    } else {
                        _fecha_base = $('#id_fecha_entrada').val();
                }

            }

                if(cliente.fecha_pago){
                    _fecha_base = $('#id_fecha_factura').val();
                } else {
                    _fecha_base = $('#id_fecha_entrada').val();
                }
			    try {
				    set_vencimiento(es_venta);
			    } catch(err) { }
			       

			
			    var out = '<option value="0">---</option>';
			    $.each(cliente.direcciones, function(i, d){
				    out += '<option value="'+ d.id +'">'+ d.nombre +'</option>';
			    });
			    $('#id_lugar').html(out).val("0");

		    }, error: function(err){
		        alert('El proveedor no es válido.');
		        $('#id_proveedor').val('');
		
		    }
		});
    }
    set_producto_autocomplete(es_venta);
}
function set_producto_autocomplete_venta(){
	return set_producto_autocomplete(true);
}
function set_producto_autocomplete_compra(){
	return set_producto_autocomplete(false);
}
function set_producto_autocomplete(tipo){
 
//    if(tipo == 'salida'){
//		url = '/ajax/contains/producto_almacen/'+$('#id_almacen').val();
//    } else {    
//        url = '/ajax/contains/producto/';
//    }

    $("#id_producto").autocomplete({
        source:'/ajax/contains/producto/', 
        minLength:minLength_ac,
        select: function(event, ui){
            set_producto(tipo_movimiento, ui.item.value)
            set_um_autocomplete(null, ui.item.value); 
            
        }    
    });
    
}
function set_um_autocomplete(i,producto){
    if (i){
        var field = "#id_form-" + i + "-um"
        var producto_field = "#id_form-" + i + "-producto"
    }
    else {
        var um_field = "#id_um"
        var producto_field = "#id_producto"
    }

    $(um_field).autocomplete({
        source:'/ajax/contains/um/'+producto+'/', 
        minLength:0,
        select: function(event, ui){
            $('#id_factor_um').html(ui.item.factor);
            calcular_importe();
        }
    }).click(function(){ $(this).autocomplete( "search", this.value ); });
}

function um_change(){

}

function set_producto_venta(){
	return set_producto(true);
}

function set_producto_compra(){
	return set_producto(false);
}

function set_producto(tipo_movimiento, producto_) {
    /* Obtiene los productos por codigo o descripcion */
    p = '';
    almacen_id = $('#id_almacen').val();
    p = producto_;
    if(p) {
        var url = '/ajax/producto/'+ tipo_movimiento + '/?p=' + encodeURIComponent(p)
		      + '&a=' + almacen_id + '&c=' 
		      + encodeURIComponent($("#id_proveedor").val());
        $.ajax({
            url:url,
		    dataType:'json',
		    success:function(data){
                if(data) {
                    $("#id_producto").val(data.codigo);
                    $("#id_div_descripcion").html(data.descripcion);
                    $("#id_descripcion").val(data.descripcion);
                    $("#id_um").val(data.um);
                    $("#id_factor_um").html(data.factor);
                    $("#id_precio_unitario").val(data.precio_unitario);
                    
                    var alt_text = 'Este producto cuenta con ' + data.existencia + ' de existencia';
                    var img = ""
                    if(!string_to_decimal(data.existencia)){
                        img = "warning_16.png";
                    } else {
                        img = "tick_16.png";
                    }
                    $("#producto_info").html('<img src="/site_media/img/icons/'+ img +'" alt="'+alt_text+'" title="'+alt_text+'"/>');
                    
                    if(es_venta){
                        if(data.descuento > 0){
                            descuento_aplicado();
                        } else {
                            descuento_no_aplicado();
                        }
                    }
                    $("#id_div_descripcion").show();
                    $("#id_descripcion").hide();
                    $("#id_um").focus();

                    calcular_importe();
                } else {
                    $("#id_div_descripcion").html('');
                    $("#id_descripcion").show();
                    $("#id_div_descripcion").hide();
                    if(es_venta){ 
                        descuento_no_aplicado();
                    }
                }
            }, 
            error:function(){ alert('Hubo un error al intentar obtener la información del producto'); }
        });
    } else {
        $("#id_producto").val('');
        $("#id_producto").show();
        $("#id_div_descripcion").html('');
        $("#id_div_descripcion").hide();
        $("#id_descripcion").val('');
        $("#id_descripcion").show();
    }
}

//function set_producto_descripcion(i) {
//    /* Obtiene los productos por codigo o descripcion */
//    p = '';
//    almacen_id = $('#id_almacen').val();
//    p = $('#id_producto').val();
//    if(p) {
//        var url = '/ajax/producto/'+ es_venta + '/?p=' + encodeURIComponent(p)
//		      + '&a=' + almacen_id + '&c=' 
//		      + encodeURIComponent($("#id_proveedor").val());
//        $.ajax({
//            url:url,
//		    dataType:'json',
//		    success:function(data){
//                if(data) {
//                    //$("#id_producto").val(data.codigo);
//                    $("#id_form-0-producto").val(data.codigo);
//                    $("#id_div-" + i + "-descripcion").html(data.descripcion);
//                    $("#id_form-0-producto").val(data.um);
//                    $("#id_form-0-precio_unitario").val(data.precio_unitario);
//                    if(es_venta){
//                        if(data.descuento > 0){
//                            descuento_aplicado();
//                        } else {
//                            descuento_no_aplicado();
//                        }
//                    }
//                    $("#id_div_descripcion").show();
//                    $("#id_descripcion").hide();
//                    $("#id_um").focus();
//				    set_um_autocomplete();
//                    calcular_importe();
//                } else {
//                    $("#id_div_descripcion").html('');
//                    $("#id_descripcion").show();
//                    $("#id_div_descripcion").hide();
//                    if(es_venta){ 
//                        descuento_no_aplicado();
//                    }
//                }
//            }, 
//            error:function(){ alert('Hubo un error al intentar obtener la información del producto'); }
//        });
//    } else {
//        $("#id_producto").val('');
//        $("#id_producto").show();
//        $("#id_div_descripcion").html('');
//        $("#id_div_descripcion").hide();
//        $("#id_descripcion").val('');
//        $("#id_descripcion").show();
//    }
//}


function calcular_importe_venta(){
	return calcular_importe(true);
}

function calcular_importe_compra(){
	return calcular_importe(false);
}

function calcular_importe(es_venta){
    descuento = $("#id_descuento").val() / 100;
    precio_unitario = string_to_decimal($("#id_precio_unitario").val());
    factor_um = string_to_decimal($("#id_factor_um").html()); 
    if(factor_um <= 0){
        factor_um = 1;
    }
    importe = $("#id_cantidad").val() * factor_um * precio_unitario;
    if(es_venta){
        importe = importe * (1 - descuento)
    }
    $("#id_importe").val(formatCurrency(importe));
    check_precio_unitario()
    calcular_con_iva();
}

function calcular_precio_unitario_venta(){
	return calcular_precio_unitario(true);
}
function calcular_precio_unitario_compra(){
	return calcular_precio_unitario(false);
}

function calcular_precio_unitario(es_venta){
    /* 
     * una funcion muy similar a calcular_importe pero esta 
     * calcula el precio unitario
     */
    descuento = string_to_decimal($("#id_descuento").val() / 100);
    importe = string_to_decimal($("#id_importe").val());
    factor_um = string_to_decimal($("#id_factor_um").html()); 
    if (!string_to_decimal(factor_um)){
        factor_um = 1;
    }
    pu = importe / ($("#id_cantidad").val() * factor_um);
    if(es_venta){
        pu  = pu / (1 - descuento);
    }
    $("#id_precio_unitario").val(pu);
    check_precio_unitario()
    calcular_con_iva();
}

function calcular_con_iva(){
    var importe = string_to_decimal($("#id_importe").val());
    var di = string_to_decimal(default_iva);
    var tot = importe + (importe * di / 100);
    $("#id_total").val(formatCurrency(tot));
}

function calcular_sin_iva(){
    var total = string_to_decimal($("#id_total").val());
    var di = string_to_decimal(default_iva);
    var importe = string_to_decimal(total / (1 + di / 100));
    $("#id_importe").val(formatCurrency(importe));
    calcular_precio_unitario_venta();
}


function check_precio_unitario(margen_minimo){
    cr = $("#id_costo_reposicion").val();
    precio = $("#id_precio_unitario").val();
    
    margen_minimo = 0;
    costo_minimo = (cr * (1 + margen_minimo / 100) );
    
    if(precio < costo_minimo) {
        alert('Cuidado el margen de utilidad, está por debajo del mínimo aceptado por la empresa.');
    }
}

function calcular_dialog_importe(){
    /** 
    * Calcula importe para el dialog_box
    */
    
    precio_unitario = parseFloat($("#id_dialog_precio_unitario").val().replace('$','').replace(',',''));
    importe = $("#id_dialog_cantidad").val() * $("#id_dialog_factor_um").val() * precio_unitario;
    $("#id_dialog_importe").val(formatCurrency(importe));
    
}

function calcular_dialog_precio_unitario(){
    /* 
    * calcula precio unitario para dialog_box
    */
    
    importe = parseFloat($("#id_dialog_importe").val().replace('$','').replace(',',''));
    pu = importe / ($("#id_dialog_cantidad").val() * $("#id_dialog_factor_um").val());
    $("#id_dialog_precio_unitario").val(pu);
}

function edit(id, tipo){    
    /***
    * Abre el PopUp para editar una partida de algún producto, es utilizado
    * en las pantallas de Agregar/Editar: Compras, Facturas.
    */

    $("#id_dialog_cantidad").val($('#id_cantidad-'+id).html());
    $("#id_dialog_producto").val($('#id_codigo-'+id).html());
    $("#id_dialog_descripcion").val($('#id_descripcion-'+id).html());
    $("#id_dialog_um").val($('#id_um-'+id).html());
    
    var f = parseInt($('#id_factor_um-'+id).html())
    if(!f){
        f = 1;
    }
    $("#id_dialog_factor_um").val(f);
    $("#id_dialog_precio_unitario").val($('#id_precio_unitario-'+id).html());
    $("#id_dialog_importe").val($('#id_importe-'+id).html());
    $("#id_dialog_descripcion_adicional").html($('#id_descripcion_adicional-'+id).val());
    
    
    $("#id_dialog_iva").val(format_currency( string_to_decimal( $('#id_iva-'+id).html() ) * 100.00 / string_to_decimal( $('#id_importe-'+id).html() ) ));
    
    $("#edit_dialog").dialog({
        bgiframe: true,
        height: 280,
        width: 900,
        buttons: {
            'Editar': function() {
                var url = '/ajax/edit/detalle/'+id+'/'
                +"?cantidad="+encodeURIComponent($('#id_dialog_cantidad').val())
                +"&producto="+encodeURIComponent($('#id_dialog_producto').val())
                +"&descripcion="+encodeURIComponent($('#id_dialog_descripcion').val())
                +"&um="+encodeURIComponent($('#id_dialog_um').val())
                +"&factor_um="+encodeURIComponent($('#id_dialog_factor_um').val())
                +"&iva="+encodeURIComponent($('#id_dialog_iva').val())
                +"&importe="+encodeURIComponent($('#id_dialog_importe').val())
                +"&precio_unitario="+encodeURIComponent($('#id_dialog_precio_unitario').val())
                +"&descripcion_adicional="+encodeURIComponent($('#id_dialog_descripcion_adicional').val())
                +"&tipo="+tipo;
                $.get(url, {}, function(error){
                    if(error){
                        alert(error);
                    }else{
                        window.location.reload();
                    }
                });
                $(this).dialog('close');
            },
            Cancel: function() {
                $(this).dialog('close');
            }
        }
    });
    $("#edit_dialog").dialog('open');
}

function set_direccion_entrega_from_sucursal() {

    
    lugar = $('#id_sucursal').val();
    var show = false;
    if(!lugar) {
        $("#id_direccion_facturacion").val('');
    } else {
        var url = '/ajax/direccion_entrega/' + lugar + '/';
        $.ajax({
            url:url, 
            dataType:'json',
            success:function(direccion){
		        if(direccion.es_sucursal){
			        $("#id_direccion_facturacion").val(direccion.id);
		        }
            },
            error:function(){ alert('Hubo un error al obtener las direcciones de entrega'); }
        });
    }
}


function set_direccion_entrega() {

	var entrega_fields = ['direccion',
			              'colonia',
			              'ciudad', 
			              'estado', 
			              'nombre'];
			  
			  
    lugar = $('#id_lugar').val();
    
    if (!lugar){  
        sucursal = $('#id_sucursal').val();
    }
    
    var show = false;
    if(!lugar) { 
        $("#id_direccion_facturacion").val('');
        set_direccion_cliente(true);
    } else {

        var url = '/ajax/direccion_entrega/' + lugar + '/';
        $.ajax({
            url:url, 
            dataType:'json',
            success:function(direccion){
		        l = entrega_fields.length;
		        
		        if(direccion.es_sucursal){
			        $("#id_direccion_facturacion").val(direccion.id);
			        set_direcciones(direccion,direccion);
		        } else {
		            $("#id_direccion_facturacion").val("");
		            set_direccion_cliente();
	                set_direcciones(false, direccion);
		        }
            },
            error:function(){ alert('Hubo un error al obtener las direcciones de entrega'); }
        });
    }

}
    
function estado_change(){
    $("#id_ciudad").autocomplete('/ajax/contains/ciudad/?edo='+$("#id_estado").val());   
}

function show_motivo_suspendido(){
    alert(motivo_suspendido);
}

function autorizar_credito(autorizar_credito_disponible, ident){
/***
    clave = prompt("Introduzca la clave de autorización:");
    $.ajax({
        url:"/ajax/validar_autorizacion/" + clave + "/" + encodeURIComponent($("#id_proveedor").val()) + "/",
        dataType:'json',
        success:function(aut){ 
            if(aut.valido == true){
                condicion_txt = '<option value="'+ aut.dias +'">'+ aut.condicion_nombre + '</option>';
                $("#id_condicion").append(condicion_txt);
                $("#id_condicion").val(aut.dias);
                $("#id_credito_suspendido").hide();
            } else {
                alert('La clave es errónea.');

***/
    $("#dialog_autorizacion").dialog({
        bgiframe: true,
        height: 150,
        width: 300,
        buttons: {
            'Aceptar': function(){
                clave = $("#id_clave_autorizacion").val();
                $.ajax({
                    url:"/ajax/validar_autorizacion/" + clave + "/?rs=" + encodeURIComponent($("#id_proveedor").val()),
                    dataType:'json',
                    success:function(aut){ 
                        if(aut.valido == true){
                            if(!autorizar_credito_disponible){
                                condicion_txt = '<option value="'+ aut.dias +'">'+ aut.condicion_nombre + '</option>';
                                $("#id_condicion").append(condicion_txt);
                                $("#id_condicion").val(aut.dias);
                                
                            }else{
                                credito_autorizado = true
                                $("#id_usuario_id_aut_cred").val(aut.usuario_id);
                                emitir_factura(ident);
                            }
                            
                            
                            $("#dialog_autorizacion").dialog('close');
                            $("#id_credito_suspendido").hide(); 
                            
                        } else {
                            alert('La clave es errónea.');
                        }


                    },
                    error:function(){ alert('Hubo un error al intentar autorizar'); }
                });
            },
            'Cancelar': function() {
                $("#dialog_autorizacion").dialog('close');
            }
        }
    });

    
}

function cliente_change(avoid_dialog, tipo, _proveedor, condicion) {
    
    var rs = _proveedor;
    var url = "/ajax/cliente/" + encodeURIComponent(rs) + "/";
    var fu = false;
    $("#id_credito_suspendido").hide();
    if(!rs){
        return false;
    }
    
    $.ajax({
        url:url,
        dataType:'json',
        success:function(cliente){ 
            if(cliente) {
                $("#cliente_entrega_").show();

                if(!avoid_dialog){
                    if(cliente.tipo_pago){
                        $("#id_tipo_pago").val(cliente.tipo_pago);
                        if(tipo=="salida" || tipo=="nota_venta"){
                           change_tipo_pago(); 
                        }
                        
                    }
                    if(tipo == "nota_venta"){
                        condicion_html = '<option value="0">Contado</option>'
                        $("#id_condicion").html(condicion_html);
                    }
                }
                if(tipo == "nota_venta"){
                    condicion_html = '<option value="0">Contado</option>'
                    $("#id_condicion").html(condicion_html);
                }

                if(cliente.credito_suspendido) {
                    $("#id_credito_suspendido").show();
                    motivo_suspendido = cliente.motivo_suspendido;
                    if(!avoid_dialog){ 
                        alert("Este cliente tiene el crédito suspendido.");
                    }
                    
                    
                } else if(cliente.condicion) {
                    
                    if(tipo == "nota_venta"){
                        condicion_html += '<option value="'+cliente.condicion+'">'+cliente.condicion_nombre+'</option>';
                        $("#id_condicion").html(condicion_html);
                    }
                    if(string_to_decimal(condicion) || !avoid_dialog) {
                        $("#id_condicion").val(cliente.condicion);
                    }
                } else {
                    $("#id_condicion").val(0);
                }
                condicion_change();
                set_vencimiento();
                if(!avoid_dialog){
                    $('#span_rs').html(cliente.razon_social);
                    set_direcciones(cliente, cliente);
                    $("#rfc").html(cliente.rfc);
                    html_entregas = '<option value selected="selected">Mismo lugar</option>';
                    if(cliente.entregas){
                        for(i=0; i < cliente.entregas.length; i++) {
                            html_entregas += '<option value="'+cliente.entregas[i].id+'">'+cliente.entregas[i].nombre+'</option>';
                        }   
                    }
                    $('#id_lugar').html(html_entregas);
                    var de = $('#id_direccion_entrega').val();
                    if(de){
                        $('#id_lugar').val(de);
                    }
                }

                if(tipo == "nota_venta" || tipo == "salida"){
                    $("#credito_disponible").html("Crédito disponible: $" + format_currency(string_to_decimal(cliente.credito_disponible)));
                    credito_disponible = string_to_decimal(cliente.credito_disponible);
                }
                    
		        if(cliente.emails){
		            emails = cliente.emails;
			        set_emails(emails, tipo_del_movimiento);
		        }


                if(!avoid_dialog){
                    if(cliente.cuenta){
                        $("#id_cuenta_origen_fondos").val(cliente.cuenta.numero_cuenta)
                    }
                    /*if(cliente.cuentas){
                    	var html_cuentas = '<option value="" selected=selected>-------</option>';

                	    $.each(cliente.cuentas, function(i, cuenta){
                    	    html_cuentas += '<option value="'+cuenta.value+'">'+cuenta.text+'</option>';                                
                    
                        });
                        $("#id_cuenta_cliente").html(html_cuentas);
                    
                    }*/
                }
		        
		        if(!avoid_dialog){
		         
		            if(tipo == "pedido") {
		                fu = "/ajax/get_pedidos_cotizaciones_cliente/"
		                question = "¿Desea revisar a alguna de las cotizaciones de este cliente?"
		                prev = "cotizacion"
		                
		                
		            } else if(tipo == "salida") { 
		                fu ="/ajax/get_pedidos_cotizaciones_cliente/"
		                question = "¿Desea facturar alguno de los pedidos de este cliente?" 
		                prev = "pedido"
		            }
		            
		            if(fu){
		               
			            $.ajax({
			                url: fu + cliente.razon_social + '/', 
			                dataType:'json',
			                success:function(ordenes) {
                                if(ordenes[1].length){
                                    html = '<div class="bold">'+ cliente.razon_social +'</div>';    
                                    html += '¿Desea revisar a alguna de las cotizaciones de este cliente?'; 
                                    html += '<table class="list-table"><tr><th>Cotización</th><th>Fecha</th><th>Total</th></tr>';
                                    
                                    $.each(ordenes[1], function(i,item){
                                        ahref = '<a href="/admin/generar_pedido/'+item.id+'/">';
                                        klass = i%2 ? 'odd' : 'even';
                                        html += '<tr class='+ klass +'><td class="righttext">' + 
                                        ahref + item.folio + '</a></td><td class="righttext">' + 
                                        ahref + item.fecha + '</a></td><td class="righttext">' + 
                                        ahref + '$'+item.total +'</a></td></tr>';
                                    });
                                    html += "</table>";   
                                    
                                    $("#ordenes_dialog").html(html).dialog({
                                        bgiframe: true,
                                        height: 500,
                                        width: 800,
                                        buttons: {
                                            'Cancelar': function() {
                                                $("#ordenes_dialog").dialog('close');
                                            }
                                        }
                                    });
                                    $("#edit_dialog").dialog('open');
                                }
                            } 
                        });
                        
                    } 
		        }
		       
            } else {
                $("#direccion_extra_fields").hide();
                $("#id_contacto").html('');
            } 
		},
		error:function(){ alert('Hubo un error al intentar obtener el cliente'); }
    });
}
function get_direccion_string(direccion){
    domicilio = ""
    ciudad = ""
    if(direccion.calle){ domicilio += direccion.calle + ", "; }
    if(direccion.numero_e){ domicilio += "N° " + direccion.numero_e + ", "; }
    if(direccion.colonia){ domicilio += "Col: " + direccion.colonia + ", "; }
    if(direccion.cp){ domicilio += "CP: " + direccion.cp + ", "; }
    
    if(direccion.municipio){ ciudad += direccion.municipio + ", "; }
    if(direccion.estado){ ciudad += direccion.estado; }
    if(direccion.telefono){ ciudad += ' Tel.' + direccion.telefono; }
    return [domicilio,ciudad]
}

function set_direcciones(direccion_cliente, direccion_ent){

    //if(!rfc){
    //    rfc = ""
    //}
    
    if(direccion_cliente){
        $('#direccion').html(get_direccion_string(direccion_cliente)[0]);
        $('#ciudad').html(get_direccion_string(direccion_cliente)[1]);
    }
    
    if(direccion_ent){
        $('#direccion_entrega').html(get_direccion_string(direccion_ent)[0]);
        $('#ciudad_entrega').html(get_direccion_string(direccion_ent)[1]);
    }
    
}

function set_direccion_cliente(mismo_lugar){
    var rs = $("#id_proveedor").val();
    if(rs){
        $.ajax({
            url:"/ajax/cliente/" + encodeURIComponent(rs) + "/",
            dataType:'json',
            success:function(direccion) { 
                if(mismo_lugar){
                    set_direcciones(direccion,direccion);
                }else{
                    set_direcciones(direccion, false);
                }
            }
        });
    }
}

function validate_vencimiento(){
    vencimiento = $('#id_fecha_vencimiento').val();
    factura = $('#id_fecha_factura').val();
    
    if (!vencimiento){ return false; }
    
    if(vencimiento < factura){
        alert('La fecha de vencimiento no puede ser anterior a la fecha de la factura.');
        $('#id_fecha_vencimiento').val(factura);
        set_date_fom_cal();
        return false;
    }
    return true;

}

function mostrador_change() {

    if($("#id_es_mostrador").attr('checked')){
        $("#mostrador_div").show();
        $("#div_proveedor").hide();
        $("#id_proveedor").removeClass('required');
        cliente_change();
        
    } else {
        $("#id_proveedor").addClass('required');
        $("#mostrador_div").hide();
        $("#div_proveedor").show();
    
    }
    
}

// Funcion que valida el que el campo del archivo contenga informacion
function xml_change(){
    
    valor = document.getElementsByName('xml_compra')[0].value
    
    if (valor == null || valor.lenght == 0 || valor == "")
    {
    
        $("#id_proveedor").addClass('required');
        $("#id_folio_factura").addClass('required');
    }
    else
    {
    
        $("#id_proveedor").removeClass('required');
        $("#id_folio_factura").removeClass('required');   
        
    }
}        
    
function quitar_mensaje_des(){
    setTimeout(function(){ $("#mensaje_descuento").hide() }, 5000 )      
}
function mensaje_descuento(){
    $("#mensaje_descuento").show()    
    quitar_mensaje_des()
}

function set_descuento_vendedor(){
    vendedor = $('#id_vendedor').val();
    if(!vendedor){
        return false;
    }
    $.get('/ajax/descuento_empleado/'+ vendedor + '/', function(descuento){
        max_descuento = parseFloat(descuento);  
    });
}
function descuento_aplicado(){
    $("#id_descuento").hide();
    $("#img_descuento").show();
    $("#id_precio_unitario").attr('readonly', 'readonly');
    $("#id_total").attr('readonly', 'readonly');
    $("#id_importe").attr('readonly', 'readonly');
    
    $("#id_importe").attr('onclick', 'mensaje_descuento()');
    $("#id_total").attr('onclick', 'mensaje_descuento()');
    $("#id_precio_unitario").attr('onclick', 'mensaje_descuento()');
    
}

function descuento_no_aplicado(){
    $("#id_descuento").val();
    $("#id_descuento").show();
    $("#img_descuento").hide();
}

function set_folio(){
    url = "/ajax/facturacion/get_folio/" + $("#id_almacen").val() + "/";
	$.get(url, {}, function(f){
        $("id_folio").val(f);
    });
}


$().ready(function(){
    $('#mensaje_descuento').hide()
    set_enviar_button();
    $('#id_enviar').click(function(){
   	    if(emails.length == 0){
   	        
            alert('Esta empresa no tiene una dirección de correo registrada.');
			return false;
		}
		else { 
		    if(!confirm(send_alert) ) { return false; } 
		}
   });
});




function juegos_dialog(){    
    var productos = [];
    $("#id_juego").autocomplete({
        source:"/ajax/contains/juego/",
        minLength:minLength_ac,
        select:function(event, ui){
            set_juego_productos(ui.item.productos);
            productos = ui.item.productos;
        }
        
    });

    $("#juegos_dialog").dialog({
        bgiframe: true,
        height: 280,
        width: 900,
        buttons: {
            'Ok': function() {
                $(".delete-row").click();
                var ind = 0;
                $.each(productos, function(i,p){
                    if($("#juego_producto-"+i).attr("checked")){
                        if(ind > 0){
                            $(".add-row").click();
                        }
                        $("#id_form-"+ind+"-producto").val(p.producto);
                        $("#id_form-"+ind+"-cantidad").val(p.cantidad);
                        get_producto_item(ind, p.producto);
                        
                        ind += 1;
                        
                        
                    }
                    
                });
                                    
                $("#id_juego").val("");
                $("#tabla_juego").html("");
                $("#juegos_dialog").dialog("close");
                

            }
        }
    });
    $("#juegos_dialog").dialog('open');
}

function set_juego_productos(productos){
    
    var out = "<tr><th></th><th>Codigo</th><th>Cantidad</th></tr>"
    
    $.each(productos, function(i,p){
        if (i % 2 == 0){
            klass = "odd";
        } else {
            klass = "even";
        }
        
        out += '<tr class="'+klass+'">';
        out += '<td><input type="checkbox" id="juego_producto-'+i+'"></td>';
        out += '<td><label for="juego_producto-'+i+'">'+p.producto+'</label></td>';
        out += '<td><label for="juego_producto-'+i+'">'+p.cantidad+'</label></td>';
        out += '</tr>'
    
    });
    
    $("#tabla_juego").html(out);

}

function get_producto_item(i, codigo, tipo){
    if(!tipo){
        tipo = "";
    }
    var almacen = $("#id_almacen").val();
    var condicion = $("#id_condicion").val();
    var proveedor = $("#id_proveedor").val();
    var url = '/ajax/get_producto_item/?term='+codigo+'&a='+almacen+'&tipo='+tipo+'&condicion='+condicion+'&proveedor='+proveedor;
    console.log(url);        
    $.ajax({
        url:url,
        dataType:'json',
        success: function(productos) {
            if(productos){
                ui = {'item':productos[0], }
                console.log(ui);
                select_producto(event, ui, i);
            }
        }
    
    
    });
    

}

function get_producto_item_codigo_barras(i, codigo){
    var almacen = $("#id_almacen").val();
    $.ajax({
        url:'/ajax/contains/producto_almacen_formset/?term='+codigo+'&a='+almacen+'&tipo=salida&cb=True',
        dataType:'json',
        success: function(productos) {
            if(productos){
                ui = {'item':productos[0], }
                select_producto(event, ui, i);
               
            }
        }
    
    
    });
    

}



function validar_cliente(es_cliente){

    proveedor = $("#id_proveedor").val();

    if(proveedor){

        $.ajax({
            url:"/ajax/existe_cliente/?rs="+encodeURIComponent(proveedor)+"&es_cliente="+es_cliente,
            dataType:"json",
            success:function(data){
                if(!data){
                    $("#id_cliente-razon_social").val(proveedor);
                     $("#agregar_cliente_dialog").dialog({
                        bgiframe: true,
                        height: 700,
                        width: 900,
                        buttons: {
                            'Agregar': function() {
                                loading_cliente = '<img src="/site_media/img/blue_loading.gif">';
                                
                                if(confirm("¿Desea continuar?")){
                                    $("#loading_cliente").html(loading_cliente);
                                    cliente_f = ["rfc", "razon_social", "codigo", ];

                                    direccion_f = ["calle", "numero_e", "numero_i", "cp", "colonia",
                                                   "localidad", "municipio", "estado", "telefono", "email",
                                    ];
                                    get_form = set_get_form(cliente_f, "cliente-");
                                    get_form += set_get_form(direccion_f, "", true);
                                    $.ajax({
                                        url:"/ajax/agregar_cliente/"+get_form+"&es_cliente=1",
                                        dataType: "json",
                                        success:function(data){
                                            if(data.guardado){
                                                $("#loading_cliente").html("");
                                                alert("El cliente se ha guardado correctamente.");
                                                $("#id_proveedor").val(data.razon_social);
                                                cliente_change(false, tipo_del_movimiento, data.razon_social)
                                                clean_cliente_form(cliente_f, "cliente-");
                                                $("#agregar_cliente_dialog").dialog('close');
                                            }
                                            set_errors_cliente(cliente_f, "cliente-", data.errors_c);
                                            set_errors_cliente(cliente_f, "", data.errors_d);
                                            $("#loading_cliente").html("");
                                        }
                                    })

                                }
                              
                            },
                            'Cancelar': function() {
                                $("#agregar_cliente_dialog").dialog('close');
                            }
                        }
                    });
                    $("#agregar_cliente_dialog").dialog('open');
                        
                    }

            }

        });

    }
}





function clean_cliente_form(arr, prefix){

    $.each(arr, function(i, e){
        $("#id_"+prefix+e).val("");
        
    });

}

function printText(elem) { 
    var w = 200;
    var h = 150;
    var left = (screen.width/2)-(w/2);
    var top = (screen.height/2)-(h/2);
    popup = window.open('','Imprimir pedido', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
    popup.document.open(); 
    popup.document.write("<html><head></head><body onload='print();' style='font-family:sans-serif; font-size:9pt;'>"); 
    popup.document.write(elem); 
    popup.document.write("</body></html>"); 
    popup.document.close(); 
}

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
