var forgotPassword = function(){
    $.ajax({
        url: "/user/forgotPassword/",
        type: "POST",
        data:{"emailForgot": $("#forgotEmail").val() },
        success: function () {
            $(".alert-success.forgot").html("Reset link sent").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        },
        error: function () {
            alert("Something went wrong").fadeOut(3000);
            setTimeout(function(){
                location.reload();
            }, 1000);
        }
    });
};
$(document).ready(function () {
    $("#sendPassword").click(function () {
        forgotPassword();
    });
});

var reset = function(){
    $.ajax({
        url: "/user/changePassword/",
        type: "POST",
        data:{"confirmPassword": $("#txtConfirmPassword").val(),"password": $("#txtPassword").val(),"userId": $(".password").text() },
        success: function (data) {
            if(data.success == true){
                console.log("inside")
                $("#messg").html("Password Changed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }else{
                console.log(data)
                $("#messg").html("Password cannot be Changed").fadeOut(3000);
                setTimeout(function(){
                    location.reload();
                }, 1000);
            }
        },
        error: function () {
            alert("Password change failed")
        }
    });
};



$(document).ready(function () {
    $("#passMessage").hide()
    $(".btn-primary.reset").click(function () {
        $("#passMessage").show()
        reset();
    });
});

$(document).ready(function () {
    $(' #txtConfirmPassword').on('keyup', function () {
        if ($('#txtPassword').val() == $('#txtConfirmPassword').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
});

var registerUser = function(){
    $.ajax({
        url: "/user/registerUser/",
        type: "POST",
        data:{"rfname": $("#rfname").val(),"rlname": $("#rlname").val(),
            "runame": $("#runame").val(),"remail": $("#remail").val(),"rpassword": $("#rpassword").val(),"rphoto": $("input[type='file']").val() },
        success: function (data) {
            console.log(data)
            $.each(data, function(key, value) {
                console.log("ajaxInside")
                if (value=="Registration Successful") {
                    $('#regSuccess').attr("hidden",false)
                    $('#successMessg').html(value).fadeOut(2000);
                } else {
                    $('#regFailed').attr("hidden",false)
                    $('#failMessg').html(value).fadeOut(2000);;
                }
            });
        },
        error: function () {
            $('#regFailed').attr("hidden",false)
            $('#failMessg').html("Something went wrong")
        }
    });
};

$(document).ready(function(){
    $('#submitForm').click(function () {
        console.log("inside")
        registerUser();
    });
    $("#rcpassword").blur(function(){
        if($(this).val()!=$("#rpassword").val())
            alert("Password Mismatch.");
    });
});


