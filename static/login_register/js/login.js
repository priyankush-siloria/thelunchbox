$(document).ready(function(){
  var msgsucc=$('#msgsucc').html();
  
  if(msgsucc!=null && msgsucc != "" &&  msgsucc != "undefined"){
      $.toast({
          text: msgsucc,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'success'
        });
  }

  var msg_error=$('#msg_error').html();
  
  if(msg_error!=null && msg_error != "" &&  msg_error != "undefined"){
      $.toast({
          text: msg_error,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }

  var msg_already=$('#msg_already').html();
  
  if(msg_already!=null && msg_already != "" &&  msg_already != "undefined"){
      $.toast({
          text: msg_already,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'warning'
        });
  }

});

$(document).on("click", '.login_submit',function(){
	
	var x = $("input[name='csrfmiddlewaretoken']").val();
  
 
   $('#login_email').removeClass('error');
   $('#login_pwd').removeClass('error');
   
	var login_email=$('#login_email').val();

	if (login_email=='' || login_email == null)
       { 

               	  $('#login_email').addClass('error');
       	  return false
       }

 
	  var login_pwd=$('#login_pwd').val();


		if (login_pwd=='' || login_pwd == null)
       {
       	  $('#login_pwd').addClass('error');
       	  return false
       }
 
              $.ajax({
                 type: 'POST',
                  data:{'email':login_email,'pwd':login_pwd,'csrfmiddlewaretoken': x},
                  success: function(response)
                  {
    
                      if (response.custom_success)
                       {
                        
                       window.location.href = "/";

                       }

                       if (response.rest_success)
                       {
                        
                         window.location.href = "/dashboard/";
                       

                       }


                         if (response.error=='1')
                       {
                        
                        $.toast({
                          position: 'top-right',
                          text: "Incorrect email or password.",
                          loader: false,
                          hideAfter: 5000,
                          icon: 'error'
                        });
                        // $('#hidden_login_alert').show();

                       }
                       if (response.error=='0'){
                        $.toast({
                          position: 'top-right',
                          text: response.msg,
                          loader: false,
                          hideAfter: 5000,
                          icon: 'error'
                        });
                       }

                   }
        });
              return false;

});




