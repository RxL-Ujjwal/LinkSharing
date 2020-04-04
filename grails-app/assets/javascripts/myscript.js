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
                $('#messg').html("You have rate the Topic Successfully");
            }else{
                $('#messg').html("You have change the rating of this Topic");
            }
        },
        error: function () {
            alert("Resource rating failed")
        }
    });
};


$(document).ready(function(){

    $('#rateMessage').hide()

    $("#star1,#star2,#star3,#star4,#star5").click(function(){
        $('#rateMessage').show()
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

