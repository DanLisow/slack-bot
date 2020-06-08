$(document).ready(function(){

    $('.main-block').on('click', '.tabs a', function(){
        $('.tabs a').removeClass('active');
        $(this).addClass('active');
        var href = $(this).attr('href');
        $('.tab').removeClass('active').removeClass('in');
        var id = $(href).addClass('active');
        setTimeout(function(){
            $(href).addClass('in');
        }, 200);
        return false;
    });

});