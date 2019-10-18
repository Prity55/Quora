// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  function check_name(){
    debugger
    $('#reg').find('input[type="submit"]').removeAttr('disabled');
    if($('#name').val()=="")
      $("#error").html("only allow character");
    else{     
      var regex=/^[a-zA-Z ]*$/gi;                                                              
      var f=regex.test($('#name').val());
      if(f==true)
        $('#error').html("");
      else{
        $('#name').val("");
        $("#error").html("only allow character");
      }
    }
  }
  $('#name').blur(function(){
    check_company();
  });
  $(document).on('submit','#reg',function(e){
    if($('#name').val()==''||$('#name').val()!='')
      check_name();
    if($('#name').val()!=''){
      $('#reg').submit();
      return true;
    }
    else{
      alert ("please fill value after refresh page");
      e.preventDefault();
      // $('input[type="submit"]').attr('disabled','disabled');
      // return false; 
    }
  });
});