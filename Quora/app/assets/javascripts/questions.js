// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  function check_name(){
    if($('#data').val()==""){
      alert ("plz fill value in question text box");
    }
    else{
      $("#error").html("");
    }
  }
  $('#data').blur(function(){
    check_name();
  });
  $(document).on('submit','#reg',function(e){
    if($('#data').val()!=''){
      $('#reg').submit();
      return true;
    }
    else{
      check_name();
      e.preventDefault();
      return false; 
    }
  });
});
