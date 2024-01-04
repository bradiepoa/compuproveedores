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

