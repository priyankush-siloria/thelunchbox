


$(document).on('click', '#reset_pass', function(){
    
    $('#1st_pass').removeClass('error');
    $('#confirm_pass').removeClass('error');

    var pass=$('#1st_pass').val();
   var conf= $('#confirm_pass').val();
   var user_id=$('#hidden_user').val();
    var token=$('[name=csrfmiddlewaretoken]').val();
    var act=$('#hidden_act').val();
    var password_reegex= /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

            if (!password_reegex.test(pass))
            {
                $.toast({
                  heading: 'Reset Password',
                  text: 'Required atleast one character and one numeric. Minimum length of password is 8.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $("#1st_pass").addClass("error");
               $('#1st_pass').focus();
                return false; 
            }

            if (!password_reegex.test(conf))
            {
                $.toast({
                  heading: 'Reset Password',
                  text: 'Required atleast one character and one numeric. Minimum length of password is 8.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $("#confirm_pass").addClass("error");
               $('#confirm_pass').focus();
                return false; 
            }

            if(pass != conf)
            {
                 $.toast({
                  heading: 'Reset Password',
                  text: 'Password And Reset Password Does Not Match',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                
                return false; 

            }




            $.ajax({
          
            url: login_change_password,
            type:"POST",
            data: {
               'user_id':user_id,'password':pass,'csrfmiddlewaretoken': token,
            },
            success: function(response) {
                if (response)
                {
                  window.location.href = '/login'
                }
            }
        });


  });




function validate() {
	
	var name = $.trim($('#name').val());
    var email = $.trim($('#email').val());
    var phone = $.trim($('#phone').val());
    var msg1 = $.trim($('#msg1').val());
    if (name=='' || name==null) {

        $('#name').addClass('error');
        return false;
    }
    else if(email=='' || email==null){
    	$('#email').addClass('error');
    	$('#name').removeClass('error');
        return false;
    }
    else if(phone=='' || phone==null){
    	$('#phone').addClass('error');
    	$('#email').removeClass('error');
    	$('#name').removeClass('error');
        return false;
    }
    else if(msg1=='' || msg1==null){

    	$('#msg1').addClass('error');
    	$('#phone').removeClass('error');
    	$('#email').removeClass('error');
    	$('#name').removeClass('error');
        return false;
    }


    else{
    		
    		$('#msg1').removeClass('error');
	    	$('#phone').removeClass('error');
	    	$('#email').removeClass('error');
	    	$('#name').removeClass('error');
    		var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    		var name_regex= new RegExp("^[a-zA-Z]+(([a-zA-Z ])?[a-zA-Z]*)*$");
    		var phone_regex = /^[0-9+-]{9,13}$/;
            if (!email_regex.test(email))
            {
                $("#email").addClass("error");
                $.toast({
                      heading: 'Contact Us',
                      text: 'Enter a valid Email',
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                  })
                return false; 
            }
	      	else if (!name_regex.test(name))
	        {
	            $("#name").addClass("error");
	            $("#email").removeClass("error");
	             $.toast({
                      heading: 'Contact Us',
                      text: 'Name only contains letters',
                     position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                  })
	         	return false;  
	        } 
	        else if (!phone_regex.test(phone))
	        {
	            $('#phone').addClass("error");
	            $("#name").removeClass("error");
	            $("#email").removeClass("error");
              $.toast({
                  heading: 'Contact Us',
                  text: 'Phone number length is between 9 to 13. Only numerics are allowed.',
                  position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
	            return false;

	        }
	        else{
	        	
	        	return true;
	        }
	    return false;
    }
	return false;
}






$(document).on('click', '#add_money', function(e){
                      $('#myModal2').modal('hide');
                     $('#add_money_modal').modal('show');
                     return false;

});



$(document).on('keyup', '#euros', function(e){

var euro=$('#euros').val();

      var num_length = /^[0-9+-]{1,5}$/;
       if (euro=='')
                  {

                       $('#la_euros').val('');
                       return false;
                  }
        if(!num_length.test(euro)){
          $.toast({
                  heading: 'Contact Us',
                  text: 'Can\'t add more then 99999.',
                  position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
          $('#la_euros').val('');
            return false;
        }
         $(document.body).addClass('show_gif');
             $.ajax({
               
                type: 'GET',
                url:  '/add_money',
                data: {'euro': euro},
            success: function (response) {
              
             $('#la_euros').val(response); 
              $(document.body).removeClass('show_gif');
                }
            });
        });





$(document).on('click', '#sub_money_wallet', function(e){

     $('#euros').removeClass('error');
  $('#la_euros').removeClass('error');
var euro=$('#euros').val();

var la_euros=$('#la_euros').val();
$('.module_type').val('0');


       if (euro=='')
                  {

                       $('#euros').addClass('error');
                       return false;
                  }
        if (la_euros=='')
                  {

                       $('#la_euros').addClass('error');
                       return false;
                  }

      else{
                  
             $.ajax({
               
                type: 'POST',
                url:  money_to_wallet,
                data: {'euro': euro,'la_euros':la_euros,'csrfmiddlewaretoken':token},
            success: function (response) {
                
                $('.wallet_user').val(response.success);
                $('.a_final_amount').val(euro);
                $('#paymentModal').modal('show');

                }
            });                     

      }

        });





$(document).on('click', '#sub_money_wallet1', function(e){
              var x = $("input[name='csrfmiddlewaretoken']").val();
              var comment = document.getElementById("checkout_comment").value;
              var total_amount = $('.l_final_amount').val();
              var delivery_date = $('#ddate').val();
              var delivery_time = $('#select_dtime').val();
              if(total_amount == "" || total_amount == null || total_amount == "0"){
                  $.toast({
                    heading: 'Error',
                    text: 'Your cart is Empty.',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else if(delivery_date == "" || delivery_date == null){
                $.toast({
                    heading: 'Error',
                    text: 'Please select delivery date',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else if(delivery_time == "0" || delivery_time == null){
                $.toast({
                    heading: 'Error',
                    text: 'Please select delivery time',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else{
                $.ajax({

                      url: checkout_data,
                      type: 'POST',
                      data: {
                          'delivery_time':delivery_time,'delivery_date':delivery_date,'comment':comment,'csrfmiddlewaretoken': token
                      },
                      success: function (response) {
                          var size = response.length;
                          // alert(size);
                          if(response[size-1].status=='closed'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                            });
                          }
                          else if(response[size-1].status=='timeup'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                                loader: false,
                                hideAfter: 4000,
                                icon: 'error'
                                      });
                          }
                          else if(response[size-1].status=='incomplete'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                                loader: false,
                                hideAfter: 4000,
                                icon: 'error'
                                      });
                          }
                          else{

                            delete response[size-1];
                            response.splice(size-1,1);
                            var arrayData = JSON.stringify(response);
                            $('.comments_check').val(comment);
                            $('.checkout_orders').val(arrayData);
                            $('#module_type').val('1');
                            $('#paymentModal').modal('show');
                          }
                          
                        }
                    });
              }
             /*------------------------Compare delivery datetime with lunchbox------------------------------------*/
             
        });
 //---------------------------------------------------------------------------------------------------

    $('#ddate').datetimepicker({
        lang:'ch',
        timepicker:false,
        closeOnDateSelect:true,
        format:'Y-m-d',
        formatDate:'Y/m/d',
        ignoreReadonly: true,
        minDate: 0
    })



function check_delivery_datetime(){
  var deliverydate = $(".ddate").val();
  if(deliverydate=="" || deliverydate==null){
     $.toast({
        text: "Please select delivery date.",
        position: 'top-right',
        loader: false,
        hideAfter: 5000,
        icon: 'warning'
      });
    var select_box = $('#select_dtime');
    select_box[0].selectedIndex = 0;
  }
  else{
    $.ajax({
           url: evening_orders,
             type: "POST",
           data:{
             'delivery_date':deliverydate,
              'csrfmiddlewaretoken':token
                 },
         success: function(response) {
         
                if(response.status=="timeup"){
                    $.toast({
                                text: response.msg,
                            position: 'top-right',
                            loader: false,
                       hideAfter: 5000,
                           icon: 'warning'
                   });
                 }

             }
     })
 

  }
}
    


//--------------------------------------------------Add to cart------------------------------------
function tocart(formelmnt){
  var lunchboxid= formelmnt.elements["lunchbox"].value;
  var qty= formelmnt.elements["lunchboxqty"].value;
  var l_price= formelmnt.elements["lunchboxprice"].value;
  // var d_date= formelmnt.elements["d_date"].value;
  // var d_time= formelmnt.elements["d_time"].value;
  var token= formelmnt.elements["csrfmiddlewaretoken"].value;
 
  // if(d_date == "" || d_date == null){
  //   $.toast({
  //         heading: 'Delivery',
  //         text: 'Please select delivery date.',
  //         position: 'top-center',
  //         loader: false,
  //         hideAfter: 2000,
  //         icon: 'error'
  //     });
  //   return false;
  // }
  // else if (d_time == "" || d_time == null){
  //   $.toast({
  //         heading: 'Delivery',
  //         text: 'Please select delivery time.',
  //         position: 'top-center',
  //         loader: false,
  //         hideAfter: 2000,
  //         icon: 'error'
  //     });
  //   return false;
  // }
  // else{
     $.ajax({
            
            type: 'POST',
            url: add_to_cart,
            data: {'lunchbox_id':lunchboxid,'qty':qty,'p_price':l_price,'csrfmiddlewaretoken': token},
            success: function (response) {
              if(response.error){
                $.toast({
                  heading: 'Lunchbox',
                  text: response.error,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 4000,
                  icon: 'warning'
              });
              }
              else{
                  var sub_total=0.0,count=1;
                  var html_data,html_data2,html_data3,html_data4,html_data5;
                  var main_data='<div class="add_products" style="display: none;"> Your cart contains no products. Add some <a href="\\all">HERE</a> </div>';
                  for (var i=0;i<response.length;i++)
                  {

                    count=i+1
                    if(response[i].lunchbox_image==false){
                      html_data1='<li><a class="preview-image" href="#" title=""><img src="static/mainapp/img/lunchbox_chicken_1.png" class="preview"></a>';
                    }
                    else{
                      html_data1='<li><a class="preview-image" href="#" title=""><img src="'+response[i].lunchbox_image+'" class="preview"></a>';
                    }
                    
                    html_data2='<div class="description"><div class="price-quantity"><span class="quantity-formated"><span class="quantity">'+response[i].qty+'</span></span></div>';
                    html_data3='<a href="#" title="Ají de pollo con arroz ">'+response[i].lunchbox_name+'</a>';
                    html_data4='<div class="price-quantity"> <span class="lc_price"> € '+response[i].total+' </span></div>';
                    html_data5='</div><span class="remove_link"><a href="javascript:removecart('+response[i].lunchbox_id+')" class="remove_prodect"> </a></span></li>';
                    main_data+=html_data1+html_data2+html_data3+html_data4+html_data5;
                    sub_total= parseFloat(sub_total)+parseFloat(response[i].total);

                  }
                  $('#cart_list').html(main_data);
                  sub_total = Math.round(sub_total * 100) / 100;
                  document.getElementById("subtotal").innerHTML=sub_total+" €";
                  $('.cart_quientity').html(response.length);
                  $('.dtime').val("");
                  $('.ddate').val("");
                  $.toast({
                      heading: 'Cart Items',
                      text: 'Your items are succesfully added in cart.',
                      position: {right: 10,top:80},
                      loader: false,
                      hideAfter: 2000,
                  });

              }
              
              
            }
        });
      // }
      return false;
  }

//-----------------------------------Show cart---------------------------------


$( document ).ready(function() {


    $.ajax({
            
            type: 'GET',
            url:'/showcart',
            success: function (response) {
              var size=response.length;

              if(typeof size==='undefined'){
                $('.user_notify_num').html(response.notify_qty);
                delete response.notify_qty;
              }
              else{

                $('.user_notify_num').html(response[size-1].notify_qty);
                delete response[size-1];
                response.splice(size-1,1);
              }
              
              if(response.length>0){
                    var sub_total=0.0,count=1,vat=0.0,qty_discount=0.0,total=0.0,total_vat=0.0;
                    var html_data,html_data2,html_data3,html_data4,html_data5;
                    var var1,var2,var3,var4,var5,var6;

                    
                    var checkout_data='';
                    var main_data='<div class="add_products" style="display: none;"> Your cart contains no products. Add some <a href="\\all">HERE</a> </div>';
                    for (var i=0;i<response.length;i++)
                    {
                      /*---------------------------------cart----------------------------------------------*/
                      count=i+1;
                      if(response[i].lunchbox_image==false){
                        html_data1='<li><a class="preview-image" href="#" title=""><img src="static/mainapp/img/lunchbox_chicken_1.png" class="preview"></a>';
                      }
                      else{
                        html_data1='<li><a class="preview-image" href="#" title=""><img src="'+response[i].lunchbox_image+'" class="preview"></a>';
                      }
                      
                      html_data2='<div class="description"><div class="price-quantity"><span class="quantity-formated"><span class="quantity">'+response[i].qty+'</span></span></div>';
                      html_data3='<a href="#" title="Ají de pollo con arroz ">'+response[i].lunchbox_name+'</a>';
                      html_data4='<div class="price-quantity"> <span class="lc_price"> € '+response[i].total+' </span></div>';
                      html_data5='</div><span class="remove_link"><a href="javascript:removecart('+response[i].lunchbox_id+')" class="remove_prodect"> </a></span></li>';
                      main_data+=html_data1+html_data2+html_data3+html_data4+html_data5;
                      
                      /*------------------------------checkout---------------------------------------------------------*/

                      var1='<li class="pull-left full-width"><div class="purchase_summery_checkout_image"><a href="/open/box/'+response[i].lunchbox_id+'"> <img src="'+response[i].lunchbox_image+'" alt=""> </a></div>';
                      var2='<div class="purchase_summery_checkout_data"><div class="purchase_summery_checkout_name"><p class="purchase_summery_checkout_product-name"><a href="/open/box/'+response[i].lunchbox_id+'"> '+response[i].lunchbox_name+' </a></p></div>';
                      var3='<div class="purchase_summery_checkout_product_unit"><div class="purchase_summery_checkout_price"> <span class="price"> € '+response[i].lunchbox_price+' </span></div></div>'
                      var4='<div class="purchase_summery_checkout_product_delete"><a class="cart_quantity_delete" href="javascript:removecart('+response[i].lunchbox_id+')"></a></div>'
                      var5='<div class="purchase_summery_checkout_product_quantity"><div  class="purchase_summery_checkout_cart_quantity_button"> <a  class="purchase_summery_checkout_cart_quantity_down"  href="javascript:check_dcr('+response[i].lunchbox_id+','+response[i].lunchbox_price+','+count+')" title="Subtract">-</a> <input size="2" autocomplete="off" class="purchase_summery_checkout_cart_quantity_input" value="'+response[i].qty+'" min="1" name="" type="text" id="check_qty'+count+'" disabled><a class="purchase_summery_checkout_cart_quantity_up" href="javascript:check_incr('+response[i].lunchbox_id+','+response[i].lunchbox_price+','+count+')" title="Add">+</a></div></div><div class="purchase_summery_checkout_product_price">' 
                      var6='<span class="purchase_summery_checkout_total_price" id="total_amount'+count+'"> '+response[i].total+' € </span></div></div></li>'
                      checkout_data +=var1+var2+var3+var4+var5+var6;
                      sub_total= parseFloat(sub_total)+parseFloat(response[i].total_amount);
                      total= parseFloat(total)+parseFloat(response[i].total);
                      total_vat= parseFloat(total_vat)+parseFloat(response[i].vat);
                      qty_discount = parseFloat(qty_discount)+parseFloat(response[i].qty_discount);

                    }
                    total = Math.round(total * 100) / 100;
                    total_vat = Math.round(total_vat * 100) / 100;
                    qty_discount = Math.round(qty_discount * 100) / 100;
                    $('#cart_list').html(main_data);
                    $('#checkout_lunchboxes').html(checkout_data);
                    $('#vat_tax').html(total_vat+" €");
                    $('#subtotal').html(total+" €");
                    $('.cart_quientity').html(response.length);
                    $('#qty_discount').html(qty_discount+" €");
                    $('#sub_total_amount').html(total+" €");
                    $('#promo_code_input').html("");
                    var final_amount = sub_total+total_vat;
                    final_amount = Math.round(final_amount * 100) / 100;
                    $('#after_promo_total').html(final_amount+" €");
                    $('.l_final_amount').val(final_amount);
                    $('.vat_pay').val(total_vat);
                  
              }
              else{
                    $('#vat_tax').html("0 €");
                    $('#qty_discount').html("0 €");
                    $('#empty_cart_list').css('display','block');
                    $('#subtotal').html("0 €");
                    $('#cart_quientity').html("0");

                    $('#sub_total_amount').html("0 €");
                    $('#after_promo_total').html("0 €");
                    $('#promo_code_input').html("");
                    $('.l_final_amount').val("0");
                    $('#cart_list').html('<div class="add_products" style="display: block;"> Your cart contains no products. Add some <a href="\\all">HERE</a>. </div>');
                    $('#checkout_lunchboxes').html('<li class="pull-left full-width">Nothing in Your Cart</li>');
                    $("#hide_delivery").html("");

              }
              
            }
        });
});




function chngForm(mydiv){
  a=document.getElementById("checkout_register").style.display;
  b=document.getElementById("checkout_login").style.display;
  if(a=="block"){
    document.getElementById("checkout_register").style.display="none";
    document.getElementById("checkout_login").style.display="block";
    mydiv.innerHTML="<h1>REGISTER HERE</h1>";
  }
  if(b=="block"){
    document.getElementById("checkout_login").style.display="none";
    document.getElementById("checkout_register").style.display="block";
    mydiv.innerHTML="<h1>Registered users login here</h1>";
  }
}

/*---------------------------------------------Google Map API-----------------------------------------------------*/
var placeSearch, autocomplete, autocomplete2;
var aoutocompleteelmnt;
var componentForm = {
  street_number: 'short_name',
  route: 'long_name',
  locality: 'long_name',
  administrative_area_level_1: 'short_name',
  country: 'long_name',
  postal_code: 'short_name'
};

function initAutocomplete() {
  // Create the autocomplete object, restricting the search to geographical
  // location types.
  autocomplete = new google.maps.places.Autocomplete(
    /** @type {!HTMLInputElement} */
    (document.getElementById('autocomplete')), {
      types: ['geocode']
    });

  // When the user selects an address from the dropdown, populate the address
  // fields in the form.
  autocomplete.addListener('place_changed', function() {
    fillInAddress(autocomplete, "");
  });

  autocomplete2 = new google.maps.places.Autocomplete(
    /** @type {!HTMLInputElement} */
    (document.getElementById('autocomplete2')), {
      types: ['geocode']
    });
  autocomplete2.addListener('place_changed', function() {
    fillInAddress(autocomplete2, "2");
  });

}

function fillInAddress(autocomplete, unique) {
  // Get the place details from the autocomplete object.
  var place = autocomplete.getPlace();

  for (var component in componentForm) {
    if (!!document.getElementById(component + unique)) {
      document.getElementById(component + unique).value = '';
      document.getElementById(component + unique).disabled = false;
    }
  }

  // Get each component of the address from the place details
  // and fill the corresponding field on the form.
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType] && document.getElementById(addressType + unique)) {
      var val = place.address_components[i][componentForm[addressType]];
      document.getElementById(addressType + unique).value = val;
            var val4 = document.getElementById('locality'+ unique).value
            
            if(val4=="" || val4==null){
                document.getElementById('locality'+ unique).value = "Barcelona";
            }

    }
  }
}


function geolocate() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var geolocation = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };
      
      var circle = new google.maps.Circle({
        center: geolocation,
        radius: position.coords.accuracy
      });
      autocomplete.setBounds(circle.getBounds());
      autocomplete2.setBounds(circle.getBounds());
    });
  }
}



// ----------------------Registration Validation Start-------------------------------------------------
function validate_user_regis() {
    var fname = $.trim($('#user_first_name').val());
    var lname = $.trim($('#user_last_name').val());
    var email = $.trim($('#user_email').val());
    var pass = $.trim($('#user_password1').val());
    var pass1 = $.trim($('#user_password2').val());
    var uphone = $.trim($('#user_phone').val());

    var uaddress = $.trim($('#autocomplete').val());

    var postal = $.trim($('#postal_code').val());
    // var door = $.trim($('#door_num').val());
    var building = $.trim($('#street_number').val());
    $('#user_phone').removeClass('error');
    $('#user_first_name').removeClass('error');
    $('#user_last_name').removeClass('error');
    $('#user_password1').removeClass('error');
    $('#user_password2').removeClass('error');
    $('#user_email').removeClass('error');
    $('#autocomplete').removeClass('error');
    $('#postal_code').removeClass('error');
    // $('#door_num').removeClass('error');
    $('#street_number').removeClass('error');
    if (fname=='' || fname==null) {

        $('#user_first_name').addClass('error');
        $('#user_first_name').focus();
        return false;
    }
    else if (lname=='' || lname==null) {

        $('#user_last_name').addClass('error');
        $('#user_last_name').focus();
        return false;
    }
    else if(email=='' || email==null){
        $('#user_email').addClass('error');
        $('#user_email').focus();
        return false;
    }
    else if(pass=='' || pass==null){
        $('#user_password1').addClass('error');
        $('#user_password1').focus();
        return false;
    }
    else if(pass1=='' || pass1==null){
        $('#user_password2').addClass('error');
        $('#user_password2').focus();
        return false;
    }
    else if(uphone=='' || uphone==null){

        $('#user_phone').addClass('error');
        $('#user_phone').focus();

        return false;
    }
    else if(uaddress=='' || uaddress==null){
        $('#autocomplete').addClass('error');
        $('#autocomplete').focus();

        return false;
    }
    else if(postal=='' || postal==null){
        $('#postal_code').addClass('error');
        $('#postal_code').focus();
        return false;
    }
    else if(building=='' || building==null){
        $('#street_number').addClass('error');
        $('#street_number').focus();
        return false;
    }
    else{
        $("#user_phone").removeClass("error");
        $("#user_last_name").removeClass("error");
        $("#user_email").removeClass("error");
        $("#user_first_name").removeClass("error");
        // $('#door_num').removeClass('error');
        $('#street_number').removeClass('error');
            var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var name_regex= new RegExp("^[a-zA-Z ]+$");
            var phone_regex = /^[0-9+-]{9,13}$/;
             var password_reegex= /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

            if (!password_reegex.test(pass))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Required atleast one character and one numeric. Minimum length of password is 8.',
                  position: 'top-center',
                  loader: false,
                  hideAfter: 2000,
                  icon: 'error'
                });
                $("#restaurant_password1").addClass("error");
               $('#restaurant_password1').focus();
                return false; 
            }

            if (!email_regex.test(email))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Enter a valid email address.',
                  position: 'top-center',
                  loader: false,
                  hideAfter: 4000,
                  icon: 'error'
                });
                $("#restaurant_email").addClass("error");
               $('#user_email').focus();
                return false; 
            }
            else if (!name_regex.test(fname))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Name only contain letters.',
                  position: 'top-center',
                  loader: false,
                  hideAfter: 4000,
                  icon: 'error'
                });
                $("#user_first_name").addClass("error");
               $('#user_first_name').focus();
                return false;  
            } 
            else if (!name_regex.test(lname))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Name only contain letters.',
                  position: 'top-center',
                  loader: false,
                  hideAfter: 4000,
                  icon: 'error'
                });
                $("#user_last_name").addClass("error");
               $('#user_last_name').focus();
                return false;  
            }
            else if (!phone_regex.test(uphone))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Phone number length is between 9 to 13. Only numerics are allowed.',
                  position: 'top-center',
                  loader: false,
                  hideAfter: 4000,
                  icon: 'error'
                });
                $('#restaurant_owner_phone').addClass("error");
                $('#restaurant_owner_phone').focus();
                return false;

            }
            else if (pass != pass1){
                $('#user_password1').val('');
                $('#user_password2').val('');
                $('#user_password1').addClass('error');
                $('#user_password2').addClass('error');
                $('#user_password1').focus();
                return false;
            }
            else{
                
                return true;
            }   
    }
}

function pmismatch(a){
    var pass="";
    var pass1="";
    if(a=='1')
    {
        pass = $.trim($('#restaurant_password1').val());
        pass1 = $.trim($('#restaurant_password2').val());
    }
    else
    {
        pass = $.trim($('#user_password1').val());
        pass1 = $.trim($('#user_password2').val());
    }
    
    if(pass != pass1){
        if(a=='1')
        {
            $('#restaurant_password1').addClass('error');
            $('#restaurant_password2').addClass('error');
            $('#restaurant_password2').focus();  
        }
        else
        {
            $('#user_password1').addClass('error');
            $('#user_password2').addClass('error');
            $('#user_password2').focus();  
        }
        
    }
    else{
        if(a=='1')
        {
            $('#restaurant_password1').removeClass('error');
            $('#restaurant_password2').removeClass('error'); 
        }
        else
        {
            $('#user_password1').removeClass('error');
            $('#user_password2').removeClass('error'); 
        }
    }
}



function validate_login(){
  
  
   $('#login_email').removeClass('error');
   $('#login_pwd').removeClass('error');
   
  var login_email=$('#login_email').val();
  var login_pwd=$('#login_pwd').val();
  if (login_email=='' || login_email == null)
       { 

          $('#login_email').addClass('error');
          return false;
       }
    else if(login_pwd=='' || login_pwd == null)
       {
          $('#login_pwd').addClass('error');
          return false;
       }
       else{
        return true;
       }
      return false;
}



function check_incr(lunchbox_id,lunchbox_price,counter){

        $.ajax({
            
            type: 'GET',
            url:'/checkoutaction',
            data:{'lunchbox_id':lunchbox_id,'lunchbox_price':lunchbox_price,'lunchbox_action':'add'},
            success: function (response) {
              document.getElementById("check_qty"+counter).value=response.qty;
              document.getElementById("total_amount"+counter).innerHTML=response.price+" €";
              document.getElementById("subtotal").innerHTML=response.sub_total_amount+" €";
              
              $('#qty_discount').html(response.qty_discount+" €");
              $('#vat_tax').html(response.vat+" €");
              $('#promo_code_input').html("");
    
              $('.l_final_amount').val(response.final_amount);
              $('.vat_pay').val(response.vat);
              $('#sub_total_amount').html(response.sub_total_amount+" €");
              $('#after_promo_total').html(response.final_amount+" €");
      }
        });
}
function check_dcr(lunchbox_id,lunchbox_price,counter){
        var min_qty=document.getElementById("check_qty"+counter).value;
        if(min_qty > 1){
            $.ajax({
                
                type: 'GET',
                url:'/checkoutaction',
                data:{'lunchbox_id':lunchbox_id,'lunchbox_price':lunchbox_price,'lunchbox_action':'sub'},
                success: function (response) {
                  document.getElementById("check_qty"+counter).value=response.qty;
                  document.getElementById("total_amount"+counter).innerHTML=response.price+" €";
                  document.getElementById("subtotal").innerHTML=response.sub_total_amount+" €";
                  
                  $('#qty_discount').html(response.qty_discount+" €");
                  $('#vat_tax').html(response.vat+" €");
                  $('#promo_code_input').html("");
        
                  $('.l_final_amount').val(response.final_amount);
                  $('.vat_pay').val(response.vat);
                  $('#sub_total_amount').html(response.sub_total_amount+" €");
                  $('#after_promo_total').html(response.final_amount+" €");
                }
            });
          }
}


$(".promo_code_button").on("click", function() {
            var e = document.getElementById("promo_code_input");
            code = $(e).val();  
            token = $("input[name='csrfmiddlewaretoken']").val();
            if(code=="" || code==null){
              $('#promo_code_input').addClass('error');
            }
            else{
              $('#promo_code_input').removeClass('error');
              $.ajax({

                      url: url_apply_token,
                      type: 'POST',
                      data: {
                          'code': code,'csrfmiddlewaretoken': token
                      },
                      success: function (response) {
                          if(response.status=='success'){
                            document.getElementById("invalid_promo").innerHTML=""; 
                            document.getElementById("promo_discount").innerHTML=response.discount+" €";
                            document.getElementById("after_promo_total").innerHTML=response.total+" €";
                            $('.l_final_amount').val(response.total);
                            $('.vat_pay').val(response.vat);
                            $('.pl_code').val(code);
                          }
                          else{
                          msg=response.msg
                            document.getElementById("invalid_promo").innerHTML='<font color="red">'+msg+'</font>';   
                          }
                        }
                    });
            }
                    
  })


/*----------------------------remove cart item--------------------------------------------------------------------------*/

function removecart(lunchboxid){
  
     $.ajax({
            
            type: 'POST',
            url:remove_cart_items,
            data: {'lunchbox_id':lunchboxid,'csrfmiddlewaretoken': token},
            success: function (response) {
              if(response.length){
                  var sub_total=0.0,count=1,vat=0.0,qty_discount=0.0,total=0.0,total_vat=0.0
                  var html_data,html_data2,html_data3,html_data4,html_data5;
                  var var1,var2,var3,var4,var5,var6;
                  var checkout_data='';
                  var main_data='<div class="add_products" style="display: none;"> Your cart contains no products. Add some <a href="\\all">HERE</a> </div>';
                  for (var i=0;i<response.length;i++)
                  {
                    /*---------------------------------cart----------------------------------------------*/
                    count=i+1
                    if(response[i].lunchbox_image==false){
                      html_data1='<li><a class="preview-image" href="#" title=""><img src="static/mainapp/img/lunchbox_chicken_1.png" class="preview"></a>';
                    }
                    else{
                      html_data1='<li><a class="preview-image" href="#" title=""><img src="'+response[i].lunchbox_image+'" class="preview"></a>';
                    }
                    
                    html_data2='<div class="description"><div class="price-quantity"><span class="quantity-formated"><span class="quantity">'+count+'</span></span></div>';
                    html_data3='<a href="#" title="Ají de pollo con arroz ">'+response[i].lunchbox_name+'</a>';
                    html_data4='<div class="price-quantity"> <span class="lc_price"> € '+response[i].total+' </span></div>';
                    html_data5='</div><span class="remove_link"><a href="javascript:removecart('+response[i].lunchbox_id+')" class="remove_prodect"> </a></span></li>';
                    main_data+=html_data1+html_data2+html_data3+html_data4+html_data5;
                    /*------------------------------checkout---------------------------------------------------------*/

                    var1='<li class="pull-left full-width"><div class="purchase_summery_checkout_image"><a href="/open/box/'+response[i].lunchbox_id+'"> <img src="'+response[i].lunchbox_image+'" alt=""> </a></div>';
                    var2='<div class="purchase_summery_checkout_data"><div class="purchase_summery_checkout_name"><p class="purchase_summery_checkout_product-name"><a href="/open/box/'+response[i].lunchbox_id+'"> '+response[i].lunchbox_name+' </a></p></div>';
                    var3='<div class="purchase_summery_checkout_product_unit"><div class="purchase_summery_checkout_price"> <span class="price"> € '+response[i].lunchbox_price+' </span></div></div>'
                    var4='<div class="purchase_summery_checkout_product_delete"><a class="cart_quantity_delete" href="javascript:removecart('+response[i].lunchbox_id+')"></a></div>'
                    var5='<div class="purchase_summery_checkout_product_quantity"><div  class="purchase_summery_checkout_cart_quantity_button"> <a  class="purchase_summery_checkout_cart_quantity_down"  href="javascript:check_dcr('+response[i].lunchbox_id+','+response[i].lunchbox_price+','+count+')" title="Subtract">-</a> <input size="2" autocomplete="off" class="purchase_summery_checkout_cart_quantity_input" value="'+response[i].qty+'" min="1" name="" type="text" id="check_qty'+count+'" disabled><a class="purchase_summery_checkout_cart_quantity_up" href="javascript:check_incr('+response[i].lunchbox_id+','+response[i].lunchbox_price+','+count+')" title="Add">+</a></div></div><div class="purchase_summery_checkout_product_price">' 
                    var6='<span class="purchase_summery_checkout_total_price" id="total_amount'+count+'"> '+response[i].total+' € </span></div></div></li>'
                    checkout_data +=var1+var2+var3+var4+var5+var6;
                    checkout_data +=var1+var2+var3+var4+var5+var6;
                      sub_total= parseFloat(sub_total)+parseFloat(response[i].total_amount);
                      total= parseFloat(total)+parseFloat(response[i].total);
                      total_vat= parseFloat(total_vat)+parseFloat(response[i].vat);
                      qty_discount = parseFloat(qty_discount)+parseFloat(response[i].qty_discount);
                  }
                  total = Math.round(total * 100) / 100;
                    total_vat = Math.round(total_vat * 100) / 100;
                    qty_discount = Math.round(qty_discount * 100) / 100;
                    $('#cart_list').html(main_data);
                    $('#checkout_lunchboxes').html(checkout_data);
                    $('#subtotal').html(total+" €");
                    $('.cart_quientity').html(response.length);
                    $('#qty_discount').html(qty_discount+" €");
                    $('#vat_tax').html(total_vat+" €");
                    $('#sub_total_amount').html(total+" €");
                    $('#promo_code_input').html("");
                    var final_amount = sub_total+total_vat;
                    final_amount = Math.round(final_amount * 100) / 100;
                    $('#after_promo_total').html(final_amount+" €");
                    $('.l_final_amount').val(final_amount);
                    $('.vat_pay').val(response.total_vat);
              }
              else{
                
                    $('#vat_tax').html("0 €");
                    $('#qty_discount').html("0 €");
                    $('#empty_cart_list').css('display','block');
                    $('#subtotal').html("0 €");
                    $('.cart_quientity').html("0");

                    $('#sub_total_amount').html("0 €");
                    $('#after_promo_total').html("0 €");
                    $('#promo_code_input').html("");
                    $('.l_final_amount').val("0");
                    $('#cart_list').html('<div class="add_products" style="display: block;"> Your cart contains no products. Add some <a href="\\all">HERE</a> </div>');
                    $('#checkout_lunchboxes').html('<li class="pull-left full-width">Nothing in Your Cart</li>');
                    $("#hide_delivery").html("");

              }
              $.toast({
                  heading: 'Cart Items',
                  text: 'Item is succesfully removed from cart.',
                  position: {right: 10,top:80},
                  loader: false,
                  hideAfter: 2000,
              });
            }
        });
  }



/*----------------------checkout validation------------------------------*/
function complete_purchase(value){
  if(1){
    $('#user_first_name').addClass('error');
    $('#user_first_name').focus();
    return false;
  }
  else{
    $.toast({
            heading: 'Items In Cart',
            text: 'Your cart is empty.',
            position: {right: 10,top:80},
            loader: false,
            hideAfter: 2000,
            icon: 'warning'
        });
    return false;
  }
}
/*---------------------------------Model Popup-------------------------------------*/
/*-----------------------------------wallet payment--------------------------------*/
function wallet_payment(){
    var delivery_date = $('#ddate').val();
    var delivery_time = $('#select_dtime').val();
    var total_amount = $('.l_final_amount').val();
    var vat_pay = $('.vat_pay').val();
    if(total_amount == "" || total_amount == null || total_amount == "0"){
        $.toast({
          heading: 'Error',
          text: 'Your cart is Empty.',
          position: 'top-center',
          loader: false,
          hideAfter: 2000,
          icon: 'error'
      });
    }
    else{
      amount = $('#credit_amount').val();

      if(amount == "" || amount == null)
      {
        $.toast({
            heading: 'Error',
            text: 'You don\'t have enough credit in your wallet. Please recharge your wallet or use another paymenet method.',
            position: 'top-center',
            loader: false,
            hideAfter: 4000,
            icon: 'Error'
        });
      }
      else{
          if(amount == "0" || amount == "0.0")
          {
            $.toast({
                heading: 'Error',
                text: 'You don\'t have enough credit in your wallet. Please recharge your wallet or use another paymenet method.',
                position: 'top-center',
                loader: false,
                hideAfter: 4000,
                icon: 'Error'
            });
          }
          else{
                var orders = $('#checkout_orders').val();
                var total_amount = $('#l_final_amount').val();
                var code = $('#promo_code_input').val();
                $.ajax({
                  type: 'POST',
                  url:  pay_credit,
                  data: {'vat':vat_pay,'orders': orders,'total_amount':total_amount,'code':code,'delivery_date':delivery_date,'delivery_time':delivery_time,'csrfmiddlewaretoken':token},
                  success: function (response) {
                
                    if(response.status == 'paid'){
                      var url="/wallet/payment/confirmation/"+response.order_id+"/";
                      window.location.href=url;
                    }
                    else if (response.status == 'unpaid') {
                      $('.incomplete_payment_method').html(response.msg);
                      $('#incomplete_payment').modal('show');
                      $('.order_id_wallet').val(response.order_id);
                      $('.remaining_order').val(response.remain);

                    }
                    else{
                       $.toast({
                          heading: 'Error',
                          text: response.msg,
                          position: 'top-center',
                          loader: false,
                          hideAfter: 4000,
                          icon: 'error'
                      });
                       // alert(response.error_msg);
                    }

                  }
              });
          }
      }
    }
     
    
}


function arrayData(){
  var comment = document.getElementById("checkout_comment").value;
              var total_amount = $('.l_final_amount').val();
              var delivery_date = $('#ddate').val();
              var delivery_time = $('#select_dtime').val();
              

              if(total_amount == "" || total_amount == null || total_amount == "0"){
                  $.toast({
                    heading: 'Error',
                    text: 'Your cart is Empty.',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else if(delivery_date == "" || delivery_date == null){
                $.toast({
                    heading: 'Error',
                    text: 'Please select delivery date',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else if(delivery_time == "0" || delivery_time == null){
                $.toast({
                    heading: 'Error',
                    text: 'Please select delivery time',
                    position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                });
              }
              else{
              $.ajax({

                    url: checkout_data,
                    type: 'POST',
                    data: {
                        'delivery_time':delivery_time,'delivery_date':delivery_date,'comment':comment,'csrfmiddlewaretoken': token
                    },
                    success: function (response) {
                      var size = response.length;
                          // alert(size);
                          if(response[size-1].status=='closed'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                            });
                          }
                          else if(response[size-1].status=='timeup'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                            });
                          }
                           else if(response[size-1].status=='unautorized'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                                loader: false,
                                hideAfter: 4000,
                                icon: 'error'
                                      });
                          }
                          else if(response[size-1].status=='incomplete'){
                            $.toast({
                                text: response[size-1].msg,
                                position: 'top-right',
                                loader: false,
                                hideAfter: 4000,
                                icon: 'error'
                                      });
                          }
                          else{
                            delete response[size-1];
                            response.splice(size-1,1);
                            var arrayData = JSON.stringify(response);
                            // alert(arrayData);
                            $('.checkout_orders').val(arrayData);
                            wallet_payment();
                          }
                        
                      }
                  });
  }
}

$('.icomplete_paymentok').on('click',function(){
  $('.module_type').val('3');
  $('#incomplete_payment').modal('hide');
  $('#paymentModal').modal('show');
})



$("body").click(function(event){
  var elmnt = $(event.target).attr("class");
  if(elmnt != 'search_div_1' && $("#search_div").css('display')=='block'){
    $("#search_div").css('display','none');
  }
  if(elmnt == 'fa fa-search' && $("#search_div").css('display')=='block')
  {
    $("#search_div").css('display','none');
  }
  else if(elmnt == 'fa fa-search' && $("#search_div").css('display')=='none')
  {
    $("#search_div").css('display','block');
  }
});

$(document).ready(function(){
  var msg=$('#msg').html();
  
  if(msg!=null && msg != "" && typeof  msg != "undefined"){
      $.toast({
          text: msg,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }

    var contactsucc=$('#contactsucc').html();
  
  if(contactsucc!=null && contactsucc != "" && typeof  contactsucc != "undefined"){
      $.toast({
          text: contactsucc,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'success'
        });
  }



  var contact_error=$('#contact_error').html();
  
  if(contact_error!=null && contact_error != "" && typeof  contact_error != "undefined"){
      $.toast({
          text: contact_error,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }

 var cancelorder=$('#cancelorder').html();
  
  if(cancelorder!=null && cancelorder != "" && typeof cancelorder != "undefined"){
      $.toast({
          text: cancelorder,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }
var unavailablepayment=$('#unavailablepayment').html();
  
  if(unavailablepayment!=null && unavailablepayment != "" && typeof unavailablepayment != "undefined"){
      $.toast({
          text: unavailablepayment,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }







});

$(document).ready(function () {
    target_offset = $('#main_page_section').offset();
    if(typeof target_offset != 'undefined'){
      target_top = target_offset.top;
      $('html, body').animate({
          scrollTop: target_top
      });
    }
    
});


$('.send_invite').click(function(){
  var email=$.trim($('#email').val());
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if (email != "" && email != null && email !='undefined' && email_regex.test(email)) {
    $.ajax({

        url: invite_address,
        type: 'POST',
        data: {
          'email':email,
            'csrfmiddlewaretoken': token
        },
        success: function(response) {
          // alert(response);
          //  alert(JSON.stringify(response));
            if(response.status=='success'){
              $.toast({
                text: response.msg,
                position: 'top-right',
                loader: false,
                hideAfter: 5000,
                icon: 'success'
              });
              $('#email').val("");
            }
            else{
              $.toast({
                  text: response.msg,
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
            }
          },

      });
  }
  else{
    $.toast({
          text: "Please enter a valid email address first.",
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
  }
});

function editprofile(current_elmnt){
  var phone_div=$('#phone'),
  edit_button_div=$("#hide_button");
  $("#my_edit_profile_form input").removeAttr('disabled');
  $('#my_edit_profile_form input').each(function(){
      var a=$(this).val();
      if(a==null || a=="None"){
        $(this).val("");
      }
  });
  $('#show_door').css('display','block');
  $('#show_city').css('display','block');
  $('#show_building').css('display','block');
  $('#show_street').css('display','block');
  $('#show_zip').css('display','block');
  // $(phone_div).attr('class','form-group col-sm-6 edited-field-right');
  $('#save_profile_button').css('display','block');
  $('#save_profile_button').removeClass('disabled_save_edit');

  $(edit_button_div).hide();
}

$('#save_user_edit_details').click(function(){
  $("#my_edit_profile_form input").removeClass('error');
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  var name_regex= new RegExp("^[a-zA-Z ]+$");
  var phone_regex = /^[0-9+-]{9,13}$/;
  var len = $('#my_edit_profile_form input').length;
  // alert("length "+len);
  $('#my_edit_profile_form input').each(function(index){
      var a=$.trim($(this).val());
      var input_type=$(this).attr("type");
      var input_name=$(this).attr("name");
      if(a==null || a=="" && $(this).attr("name") != "door_num"){
        $(this).addClass('error');
        $(this).focus();
        return false;
      }
      else if(input_type=="name" && !name_regex.test(a)){
        $.toast({
                heading: 'Edit Profile',
                text: 'Name only contains letters',
                position: 'top-right',
                loader: false,
                hideAfter: 4000,
                icon: 'error'
            })
        $(this).addClass('error');
        $(this).focus();
        
      return false;
      }
      else if(input_name=="city" && !name_regex.test(a)){
         $.toast({
                heading: 'Edit Profile',
                text: 'City only contains letters',
                position: 'top-right',
                loader: false,
                hideAfter: 4000,
                icon: 'error'
            })
        $(this).addClass('error');
        $(this).focus();

      return false;
      }
      else if(input_name=="state" && !name_regex.test(a)){
        $.toast({
                heading: 'Edit Profile',
                text: 'State only contains letters',
                position: 'top-right',
                loader: false,
                hideAfter: 4000,
                icon: 'error'
            })
        $(this).addClass('error');
        $(this).focus();
        
      return false;
      }
      else if(input_type=="email" && !email_regex.test(a)){
        $.toast({
                heading: 'Edit Profile',
                text: 'Enter a valid email address.',
                position: 'top-right',
                loader: false,
                hideAfter: 4000,
                icon: 'error'
            })
        $(this).addClass('error');
        $(this).focus();
        
      return false;
      }
      else if(input_name=="phone" && !phone_regex.test(a)){
        $.toast({
              heading: 'Edit Profile',
              text: 'Phone number length is between 9 to 13. Only numerics are allowed.',
              position: 'top-right',
              loader: false,
              hideAfter: 4000,
              icon: 'error'
            });

        $(this).addClass('error');
        $(this).focus();
                  return false;
      }
      else if(index==len-1){
        // alert("reach");
        $("#my_edit_profile_form").submit();
      }
      else{}
        // alert("index "+index);
  });
});

$(document).ready(function(){
  var msg=$('#success_edit').html();
  if(msg!=null && msg != "" && msg != "undefined"){
      $.toast({
          text: msg,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'success'
        });
  }
});


 function userordermail() {

        $.ajax({
            url: '/mailuserorderdetail/',
            type: "GET",
            success: function(response) {
              $.toast({
              text: 'Mail is successfully send to your account.',
              position: 'top-right',
              loader: false,
              hideAfter: 4000,
              icon: 'success'
            });
              //$('.admin_order_list_outer').html(response);
            }
        });

  }

 $('#send_credit').click(function(){
    var a = $('#share_amount').val(),
        e = $('#share_email').val();
    var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var amount_regex = /^\d+(\.\d{1,2})?$/;
        $('#share_amount').removeClass('error');
        $('#share_email').removeClass('error');
        if(a==null || a==""){
          $('#share_amount').addClass('error');
          $('#share_amount').focus();
          return false;
        }
        else if(a==null || a==""){
          $('#share_amount').addClass('error');
          $('#share_email').focus();
          return false;
        }
        else if(!amount_regex.test(a)){
          $.toast({
              heading: 'Send Money',
              text: 'Please enter a valid amount.',
              position: 'top-right',
              loader: false,
              hideAfter: 4000,
              icon: 'error'
            });
          $('#share_amount').focus();
          return false;
        }
        else if(!email_regex.test(e)){
          $.toast({
              heading: 'Send Money',
              text: 'Please enter valid email address.',
              position: 'top-right',
              loader: false,
              hideAfter: 4000,
              icon: 'error'
            });
          $('#share_email').focus();
          return false;
        }
        else{
          $.ajax({
              url: wallet_share,
              type: "POST",
              data: {'amount':a,'email':e,'csrfmiddlewaretoken':token},
              success: function(response) {
                // alert(response);
                //$('.admin_order_list_outer').html(response);
                if(response.status=='success'){
                  $('.Wallet_current_credits_points').html(response.remains);
                  $('#share_amount').val(''),
                  $('#share_email').val('');
                    $.toast({
                      heading: 'Send Money',
                      text: response.msg,
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'success'
                    });
                }
                else{
                  $('#share_amount').val(''),
                  $('#share_email').val('');
                  $.toast({
                    heading: 'Send Money',
                    text: response.msg,
                    position: 'top-right',
                    loader: false,
                    hideAfter: 4000,
                    icon: 'error'
                  });
                  
                }
              }
          });

        }

        

  });


 $("#res_review_send").click(function() {
            var e = $(this).parent().parent().children().children(),
                a = $(this).parent().children(".msg"),
                s = $(this).parent().parent().children('.reviews-added'),
                i = $(this).parent().parent().attr("data-res"),
                o = $(this).parent(),
                v =  $(this).parent().children(".msg").val();
                // alert(e);
            if(v != null || v != "" || i != null || i != ""){
            $.ajax({
                url: leave_review,
                type: "POST",
                data: {
                    'res': i,
                    'msg': v,
                    'csrfmiddlewaretoken':token
                },
                success: function(t) {
                  // alert(JSON.stringify(t));
                  if (t.msg=='Success!') {
                    if($(e).attr("class")=="no_review_msg"){
                      var append_list = '<ul class="reviews-container"><li><a class="profile-img" href="#"><span><img src="'+t.src+'" alt="profile-img"></span></a><span class="dated">'+t.date+'</span><h5>'+t.user+'</h5><p>'+v+'</p></li></ul>';
                      $(s).html(append_list);
                    }
                    else{
                      var append_list = '<li><a class="profile-img" href="#"><span><img src="'+t.src+'" alt="profile-img"></span></a><span class="dated">'+t.date+'</span><h5>'+t.user+'</h5><p>'+v+'</p></li>';
                      $(e).append(append_list);
                    }
                      
                    $(s).animate({
                      scrollTop: $(s)[0].scrollHeight
                    });
                    a.val("");
                    $('.review_comment_box').css('display','none');
                  }
                  else{
                    $.toast({
                    heading: 'Failure',
                    text: t.msg,
                    position: 'top-right',
                    loader: false,
                    hideAfter: 4000,
                    icon: 'error'
                    });
                  }
                }
            });
          }
        });



$("#lunchbox_send_review").click(function() {
            var h = $(this).parent().parent().children().children(".reviews-added"),
                u = $(this).parent().parent().children().children().children(),
                v = $(this).parent().children(".msg").val(),

                s = $(this).parent().parent().attr("data-lb"),
                thh = $(this).parent().children(".msg"),
                i = $(this).parent().parent().attr("data-res");
            if(v != null || v != "" || s != null || s != "" || i != null || i != ""){
            $.ajax({
                url: ask_restaurant,
                type: "POST",
                data: {
                    'lb': s,
                    'res': i,
                    'msg': v,
                    'csrfmiddlewaretoken':token
                },
                success: function(t) {
                  if(t.msg=="Success"){
                    if($(u).attr("class")=="no_review_msg"){
                      $(u).css('display','none');
                      var append_list = '<ul class="reviews-container"><li><a class="profile-img" href="#"><span><img src="'+t.src+'" alt="profile-img"></span></a><span class="dated">'+t.date+'</span><h5>'+t.user+'</h5><p>'+v+'</p></li></ul>';
                      $(h).html(append_list);
                    }
                    else{
                      var append_list = '<li><a class="profile-img" href="#"><span><img src="'+t.src+'" alt="profile-img"></span></a><span class="dated">'+t.date+'</span><h5>'+t.user+'</h5><p>'+v+'</p></li>';
                      $(u).append(append_list);
                    }
                      
                    $(h).animate({
                      scrollTop: $(h)[0].scrollHeight
                    });
                    thh.val("");
                  }
                  else{
                    $.toast({
                    heading: 'Failure',
                    text: t.msg,
                    position: 'top-right',
                    loader: false,
                    hideAfter: 4000,
                    icon: 'error'
                    });
                  }
                }
            });
          }
        });



$(".request_lunchbox_again").click(function(e) {
            e.preventDefault();
            var a = parseInt($(this).attr("data-lb")),
                s = $(this).parent().parent().parent().children(".request_qty").children(".request_qty_num");
            $.ajax({
                url: request_lunchbox,
                type: "POST",
                data: {
                    'lb': a,
                    'csrfmiddlewaretoken':token
                },
                success: function(e) {
                    if ("success" === e.msg) {
                        var t = e.data.requests;
                        s.text(t)
                    }
                    else{
                      $.toast({
                      heading: 'Failure',
                      text: e.msg,
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                      });
                    }
                }
            })
        })

function validateRecoveryForm(){

  var email=$('.recovery_email').val();
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if(email == "" || email==null || !email_regex.test(email))
  {

     $.toast({
          text: 'Please enter a valid email address',
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
     return false;
  }
  else{

    return true;
  }
}
$('.share-lunch').click(function(){
  var credits=$('.share').val();
  var email=$('.email').val();
  $('.email').removeClass("error");
  $('.share').removeClass("error");
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  var num_regex = /(\d+(\.\d+)?)/;
  if(credits=="" || credits==null){
    credits=0;
  }
  if(credits!="" && credits!=null && credits!=0){
    if(!num_regex.test(credits)){
      $.toast({
            text: 'Please enter a valid credit amount.',
            position: 'top-right',
            loader: false,
            hideAfter: 5000,
            icon: 'error'
          });
      $('.share').addClass("error");
      return false;
    }
}
  if(email=="" || email==null  || !email_regex.test(email)){
    $.toast({
          text: 'Please enter a valid email address',
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
$('.email').addClass("error");
    return false;
  }
  else{

    $.ajax({
          url: share_lunchbox,
          type: "POST",
          data: {
            'credits':credits,
            'email':email,
            'csrfmiddlewaretoken':token
          },
          success: function(response) {

               if(response.status=="success"){

                  $.toast({

                      text: response.msg,
                      position: 'top-right',
                      loader: false,
                      hideAfter: 5000,
                      icon: 'success'
                    });
                  $('.share').val("");
                  $('.email').val("");
                  $('#cart_list').html('<div class="add_products" style="display: block;"> Your cart contains no products. Add some <a href="\\all">HERE</a> </div>');
                    $('.cart_quientity').html("0");
                    $('#subtotal').html("0");
               }
               else{

                $.toast({
                      text: response.msg,
                      position: 'top-right',
                      loader: false,
                      hideAfter: 5000,
                      icon: 'warning'
                    });
               }
          }
      });
  }
});

$('.accept_sharing button').click(function(){
  var shar_id=$(this).parent().attr('data-id');
  $.ajax({
            url: accept_sharing,
            type: "POST",
            data:{
              'id':shar_id,
              'csrfmiddlewaretoken':token
            },
            success: function(response) {

              location.reload();
              //$('.admin_order_list_outer').html(response);
            }
        });

});

$('.archive_noti button').click(function(){
  var shar_id=$(this).parent().attr('data-id');
var elmnt=$(this).parent().parent();
  $.ajax({
            url: archieve_usernotification,
            type: "POST",
            data:{
              'id':shar_id,
              'csrfmiddlewaretoken':token
            },
            success: function(response) {
              if(response.status=="success"){
                
                $(elmnt).slideUp()
                $('.user_notify_num').html(response.notify_qty);
              }
              //$('.admin_order_list_outer').html(response);
            }
        });

});

function showeditform(){
  $('#edit_checkout_link').css('display','none');
  $('#user_first_name').css('display','block');
  $('#user_first_name').siblings('label').css('display','none')
  $('#last_name_div').css('display','block');
  $('#user_email2').css('display','block');
  $('#user_email2').siblings('label').css('display','none');
  $('#user_phone2').css('display','block');
  $('#user_phone2').siblings('label').css('display','none');
  $('#autocomplete2').css('display','block');
  $('#autocomplete2').siblings('label').css('display','none');
  $('#door_num2').css('display','block');
  $('#door_num2').siblings('label').css('display','none');
  $('#street_number2').css('display','block');
  $('#street_number2').siblings('label').css('display','none');
  $('#locality2').css('display','block');
  $('#locality2').siblings('label').css('display','none');
  $('#postal_code2').css('display','block');
  $('#postal_code2').siblings('label').css('display','none');
  $('#save_profile_button').css('display','block');
  $('#administrative_area_level_12').css('display','block');
  $('#administrative_area_level_12').siblings('label').css('display','none');
  
}
$('#checkout_edit_save_button').click(function(){
  var email=$.trim($('#user_email2').val());
  var phone=$.trim($('#user_phone2').val());
  var address=$.trim($('#autocomplete2').val());
  var door=$.trim($('#door_num2').val());
  var building=$.trim($('#street_number2').val());
  var city=$.trim($('#locality2').val());
  var pcode=$.trim($('#postal_code2').val());
  $('#user_email2').removeClass('error');
  $('#user_phone2').removeClass('error');
  $('#autocomplete2').removeClass('error');
  $('#door_num2').removeClass('error');
  $('#street_number2').removeClass('error');
  $('#locality2').removeClass('error');
  $('#postal_code2').removeClass('error');
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if(email=="" || email==null  || !email_regex.test(email)){
    $('#user_email2').addClass('error');
    $('#user_email2').focus();
    return false;
  }
  else if(phone=="" || phone==null){
    $('#user_phone2').addClass('error');
    $('#user_phone2').focus();
    return false;
  }
  else if(address=="" || address==null){
    $('#autocomplete2').addClass('error');
    $('#autocomplete2').focus();
    return false;
  }

  else if(building=="" || building==null){
    $('#street_number2').addClass('error');
    $('#street_number2').focus();
    return false;
  }

  else if(city=="" || city==null){
    $('#locality2').addClass('error');
    $('#locality2').focus();
    return false;
  }
  else if(pcode=="" || pcode==null){
    $('#postal_code2').addClass('error');
    $('#postal_code2').focus();
    return false;
  }
  else{
    $("#my_edit_profile_form").submit();
  }
  return false;
});

