
var timeout = 200;

var validate_rules = {};
var validate_messages = {};

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
    }
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
    dateFormat: 'dd/mm/yyyy',
    showOn: 'button',
    buttonImage: '/site_media/img/calendar.gif',
    buttonImageOnly: true
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

function eliminar(url){
    motivo = prompt('Introduzca el motivo del porqué desea eliminar este registro');
    if(motivo) { window.location = url + '?motivo='+motivo; }
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
    
    if(str_date < inicio_operaciones) {
        alert('No puede seleccionar una fecha menor a la fecha de inicio de operaciones.');
        return false;
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
         $("#"+next).focus();
         return false;
    } else {
        return true;
    }
}
function opera_clean_submit(){
    $('#id_submit').focus();
    $('#editForm').submit();
}
function format_currency(num) {
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

function formatCurrency(num) {
    return '$' + format_currency(num)
}
function string_to_decimal(num){
	if(!num) return 0;
	num = parseFloat(num.toString().replace(/\$|\,/g,''));
	if(isNaN(num)) return 0; 
	else return num;
}

