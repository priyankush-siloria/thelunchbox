// ----------------------Registration Validation Start-------------------------------------------------
function validate_res_regis() {
    var fname = $.trim($('#restaurant_first_name').val());

    var lname = $.trim($('#restaurant_last_name').val());
    var email = $.trim($('#restaurant_email').val());
    var pass = $.trim($('#restaurant_password1').val());
    var pass1 = $.trim($('#restaurant_password2').val());
    
    var ophone = $.trim($('#restaurant_owner_phone').val());
    var rname = $.trim($('#restaurant_name').val());
    var raddress = $.trim($('#autocomplete').val());
    var rphone = $.trim($('#restaurant_phone').val());
    var postal = $.trim($('#postal_code').val());

    $('#restaurant_phone').removeClass('error');
    $('#restaurant_owner_phone').removeClass('error');
    $('#restaurant_first_name').removeClass('error');
    $('#restaurant_last_name').removeClass('error');
    $('#restaurant_password1').removeClass('error');
    $('#restaurant_password2').removeClass('error');
    $('#restaurant_email').removeClass('error');
    $('#restaurant_name').removeClass('error');
    $('#autocomplete').removeClass('error');
    $('#postal_code').removeClass('error');
    if (fname=='' || fname==null) {

        $('#restaurant_first_name').addClass('error');
        $('#restaurant_first_name').focus();
        return false;
    }
    else if (lname=='' || lname==null) {

        $('#restaurant_last_name').addClass('error');
        $('#restaurant_last_name').focus();

        return false;
    }
    else if(email=='' || email==null){
        $('#restaurant_email').addClass('error');
        $('#restaurant_email').focus();

        return false;
    }
    else if(pass=='' || pass==null){
        $('#restaurant_password1').addClass('error');
        $('#restaurant_password1').focus();

        return false;
    }
    else if(pass1=='' || pass1==null){
        $('#restaurant_password2').addClass('error');
        $('#restaurant_password2').focus();

        return false;
    }
    else if(ophone=='' || ophone==null){

        $('#restaurant_owner_phone').addClass('error');
        $('#restaurant_owner_phone').focus();

        return false;
    }
    else if(rname=='' || rname==null){
        $('#restaurant_name').addClass('error');
        $('#restaurant_name').focus();

        return false;
    }
    else if(raddress=='' || raddress==null){
        $('#autocomplete').addClass('error');
        $('#autocomplete').focus();


        return false;
    }
    else if(postal=='' || postal==null){
        $('#postal_code').addClass('error');
        $('#postal_code').focus();

        return false;
    }
    else if(rphone=='' || rphone==null){
        $('#restaurant_phone').addClass('error');
        $('#restaurant_phone').focus();

        return false;
    }
    else{
            $('#restaurant_phone').removeClass("error");
            $('#restaurant_owner_phone').removeClass("error");
            $('#restaurant_phone').focus();
            $("#restaurant_last_name").removeClass("error");
            $("#restaurant_email").removeClass("error");
            $("#restaurant_first_name").removeClass("error");
            var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var name_regex= new RegExp("^[a-zA-Z]+$");
            var phone_regex = /^[0-9+-]{9,13}$/;
            var password_reegex= /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

            if (!password_reegex.test(pass))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Required atleast one character and one numeric. Minimum length of password is 8.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
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
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $("#restaurant_email").addClass("error");
               $('#restaurant_email').focus();
                return false; 
            }
            else if (!name_regex.test(fname))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Name only contain letters.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $("#restaurant_first_name").addClass("error");
               $('#restaurant_first_name').focus();
                return false;  
            } 
            else if (!name_regex.test(lname))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Name only contain letters.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $("#restaurant_last_name").addClass("error");
               $('#restaurant_last_name').focus();
                return false;  
            }
            else if (!phone_regex.test(ophone))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Phone number length is between 9 to 13. Only numerics are allowed.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $('#restaurant_owner_phone').addClass("error");
                $('#restaurant_owner_phone').focus();
                return false;

            }
            else if (!phone_regex.test(rphone))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Phone number length is between 9 to 13. Only numerics are allowed.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $('#restaurant_phone').addClass("error");
                $('#restaurant_phone').focus();
 
                return false;

            }
            else if (pass != pass1){
                
                
                $('#restaurant_password1').val("");
                $('#restaurant_password2').val("");
                $('#restaurant_password1').addClass('error');
                $('#restaurant_password2').addClass('error');
                $('#restaurant_password1').focus();
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
        }
        else
        {
            $('#user_password1').addClass('error');
            $('#user_password2').addClass('error');
        }
        
    }
    else{
        if(a=='1' && pass != "" && pass1 != "" )
        {
            $('#restaurant_password1').removeClass('error');
            $('#restaurant_password2').removeClass('error'); 
        }
        else if(a=='2' && pass != "" && pass1 != "" )
        {
            $('#user_password1').removeClass('error');
            $('#user_password2').removeClass('error'); 
        }
        else{}
    }
}



function validate_user_regis() {

    var fname = $.trim($('#user_first_name').val());
    var lname = $.trim($('#user_last_name').val());
    var email = $.trim($('#user_email').val());
    var pass = $.trim($('#user_password1').val());
    var pass1 = $.trim($('#user_password2').val());
    var uphone = $.trim($('#user_phone').val());

    var uaddress = $.trim($('#autocomplete2').val());

    var postal = $.trim($('#postal_code2').val());
    var building = $.trim($('#street_number2').val());

    $('#user_phone').removeClass('error');
    $('#user_first_name').removeClass('error');
    $('#user_last_name').removeClass('error');
    $('#user_password1').removeClass('error');
    $('#user_password2').removeClass('error');
    $('#user_email').removeClass('error');
    $('#autocomplete2').removeClass('error');
    $('#postal_code2').removeClass('error');
    $('#street_number2').removeClass('error');
    
    if (fname=='' || fname==null) {

        $('#user_first_name').addClass('error');
        $('#user_first_name').focus();
        return false;
    }
    else if (lname=='' || lname==null) {
        // alert("df");
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
        $('#autocomplete2').addClass('error');
        $('#autocomplete2').focus();

        return false;
    }
    else if(postal=='' || postal==null){
        $('#postal_code2').addClass('error');
        $('#postal_code2').focus();
        return false;
    }

    else if(building=='' || building==null){
        $('#street_number2').addClass('error');
        $('#street_number2').focus();
        return false;
    }
    else{
        $("#user_phone").removeClass("error");
        $("#user_last_name").removeClass("error");
        $("#user_email").removeClass("error");
        $("#user_first_name").removeClass("error");
        $('#street_number2').removeClass('error');
            var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            var name_regex= new RegExp("^[a-zA-Z]+$");
            var phone_regex = /^[0-9+-]{9,13}$/;
             var password_reegex= /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

            if (!password_reegex.test(pass))
            {
                $.toast({
                  heading: 'Registration',
                  text: 'Required atleast one character and one numeric. Minimum length of password is 8.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
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
                  text: 'Enter a valid email.',
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
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
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
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
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
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
                  position: 'top-right',
                  loader: false,
                  hideAfter: 5000,
                  icon: 'error'
                });
                $('#restaurant_owner_phone').addClass("error");
                $('#restaurant_owner_phone').focus();
                return false;

            }
            else if (pass != pass1){

              
                $('#user_password1').val("");
                $('#user_password2').val("");
                $('#user_password2').addClass('error');
              $('#user_password1').addClass('error');
                $('#user_password1').focus();
                return false;
            }
            else{
                
                return true;
            }   

            return false;
    }

    return false;
}
// ----------------------Registration Validation End-------------------------------------------------

//-----------------------------Map API Ends------------------------------------------------------------
$(document).ready(function(){
  var msg=$('#msg').html();
  if(msg!=null && msg != "" && typeof msg != "undefined"){
      $.toast({
          text: msg,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
      window.location('/login')
  }
});


//----------------------------------------------------------------


// ----------------------Google Maps API Start-------------------------------------------------

var placeSearch, autocomplete, autocomplete2;
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
  var invalid_city=0;
  for (var i = 0; i < place.address_components.length; i++) {
    var addressType = place.address_components[i].types[0];
    if (componentForm[addressType] && document.getElementById(addressType + unique)) {
      var val = place.address_components[i][componentForm[addressType]];
      var elemnt=addressType + unique;
      if(elemnt=="locality" && val!="Barcelona")
      {
        invalid_city=1;
        break;
      }
      document.getElementById(addressType + unique).value = val;

    }
  }
  if(invalid_city==1){
      for (var i = 0; i < place.address_components.length; i++) {
      var addressType = place.address_components[i].types[0];
      if (componentForm[addressType] && document.getElementById(addressType + unique)) {

        document.getElementById("autocomplete").value = "";
        document.getElementById(addressType + unique).value = "";
        
      }
    }
    $.toast({
          text: "Please select Barcelona only.",
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'error'
        });
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
    });
  }
}
