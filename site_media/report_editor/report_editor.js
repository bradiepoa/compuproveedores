var id = 0;
var active_type = '';
var active_value = '';
var active_caption = '';
var canvas = Object();
var box_id = 0;
var $dialog;
var $textarea = $('');
var selected = [];
var selected_area;

function set_option(type, value, caption){
    if (!caption){
        caption = value;
    }
    active_type = type;
    active_value = value;
    active_caption = caption;
	selected = []; 
}

function create_square(div, type, value, caption, x, y, w, h, s, c, f, m) {
    id++;
    div.attr('id', id);
    div.css({ border: '1px solid black', 
              background: '#none', 
              padding: '0.0em' })
    if(type == 'image'){
         caption = '<img src="'+caption+'" class="report-image">';
         div.css({border: 'none',});
    
    } else if(type == 'label'){
         div.css({background:'#FFA'});
    
    } else if(type == 'shape'){
         div.css({background:'transparent'});
    
    } else if(type == 'table'){
         div.css({background:'#F92'});
    
    } else if(type == 'help'){
         div.css({background:'#5E5'});
    
    } else if(type == 'dynamic'){
         div.css({background:'#DEF'});
         
    }
    
    div.append(caption);    
    div.draggable({
        stop: function(event,ui){
            _x = parseInt(ui.offset.left - canvas.left);
            _y = parseInt(ui.offset.top - canvas.top);
            $('#x-' + $(this).attr('id')).val(_x);
            $('#y-' + $(this).attr('id')).val(_y);
        }
    });
    div.addClass('boxer');

    /*
     * se aplica la función que genera el menú al presionar el clck derecho
     * lenght - 2 es para transformar 223px a 223 por ejemplo. 
     */ 
    div.contextMenu({menu: 'optionMenu'},
        function(action, el, pos) {
            div_id = div.attr('id');
            if (action == 'delete') {
                $("#o-" + div_id).remove();
                $("#x-" + div_id).remove();
                $("#y-" + div_id).remove();
                $("#w-" + div_id).remove();
                $("#h-" + div_id).remove();
                $("#t-" + div_id).remove();
                $("#s-" + div_id).remove();
                $("#c-" + div_id).remove();
                $("#f-" + div_id).remove();
                $("#m-" + div_id).remove();
                div.remove();
            } else if (action == 'wresize') {
                new_val = prompt('Ancho', remove_px(div.css('width')));
                div.css('width', new_val + 'px');
                $("#w-" + div_id).val(new_val);
                
            } else if (action == 'hresize') {
                new_val = prompt('Alto', remove_px(div.css('height')));
                div.css('height', new_val + 'px');
                $("#h-" + div_id).val(new_val);
            
            } else if (action == 'table') {
                new_val = prompt('Nombre de la nueva columna', '');
                
            } else if (action == 'font-size') {
                dom_ob = $('#s-' + div.attr('id'));
                new_val = prompt('Tamaño de letra', dom_ob.val());
                dom_ob.val(new_val);
                
            } else if (action == 'font') {
                dom_ob = $('#f-' + div.attr('id'));
                new_val = prompt('Fuente', dom_ob.val());
                dom_ob.val(new_val);
                
            } else if (action == 'color') {
                dom_ob = $('#c-' + div.attr('id'));
                new_val = prompt('Color de letra', dom_ob.val());
                dom_ob.val(new_val);
                
            } else if (action == 'background') {
                dom_ob = $('#b-' + div.attr('id'));
                new_val = prompt('Color de fondo', dom_ob.val());
                dom_ob.val(new_val);
                
            }
            
            else if (action == 'cancel') { }
    });
    
    div.resizable({
        stop: function(event, ui){
            div_id = div.attr('id');
            $("#w-" + div_id).val(remove_px(div.css('width')));
            $("#h-" + div_id).val(remove_px(div.css('height')));
        }
    });

    form = $('#id_form');
    form.append('<input type="hidden" id="t-'+id+'" name="t" value="' + type +'">');
    form.append('<input type="hidden" id="o-'+id+'" name="o" value="' + value +'">');
    form.append('<input type="hidden" id="x-'+id+'" name="x" value="'+ x +'">');
    form.append('<input type="hidden" id="y-'+id+'" name="y" value="'+ y +'">');
    form.append('<input type="hidden" id="w-'+id+'" name="w" value="'+ w +'">');
    form.append('<input type="hidden" id="h-'+id+'" name="h" value="'+ h +'">');
    form.append('<input type="hidden" id="s-'+id+'" name="s" value="'+ s +'">');
    form.append('<input type="hidden" id="c-'+id+'" name="c" value="'+ c +'">');
    form.append('<input type="hidden" id="f-'+id+'" name="f" value="'+ f +'">');
    form.append('<input type="hidden" id="m-'+id+'" name="m" value="'+ m +'">');
    
    return true;
}

/* 
 * Quita las últimas dos letras del string recibido (usado
 * para remover 'px' de las cantidades de pixeles 
 */
function remove_px(s) {
    return s.substr(0, s.length - 2);
}

function set_table_column(table, name, option, x, w){
    out = '<div id="col-'+option+'" class="table-column">aa</div>';
    table.append(out);
    
    form = $('#id_form');
    form.append('<input type="hidden" id="col-table-'+id+'" name="col-table" value="' + table +'">');
    form.append('<input type="hidden" id="col-n-'+id+'" name="col-n" value="' + name +'">');
    form.append('<input type="hidden" id="col-o-'+id+'" name="col-o" value="' + option +'">');
    form.append('<input type="hidden" id="col-x-'+id+'" name="col-x" value="'+ x +'">');
    form.append('<input type="hidden" id="col-w-'+id+'" name="col-w" value="'+ w +'">');

    $('.table-column').resizable({ handles: 'e' });
}

function set_div(x, y, w, h){
    div = $(document.createElement('div'));
    div.css({position:'absolute', 
             left:x + canvas.left, 
             top: y + canvas.top, 
             width: w, 
             height: h });
             
    $('#canvas').append(div);       
    return div;
}

function set_landscape(){
    if( $("#id_landscape").attr('checked') ){
        $("#canvas").css({ height:'597px', width:'803px' });
    } else { 
        $("#canvas").css({ height:'803px', width:'597px' });
    }
}

