$(document).ready(function(){
    $("#cpass").blur(function(){
      if($(this).val()!=$("#pass").val())
        alert("Password Mismatch.");
    });
  });