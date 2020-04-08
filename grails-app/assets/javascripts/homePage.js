var forgotPassword = function(){
    $.ajax({
        url: "/user/forgotPassword/",
        type: "POST",
        data:{"emailForgot": $("#forgotEmail").val() },
        success: function () {
            $(".alert-success.forgot").html("Reset link sent")
        },
        error: function () {
            alert("Something went wrong")
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
        data:{"password": $("#txtConfirmPassword").val(),"userId": $(".password").text() },
        success: function (data) {
            if(data.success == true){
                console.log("inside")
                $(".alert-success.forgot").attr('hidden',false).html("Password Change")
            }else{
                console.log(data)
                $(".alert-danger.forgot").attr('hidden',false).html("Password cannot be saved")
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

// var registerUser = function(){
//     $.ajax({
//         url: "/user/registerUser/",
//         type: "POST",
//         data:{"rfname": $("#rfname").val(),"rlname": $("#rlname").val(),
//             "runame": $("#runame").val(),"remail": $("#remail").val(),"rpassword": $("#rpassword").val(),"rphoto": $("input[type='file']").val() },
//         success: function () {
//             if(data.success==true) {
//                 $('#success').attr(hidden,false).html("Success")
//             } else {
//                 $('#fail').attr(hidden,false).html("Failed")
//             }
//         },
//         error: function () {
//             $('#fail').html("Something went wrong")
//         }
//     });
// };
//
// $(document).ready(function(){
//     $('#submitForm').click(function () {
//         registerUser();
//     });
//     $("#rcpassword").blur(function(){
//         if($(this).val()!=$("#rpassword").val())
//             alert("Password Mismatch.");
//     });
// });


