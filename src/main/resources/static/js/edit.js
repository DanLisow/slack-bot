$(document).ready(function(){
    $(document).on('click', '.edit', function(){
        var employee_id = $(this).attr('id');
        $.ajax({
            url:"admin-edit.php",
            method: "POST",
            data:{employee_id: employee_id},
            dataType: "json",
            success: function(data){
                
            }
        });
    });
});