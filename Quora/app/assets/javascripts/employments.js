$(document).ready(function(){
  function check_name(){
 		if($('#position').val()=="")
 			$("#error").html("plz fill value");
 		else{			
  	  var regex=/^[a-zA-Z ]*$/gi;                                                              
  	  var f=regex.test($('#position').val());
  	  if(f==true)
  			$('#error').html("");
  		else{
  			$('#position').val("");
      	$("#error").html("only allow character in position value");
  		}
	  }
 	}
  function check_company(){
    if($('#company').val()=="")
      $("#1error").html("plz fill value");
    else{     
      var regex=/^[a-zA-Z ]*$/gi;                                                              
      var f=regex.test($('#company').val());
      if(f==true)
        $('#1error').html("");
      else{
        $('#company').val("");
        $("#1error").html("only allow character in company value");
      }
    }
  }
  $('#position').blur(function(){
  	check_name();
  });
  $('#company').blur(function(){
    check_company();
  });
  $(document).on('submit','#reg',function(e){
    if($('#position').val()==''||$('#position').val()!='')
  	 check_name();
    if($('#company').val()==''||$('#company').val()!='')
     check_company(); 
    if($('#position').val()!=''&& $('#company').val()!=''){
     	$('#reg').submit();
  		return true;
    }
    else{
      e.preventDefault();
      return false; 
    }
  });
});