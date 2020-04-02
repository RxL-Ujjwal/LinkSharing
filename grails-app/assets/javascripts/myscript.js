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

var rate = function(){
    $.ajax({
        url: "/resource/rating/",
        type: "POST",
        data:{"value": $("input[type='radio'][name='rating']:checked").val(),"resourceId":$(".res").text() },
        success: function (data) {
            if(data.success  ==  true){
                alert("success")
            }else{
                alert("rating changed")
            }
        },
        error: function () {
            alert("Resource rating failed")
        }
    });
};

$(document).ready(function(){
    $("#star1,#star2,#star3,#star4,#star5").click(function(){
        rate()
    });
    $("#ctopic").click(function(){
        create();
        $("#topicCancel").click();
    });
    $("#cpass").blur(function(){
        if($(this).val()!=$("#pass").val())
            alert("Password Mismatch.");
        });
  });

