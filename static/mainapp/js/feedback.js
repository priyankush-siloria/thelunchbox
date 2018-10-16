function service_feedback(rating){
	var ratings=rating;
	a = getUrlParameter("paymentId");
	$.ajax({
               
          type: 'GET',
          url:  '/ratings/',
          data: {'paymentid': a,'rating':ratings},
          success: function (response) {
          
            if(response.status == 'error'){
            	$.toast({
                heading: 'Error',
                text: response.error_msg,
                position: 'top-center',
                loader: false,
                hideAfter: 3000,
                icon: 'error'
            });
              window.setTimeout(window.location.href="/",2000);
            }else{
              $.toast({
                heading: 'Thank You',
                text: "Your feedback is valuable for us.",
                position: 'top-center',
                loader: false,
                hideAfter: 3000,
                icon: 'success'
            });
              window.setTimeout(window.location.href="/",2000);
            }
           
          }
      });

}