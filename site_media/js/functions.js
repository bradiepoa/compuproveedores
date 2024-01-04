var timeout = 200;
var validate_rules = {};
var validate_messages = {};
var global_submit = false;
var minLength_ac = 1;

String.prototype.endsWith = function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
};

$(document).ready(function(){
    $('td[colspan=10] .pagination').attr('style', 'text-align:center');
    $('select').addClass('input_txt');
    $('#add_abono a').addClass('slim_button');
});
function cuenta_match_options(id) { 
    
    return {
        width: 500,
        mustMatch:true,
        
        formatItem: function(row, i, max) {
		    //return i + "/" + max + ": \"" + row.name + "\" [" + row.to + "]";
		    return  row + "";
	    },
	    formatMatch: function(row, i, max) {
		    
		    return row.name + " " + row.to;
		    
	    },
	    formatResult: function(row) {
		    //return row.to;
		    vars = (row+"").split(' - ');
		    showed = '';
		    if(vars.length > 1){
		        showed = vars[1];
		    }
		    //alert(showed);
		    //$("#id_cuenta_descripcion-"+id).html(showed);
		    return vars[0]
	    }
    }
};

var um_match_options = {
    width:200, 
    minChars:0
}

var producto_match_options = { 
    width: 500,
    max:200,
    formatItem: function(row, i, max) {
        return  row + "";
    },
    formatMatch: function(row, i, max) {
        return row;
    },
    formatResult: function(row) {
        return (row+"").split('   --   ')[0];
    },
    cacheLength:1,
    matchSubset:false
    
};

var persona_match_options_rs = { 
    width: 500,
    formatItem: function(row, i, max) {
        return  row + " ";
    },
    formatMatch: function(row, i, max) {
        return row;
    },
    formatResult: function(row) {
        return row;
    },
    cacheLength:1,
    matchSubset:false

};

var direcciones_match_options = {
    width: 500,
    formatItem: function(row, i, max) {
        return  row + " ";
    },
    formatMatch: function(row, i, max) {
        return row;
    },
    formatResult: function(row) {
        return row;
    },
    cacheLength:1,
    matchSubset:false
};

var persona_match_options_codigo = { 
    width: 500,
    formatItem: function(row, i, max) {
        return  row + " ";
    },
    formatMatch: function(row, i, max) {
        return row;
    },
    formatResult: function(row) {
        return (row+"").split('  --  ')[0];
    }

};
var cal_options = {
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd',
    showOn: 'button',
    buttonImage: '/site_media/img/calendar.gif',
    buttonImageOnly: true
};

var calendar_options = {
    changeMonth: true,
    changeYear: true,
    dateFormat: 'dd/mm/y',
    showOn: 'button',
    buttonImage: '/site_media/img/calendar.gif',
    buttonImageOn0y: true,
    yearRange: '1900:2014'
};

var autocomplete_options = {
    minChars: 0,
    autoFill: true,
    mustMatch: false,
    matchContains: false
};
function set_date_from_cal(name){
    var date;
    date = Date.parseExact($('#id_'+name).val(),'yyyy-MM-dd');

    if(date && validate_date(date) ) {
        $('#field_' + name).val(date.toString('dd/MM/yy'));
        //$('#txt_' + name).html(date.toString('dd') + ' de ' + date.toString('MMM') + ' del ' + date.toString('yyyy'));
    } else {
		$('#id_' + name).val('');
		$('#field_' + name).val('');
        $('#txt_' + name).html('');
	}
	
	//if(name == "vencimiento") { validate_vencimiento(); }
	
}
function set_date_from_text(name){
	field_val = $('#field_'+name).val();
	if(field_val > '00/00/00'){
		date = Date.parseExact(field_val,'dd/MM/yy');
		if(!date){
		    alert('La fecha introducida no es válida, debe introducir la fecha en formato dd/mm/yy, ejemplo: 25/06/09 ')
		    $('#id_'+name).val('');
		    $('#txt_'+name).val('');
		    $('#field_'+name).val('');
            return false;
		}
	    $('#id_'+name).val(date.toString('yyyy-MM-dd'));
	    //$('#txt_'+name).html(date.toString('dd') +' de '+ date.toString('MMM') +' del '+ date.toString('yyyy'));
	    set_date_from_cal(name);	
	} else {
		$('#id_'+name).val('');
        $('#txt_'+name).html('');
	}
}

/**
 * Copy dates
 * @param {Object} from
 * @param {Object} to
 * @param {Object} reverse
 */
function copy_dates(from, to, delta, reverse){
    if(reverse){
        prefix = '#field_';
        date_fn = set_date_from_text;
		parse = 'dd/MM/yy';
    } else {
        prefix = '#id_';
        date_fn = set_date_from_cal;
        parse = 'yyyy-MM-dd';
    }
	
	new_date = Date.parseExact($(prefix + from).val(), parse).addDays(delta);
	new_val =  new_date.toString(parse);
    $(prefix + to).val(new_val);
	date_fn(to);
}

function eliminar(url, verb){
    if(verb == undefined){
        verb = 'eliminar este registro';
    }

    $.ajax({
        url:"/ajax/check_autorizacion/",
        dataType:"json",
        success:function(data){
            if(data.autorizacion){
                    var clave = null;
                    $( "#dialog_autorizacion_cancelacion" ).dialog({
                        title:"Autorización",
                        height:150,
                        resizable: false,
                        draggable: false,
                        width:300,
                        buttons:{
                            Aceptar:function(){
                                $( "#dialog_autorizacion_cancelacion" ).dialog("close");
                                clave = $("#id_clave_autorizacion_cancelacion").val();
                                if(clave){
                                    $.ajax({
                                        url:"/ajax/validar_autorizacion/"+clave+"/",
                                        dataType:"json",
                                        success:function(data2){
                                            if(data2.valido && data2.autorizacion_cancelar_movimiento){
                                                eliminar_mov(url, verb);
                                                $("#id_clave_autorizacion_cancelacion").val("");
                                            }else{
                                                alertify.alert("La clave es incorrecta");
                                                $("#id_clave_autorizacion_cancelacion").val("");
                                            }
                                        }

                                    });
                                }else{
                                    $("#id_clave_autorizacion_cancelacion").val("");
                                }
                            },
                            Cancelar:function(){
                                $( "#dialog_autorizacion_cancelacion" ).dialog("close");
                                $("#id_clave_autorizacion_cancelacion").val("");
                            },
                        },

                    });

                    
                  
            }else{
                eliminar_mov(url, verb);
            }

            
        }
    });
}

function eliminar_mov(url, verb){
    alertify.prompt('Introduzca el motivo del porqué desea '+ verb, function(e, motivo){
        if(e && motivo){
            window.location = url + '?motivo='+motivo;
        }else{
            return false
        }
    });
}

function eliminar_detalle(id){
    if(confirm('¿Está seguro que desea eliminar este registro?')) {
		window.location = '/admin/delete/movimiento_detalle/'+ id ;
    }
}

function eliminar_confirm(url){
    if (confirm('Introduzca el motivo del porqué desea eliminar este registro')){
        window.location = url + '?motivo=bla'; 
    }
}

function validate_date(date){
    str_date = date.toString('yyyy-MM-dd');
    date.toString('yyyy-MM-dd');
    
 //   if(str_date > today){
 //       alert('No puede seleccionar una fecha mayor al día de hoy.');
 //       return false;
        
//    } else 
    
    //if(str_date < inicio_operaciones) {
    //    alert('No puede seleccionar una fecha menor a la fecha de inicio de operaciones.');
    //    return false;
   // }
    
    
    
    return true;
    
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

function validate_fecha_ant(fecha){

    if(fecha){
        
        date = Date.parseExact(fecha,'dd/MM/yy');

        str_date = date.toString('yyyy-MM-dd');

        if(str_date < inicio_operaciones){
            alert('No puede seleccionar una fecha menor ala de inicio de operaciones.');
            return false;
            
        } 
    }

    return true; 
}

function check_enter(e,fn){
    var characterCode;
    if(e && e.which) {
        e = e;
        characterCode = e.which; 
    }
    else {
        e = e;
        characterCode = e.keyCode; 
    }
    if(characterCode == 13){
         fn();
    }
}
function show_hide_check(check_id, div_id){
    if($('#'+check_id).attr('checked')){
        $('#'+div_id).show();
    } else {
        $('#'+div_id).hide();
    }
}
function enter_to_tab(e, next){
    var characterCode;
    if(e && e.which) {
        e = e;
        characterCode = e.which; 
    }
    else {
        e = e;
        characterCode = e.keyCode; 
    }
    
    if(characterCode == 13){
         if(next){
             $("#"+next).focus();
             return false;
         }
    } else {
        return true;
    }
}



function create_formrow(e, callback){
    var characterCode;
    if(e && e.which) {
        e = e;
        characterCode = e.which; 
    }
    else {
        e = e;
        characterCode = e.keyCode; 
    }
         
    if(characterCode == 13 || characterCode == 9){

        var current_string = $(e.srcElement).attr('id')
        var tokens = $(e.srcElement).attr('id').split('-')
        var next_num = parseInt(tokens[1]) + 1
        var next_string = tokens[0] + "-" + next_num + "-" + tokens[2]
         
        if(!$("#" + next_string).attr('id')){
            $(".add-row").click();
            $(".lastform").keydown(create_formrow);
            $(".producto_autocomplete").autocomplete('/ajax/contains/producto/', producto_match_options)
            //$("#id_form-" + next_num + "-id").parent().parent().attr('id', next_num);
            
            return false;
        }
    } 
    return true;
}

function set_autocomplete_cliente_function(tipo,success){
    if(!success){
        success = function(){
            
        }
    }
    $("#id_proveedor").autocomplete({
        source:"/ajax/contains/cliente/"+tipo+"/",
        minLength:minLength_ac,
        success:success

    }); 
}

function opera_clean_submit(){
    $('#id_submit').focus();
    $('#editForm').submit();
}


function format_currency(num) {
    if(num == undefined){ num = 0; }
    num = num.toString().replace(/\$|\,/g,'');
    if(isNaN(num))
        num = "0";
    sign = (num == (num = Math.abs(num)));
    num = Math.floor(num*100+0.50000000001);
    cents = num % 100;
    num = Math.floor(num/100).toString();
    if(cents<10)
        cents = "0" + cents;
    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
        num = num.substring(0,num.length-(4*i+3))+','+
        num.substring(num.length-(4*i+3));
    return (((sign)?'':'-') + num + '.' + cents);
}

function red_format_currency (num) {
    if(num<0){
        return '<span class="red">' + format_currency(num) + '</span>';
    }
    return format_currency(num);
}

function formatCurrency(num) {
    return '$' + format_currency(num)
}

function format_int(n){
    var str = format_currency(n);
    return str.substring(0, str.length-3)
}

function string_to_decimal(num){
    return to_decimal(num);
}

function to_decimal(num){
	if(!num) return 0;
	num = parseFloat(num.toString().replace(/\$|\,/g,''));
	if(isNaN(num)) return 0; 
	else return num;
}


function inspect(obj, maxLevels, level)
{
  var str = '', type, msg;

    // Start Input Validations
    // Don't touch, we start iterating at level zero
    if(level == null)  level = 0;

    // At least you want to show the first level
    if(maxLevels == null) maxLevels = 1;
    if(maxLevels < 1)     
        return '<font color="red">Error: Levels number must be > 0</font>';

    // We start with a non null object
    if(obj == null)
    return '<font color="red">Error: Object <b>NULL</b></font>';
    // End Input Validations

    // Each Iteration must be indented
    str += '<ul>';

    // Start iterations for all objects in obj
    for(property in obj)
    {
      try
      {
          // Show "property" and "type property"
          type =  typeof(obj[property]);
          str += '<li>(' + type + ') ' + property + 
                 ( (obj[property]==null)?(': <b>null</b>'):('')) + '</li>';

          // We keep iterating if this property is an Object, non null
          // and we are inside the required number of levels
          if((type == 'object') && (obj[property] != null) && (level+1 < maxLevels))
          str += inspect(obj[property], maxLevels, level+1);
      }
      catch(err)
      {
        // Is there some properties in obj we can't access? Print it red.
        if(typeof(err) == 'string') msg = err;
        else if(err.message)        msg = err.message;
        else if(err.description)    msg = err.description;
        else                        msg = 'Unknown';

        str += '<li><font color="red">(Error) ' + property + ': ' + msg +'</font></li>';
      }
    }

      str += '</ul>';

    return str;
}

jQuery.fn.preventDoubleSubmit = function() {
  jQuery(this).submit(function() {
    return true;
//    if (global_submit)
//      return false;
//    else
//      global_submit = true;
  });
};

function add_months(fecha, n){
    var date = Date.parseExact(fecha,'dd/MM/yy');
    var month = date.getMonth() + 1
    var year = date.getFullYear()
    
    for(var i=0; i<n; i++){
        month += 1;
        if(month == 13){
            month = 1;
            year += 1;
        }
    }
    if(month < 10){
        month = "0" + month
    }
    var fecha_nueva = date.getUTCDate() + "/" + month + "/" + year;

    return fecha_nueva;   
}

function del_row_hide(){
    $(".delete-row:first").hide();

}


function set_get_form(arr, prefix, continuar_get){
    get_form = ""
    $.each(arr, function(i, e){
        if(i==0 && !continuar_get){
            get_form += "?"
        }else{
            get_form += "&"
        }
        get_form += prefix+e+"="+$("#id_"+prefix+e).val();
    });

    return get_form
}

function set_errors_cliente(arr, prefix, errors){
   
    $.each(arr, function(i, e){
        error = ""
        if(errors[e]){
            error = errors[e];
        }
        $("#id_"+prefix+e).next().html('<span class="red">'+error+'</span>');
        
    });
}


function confirm_link(link, msg){
    if (confirm(msg)){
        window.location = link;
    }
}

function crear_tabla(titulos, fields){
}

/*
* Recibe como parámetro un evento del keydown y una función
* la cual será ejectuada en caso de que la tecla presionada
* sea enter, este método es útil para formularios sin submit.
*/
function if_enter(e, fn){
    var characterCode;
    if(e && e.which) {
        e = e;
        characterCode = e.which; 
    }
    else {
        e = e;
        characterCode = e.keyCode; 
    }
    
    if(characterCode == 13){
        fn();
        return true;
    } else {
        return false;
    }
}


function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function guardar_resolucion(){
    var width = $(window).width();
    var height = $(window).height();

    $.ajax({
        url:"/ajax/guardar_resolucion/?width="+width+"&height="+height,
        dataType:"json",

    });
}