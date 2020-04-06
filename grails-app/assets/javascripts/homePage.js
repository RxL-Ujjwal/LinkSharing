var forgotPassword = function(){
    $.ajax({
        url: "/user/forgotPassword/",
        type: "POST",
        data:{"emailForgot": $("#forgotEmail").val() },
        success: function () {
            $(".alert-success.forgot").html("Reset link sent")
        },
        error: function () {
            alert("Topic save failed")
        }
    });
};
$(document).ready(function () {
    $("#sendPassword").click(function () {
        forgotPassword();
    });
});


var change = function(){
    $.ajax({
        url: "/user/changePassword/",
        type: "POST",
        data:{"password": $("#txtConfirmPassword").val(),"userId": $(".password").text() },
        success: function () {
            $('#messg').html("Password Changed Successfully")
        },
        error: function () {
            $('#messg').html("Password Change Failed")
        }
    });
};
$(document).ready(function () {
    $("#passMessage").hide()
    $(".btn-primary.reset").click(function () {
        $("#passMessage").show()
        change();
    });
});

$(document).ready(function () {
    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
})
