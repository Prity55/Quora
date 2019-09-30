 $(document).ready(function(){
 	
 	function check_name(){
 		if($('#school').val()=="")
 			$("#error").html("plz fill correct value");
 		else{
     			
 			  var regex=/^[a-zA-Z]*$/gi;                                                              
 			  var f=regex.test($('#school').val());
 			  if(f==true)
 	  			$('#error').html("");
 	  		else{
 	  				$('#school').val("");
 			    	$("#error").html("invalid school name");
 	  				}
 	  		}
    }
  function check_concentration(){
     
        var regex=/^[a-zA-Z ]*$/gi;                                                              
        var f=regex.test($('#concentration').val());
        if(f==true)
          $('#error1').html("");
        else{
             $('#concentration').val("");
             alert("only letter allow");
             //$("#error1").html("");
        }
        
 	    }
  function check_2concentration(){
     
        var regex=/^[a-zA-Z ]*$/gi;                                                              
        var f=regex.test($('#2concentration').val());
        if(f==true)
          $('#error2').html("");
        else{
            $('#2concentration').val("");
            alert("only letter allow");
          }
   }
  function check_degree()
  {
    var regex=/^[a-zA-Z ]*$/gi;                                                              
        var f=regex.test($('#degree').val());
        if(f==true)
          $('#error3').html("");
        else{
             $('#degree').val("");
             alert("only letter allow");
            //$("#error3").html("only letter allow");

          }
  }

 	$('#school').blur(function(){
		check_name();
	});
  $('#concentration').blur(function(){
    check_concentration();
  });
  $('#2concentration').blur(function(){
    check_2concentration();
  });
  $('#degree').blur(function()
  {
    check_degree();
  });
 	$(document).on('submit','#reg',function(e){
    
        var regex=/^[a-zA-Z]*$/gi;                                                              
        var f=regex.test($('#school').val());
      if($('#school').val()==''|| $('#school').val()!='')
      {
        debugger
         check_name();
      }
      if($('#concentration').val()!='')
         check_concentration();
      if($('#second_concentration').val()!='')
         check_2concentration();	
      if($('#degree').val()!='')
         check_degree();	

 		  if($('#school').val()!='')
       {
        debugger
        
         $('#reg').submit();
          debugger
         return true;
        }    
      else{
        debugger
          e.preventDefault();
          return false; 
       }

   });
});