// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

    function check_name(){
    if($('#data').val()=="")
      {debugger
      $("#error").html("plz fill correct value");
    }
    else
      {debugger
      $("#error").html("");
    }
  }
  $('#data').blur(function(){
    check_name();
  });
  $(document).on('submit','#reg',function(e){
      debugger
      
      if($('#data').val()!='')
      {
          debugger  
        $('#reg').submit();

          return true;
      }
      else{
          debugger
             e.preventDefault();
                 return false; 
           }
    });
});
