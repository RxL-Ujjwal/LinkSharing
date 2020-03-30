var createTopic = function(){
    $.ajax({
        url:"/topic/index",
        type: "POST",
        data: {"name":$("#name").val(),"visibility":$("#vis").val()},
        success : function() {
            alert("Topic Created")
        },
        error : function() {
            alert("Topic creation failed")
        }
    });
};

$(document).ready(function(){
    $("#ctopic").click(function(){
        createTopic();
    });
  });