function change_user_type(){
    var t = $('#userType').val();
    if(t==0){
        show_div($('#donerLocation'));
    }
    if(t==1){
        hide_div($('#donerLocation'));
    }
}
function hide_div(div_obj) {
    div_obj.hide();
    disabled_change(div_obj, true);
}

function show_div(div_obj) {
    div_obj.show();
    disabled_change(div_obj, false);
}
