var create = function(){
    $.ajax({
        url:"/topic/createTopic",
        type: "POST",
        data: {"name":$("#name").val(),"visibility":$("#vis").val()},
        success : function(data) {
            if(data.success==true)
                alert("Topic Created")
            else
                alert("Topic Existed")
        },
        error : function() {
            alert("Topic creation failed")
        }
    });
};

$(document).ready(function(){
    $("#ctopic").click(function(){
        create();
    });
    $("#cpass").blur(function(){
        if($(this).val()!=$("#pass").val())
            alert("Password Mismatch.");
        });
  });

