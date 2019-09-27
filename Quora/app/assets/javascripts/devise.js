$(document).ready(function(){

    function check_name(){
 		if($('#name').val()=="")
 			$("#error").html("plz fill correct value");
 		else{			
 			  var regex=/^[a-zA-Z]*$/gi;                                                              
 			  var f=regex.test($('#name').val());
 			  if(f==true)
 	  			$('#error').html("");
 	  		  else{
 	  				$('#name').val("");
 			    	$("#error").html("error in name");
 	  				}
 	  		}
 	}

    function check_email(){
   		var reg=/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
	  	
		  var f=reg.test($('#email').val());
		  if($('#email').val()=='')
		  {
			  $('#E_error').html("plz fill the value");
			  return true;
		  }
		  else if(f==false)
		  {
		  	$('#email').val("");
			  $('#E_error').html("plz fill correct email address");
			  return false;
		  }
		  else
		  {

		  	$('#E_error').html("");

			  return false;
		  }
    }
   function check_pwd()
   {
	  	if($('#password').val()=='')
		{
			 $('#P_error').html("plz fill the value");
			 return false;
		}
		else if($('#password').val()<8)
		{
		 	 $('#P_error').html("plz give long password atlest having 8 character");
			 return false;
		}
		else
		{
			 $('#P_error').html("");
			 return true;	
		}
    }
	function re_check_pwd()
	{
	  	var rePwd=$('#password_confirmation').val();
		if($('#password_confirmation').val()==""){
			$("#r_error").html("plz fill the value");
			return false;
		}
		else if($('#password_confirmation').val()!=$('#password').val()){
			 $("#r_error").html("plz fill the same Password");
			 $('#rePwd').val("");	
			 return false;
		}
		else{
			 $("#r_error").html("");
			 return(true);
			}
	}
$('#name').blur(function(){
	check_name();
});
$('#email').blur(function(){
	check_email();
});

$('#password').blur(function(){
		check_pwd();		
});

$('#password_confirmation').blur(function(){
		re_check_pwd();				
});
$('#reg').on("submit",function(e){
			
		  if($('#name').val()=='')
			check_name();
		  if($('#email').val()=='')
		  	check_email();
		  if($('#password').val()=='')
			check_pwd();
		  if($('#password_confirmation').val()=='')
			re_check_pwd();
		  if($('#name').val()!='' && $('#email').val()!='' && $('#password').val()!='' && $('#password_confirmation').val()!='')
		  
				 return true;
		  
		  else{
				 e.preventDefault();
                 return false; 
		   }
    });
});