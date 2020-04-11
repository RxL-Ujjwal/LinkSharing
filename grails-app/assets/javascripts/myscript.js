var create = function(){
    $.ajax({
        url:"/topic/createTopic",
        type: "POST",
        data: {"name":$("#name").val(),"visibility":$("#vis").val()},
        success : function(data) {
            if(data.success==true) {
                $('#info').html("Topic Created").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            } else {
                $('#info').html("Topic Existed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error : function() {
            $('#info').html("Topic Creation Failed").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};

var rate = function(){
    $.ajax({
        url: "/resourceRating/rating/",
        type: "POST",
        data:{"value": $("input[type='radio'][name='rating']:checked").val(),"resourceId":$(".res").text() },
        success: function (data) {
            if(data.success  ==  true){
                $('#messg').html("You have rate the Topic Successfully").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }else{
                $('#messg').html("You have change the rating of this Topic").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $('#messg').html("Resource Rating Failed").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};


$(document).ready(function(){

    $('#rateMessage').hide()

    $("#star1,#star2,#star3,#star4,#star5").click(function(){
        $('#rateMessage').show()
        rate()
    });

    $('#infoDiv').hide()
    $("#ctopic").click(function(){
        $('#infoDiv').show()
        create();
        $("#topicCancel").click();
    });
});

var invite = function(){
    $.ajax({
        url: "/emailSender/send/",
        type: "POST",
        data:{"address": $("#addressnull").val() , "subject": $("#subjectnull").val() , "body":$("#textnull").val()},
        success: function (/*data*/) {
            $(".alert-success").html("INVITE SENT").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        },
        error: function () {
           // alert("Error occurred!!")
        }
    });
};

$(document).ready(function(){
    $('#my_modal').on('show.bs.modal', function(event) {
        var topicId = $(event.relatedTarget).data('topic-id');
        $(event.currentTarget).find('textarea[name="topicId"]').val(topicId);
    });
})

$(document).ready(function () {
    $(".btn.btn-primary").click(function () {
        console.log("Function calling")
        invite();
    });
});

var deleteTopic = function(trashId){
    $.ajax({
        url: "/topic/delete/",
        type: "POST",
        data:{"topicId" : trashId},
        success: function (data) {
            if(data.success  ==  true){
                $('#info').html("You have deleted the Topic Successfully").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }else{
                $('#info').html("Sorry Topic has not been deleted").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $('#info').html("Something went wrong while deleting the Topic").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};

$(document).ready(function () {
    $("#infoDiv").hide()
    $(".delete").click(function () {
        $('#infoDiv').show()
        var trashId = $(this).attr('trashId');
        deleteTopic (trashId)
    });
});

var changeTopicSeriousness=function (topicId,topicSeriousness) {
    $.ajax({
        url:"/topic/changeTopicSeriousness",
        type:"POST",
        data:{"topicId":topicId,"topicSeriousness":topicSeriousness},
        success:function(data){
            if(data.success==true){
                $('#info').html("Seriousness Changed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
            else{
                $('#info').html("Seriousness Fail").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
    });

};

$(document).ready(function(){
    $('#infoDiv').hide()
    $('.seriousness').click(function(){
        $('#infoDiv').show()
        var topicId = $(this).attr('topicId');
        var topicSeriousness = $(this).val();
        changeTopicSeriousness(topicId,topicSeriousness)
    });
    $('.seriousness').select(topicSeriousness);
});


var changeTopicVisibility=function (topicId,topicVisibility) {
    $.ajax({
        url:"/topic/changeTopicVisibility",
        type:"POST",
        data:{"topicId":topicId,"topicVisibility":topicVisibility},
        success:function(data){
            if(data.success==true){
                $('#info').html("Visibility Changed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
            else{
                $('#info').html("Visibility Fail").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
    });

};

$(document).ready(function(){
    $('#infoDiv').hide()
    $('.visibility').click(function(){
        console.log("inside")
        $('#infoDiv').show()
        var topicId = $(this).attr('topicId')
        var topicVisibility = $(this).val()
        changeTopicVisibility(topicId,topicVisibility)
    });
});

var markAsReadPost=function (resourceId) {
    $.ajax({
        url:"/readingItem/isRead",
        type:"POST",
        data:{"resourceId":resourceId},
        success:function(data){
            if(data.success==true){
                //$('#info').html("Your Choice has been Locked").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
            else{
                //$('#info').html("Sorry your choice has not been locked").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
    });
};

$(document).ready(function(){
    $('#infoDiv').hide()
    $('.markAsRead').click(function(){
        console.log("inside")
        $('#infoDiv').show()
        var resourceId = $(this).attr('resourceId')
        console.log(resourceId)
        markAsReadPost(resourceId);
    });
});

var changeTopicName=function (topicId,topicName) {
    $.ajax({
        url:"/topic/changeTopicName",
        type:"POST",
        data:{"topicId":topicId,"topicName":topicName},
        success:function(data){
            if(data.success==true){
                $('#info').html("TopicName Changed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
            else{
                $('#info').html("Changed request Fail").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
    });

};

$(document).ready(function(){
    $('.topicEdit').click(function() {
        $('.changeOwner').attr('hidden', false)
        $('.topicName').attr('hidden', false)
    });
        $('.changeOwner').click(function () {
            var topicId = $(this).attr('topicId')
            var topicName = $('.topicName').val()
            console.log(topicId+" "+topicName)
            changeTopicName(topicId,topicName)
        });
        $('.changeOwner').attr('hidden',true)
    });


var sendInvite = function(topicName){
    $.ajax({
        url: "/emailSender/sendInvite/",
        type: "POST",
        data:{"address": $("#email").val() ,"topicName":topicName},
        success: function (/*data*/) {
            $('#info').html("Message Sent").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        },
        error: function () {
            $('#info').html("Error Occured").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};

$(document).ready(function(){
    $('#infoDiv').hide()
    $('#inviteButton').click(function () {
        $('#infoDiv').show()
        var topicName = $('.topicSelect').val()
        sendInvite(topicName);
    });
});


var deletePost = function(trashId){
    $.ajax({
        url: "/resource/deletePost/",
        type: "POST",
        data:{"postId" : trashId},
        success: function (data) {
            if(data.success  ==  true){
                $('#postMessg').html("You have deleted the Post Successfully").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }else{
                $('#postMessg').html("Sorry Post has not been deleted").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            $('#postMessg').html("Something went wrong while deleting the post").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};

$(document).ready(function () {
    $("#postDiv").hide()
    $(".deleteResource").click(function () {
        $('#postDiv').show()
        var trashId = $(this).attr('trashId');
        deletePost (trashId)
    });
});



