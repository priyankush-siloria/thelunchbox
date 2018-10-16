$(document).on('click', '#mail_submit', function(){
  $('.start_date').removeClass('error');
  $('.end_date').removeClass('error');
  $('.mail_date').removeClass('error');





 start_date=$('.start_date').val();
 end_date=$('.end_date').val();
 mail_date=$('.mail_date').val();

 if (start_date=='')
        {
          $('.start_date').addClass('error');
          return false;
        }
if (end_date=='')
        {
          $('.end_date').addClass('error');
          return false;
        }
if (mail_date=='')
        {
          $('.mail_date').addClass('error');
          return false;
        }

if (end_date<start_date)
        {
          $.toast({
                      heading: 'Date Error',
                      text: 'Start Date must be Less Than End Date',
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                  })
          return false;
        }

      $.ajax({
          
            url: savemailorder,
            type:"POST",
            data: {
               'start_date':start_date,'end_date':end_date,'mail_date':mail_date,'csrfmiddlewaretoken': token,
            },
            success: function(response) {
                if (response=='yes')
                {
                 
                  $.toast({
                      heading: 'Mail Registered',
                      text: 'Mail Will Be Sent To Admins and Restaurants',
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'success'
                  })
                  
                }

                if (response=='no')
                {
                  $.toast({
                      heading: 'Error While Processing',
                      text: 'Some Issues While Saving, Would You Please Try Agaim',
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                  })
                  
                }

            }
          });


 });


$(document).on('click', '.end_date', function(){

  start_date=$('.start_date').val();

  if (start_date=='')
        {
          $.toast({
                      heading: 'Date Error',
                      text: 'Please Fille The Start Date First',
                      position: 'top-right',
                      loader: false,
                      hideAfter: 4000,
                      icon: 'error'
                  })
          return false;
        }

 

});









$('#edit_restaurant_form').submit(function(){

var shifts = [];
$("tr.shifts").each(function() {
  
        $(this).find("input").removeClass("error");
         $(this).find("select").removeClass("error");
        var quantity1 = $(this).find(".select_box option:selected").val().trim();
        var quantity2 = $(this).find(".timepicker_d5").val().trim();
        var quantity3 = $(this).find(".timepicker_d4").val().trim();

        if(quantity1==null || quantity1=="" && quantity2 != null && quantity2!= "" && quantity3 != null && quantity3 != ""){
          $(this).find(".select_box ").addClass("error");
          $(this).find(".select_box ").focus();
          return false;
        }
        else if(quantity2==null || quantity2=="" && quantity1 != null && quantity1!= "" && quantity3 != null && quantity3 != ""){
          $(this).find(".timepicker_d5").addClass("error");
          $(this).find(".timepicker_d5").focus();
          return false;
        }
        else if(quantity3==null || quantity3=="" && quantity2 != null && quantity2!= "" && quantity1 != null && quantity1 != ""){
          $(this).find(".timepicker_d4").addClass("error");
          $(this).find(".timepicker_d4").focus();
          return false;
        }
        else{
          if(quantity2 != null && quantity2!= "" && quantity1 != null && quantity1 != "" && quantity3 != null && quantity3 != ""){

              shifts.push({ 
              "day": quantity1,
              "from": quantity2,
              "till": quantity3 
              });
            }
          
        }
        
    
});

var shifts_data=JSON.stringify(shifts);
$('#shifts_array_value').val(shifts_data);

var logo=$('#hidden6').val();
 // $('#dashboard_modal').modal('show');
$('#datetimepicker1').removeClass('error');
$('#datetimepicker2').removeClass('error');
$('#datetimepicker3').removeClass('error');
$('#datetimepicker4').removeClass('error');
$('#res_dis_text').removeClass('error');
$('#discountp').removeClass('error');
$('#res_desc').removeClass('error');



var res_1st=$('#hidden1').val();
var res_2nd=$('#hidden2').val();
var res_3rd=$('#hidden3').val();
var res_4th=$('#hidden4').val();
var res_5th=$('#hidden5').val();
var res_1std=$('#delete_images_id1').val();
var res_2ndd=$('#delete_images_id2').val();
var res_3rdd=$('#delete_images_id3').val();
var res_4thd=$('#delete_images_id4').val();
var res_5thd=$('#delete_images_id5').val();



var discount_start_date=$('#datetimepicker3').val();
if(discount_start_date=='')
    { $('#datetimepicker3').addClass('error');
          $('html, body').animate({
         scrollTop: $(".attract_visitor_section").offset().top
     }, 1000);
    $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
   return false;
    }

var discount_end_date=$('#datetimepicker4').val();
 if(discount_end_date=='')
  { $('#datetimepicker4').addClass('error');
        $('html, body').animate({
       scrollTop: $(".attract_visitor_section").offset().top
   }, 1000);
    $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
 return false;
  }

var discount_start_time=$('#datetimepicker1').val();

if(discount_start_time=='')
            { $('#datetimepicker1').addClass('error');
                  $('html, body').animate({
                 scrollTop: $(".attract_visitor_section").offset().top
             }, 1000);
            $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
           return false;
            }

var discount_end_time=$('#datetimepicker2').val();

  if(discount_end_time=='')
    { $('#datetimepicker2').addClass('error');
          $('html, body').animate({
         scrollTop: $(".attract_visitor_section").offset().top
     }, 1000);
    $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
   return false;
    }

var res_discount_text=$('#res_dis_text').val();

if(res_discount_text=='')
      { $('#res_dis_text').addClass('error');
            $('html, body').animate({
           scrollTop: $(".attract_visitor_section").offset().top
       }, 1000);
      $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
     return false;
      }


var discountp=$('#discountp').val();
var discount_regex = /^\d+(\.\d{1,2})?$/;
if(discountp=='' || discountp==null || discountp=='None' || !discount_regex.test(discountp))
    { $('#discountp').addClass('error');
          $('html, body').animate({
         scrollTop: $(".attract_visitor_section").offset().top
     }, 1000);
    $.toast({
            heading: 'Error',
            text: "Field Cannot be blank or Null.And only take numeric values",
            position: 'top-center',
            loader: false,
            hideAfter: 3000,
            icon: 'error'
          });
   return false;
    }


var res_desc=$('textarea#res_desc').val().trim();
var res_desc=res_desc.trim();

if(res_desc=='')
      { $('#res_desc').addClass('error');
            $('html, body').animate({
           scrollTop: $(".admin_delivery_section").offset().top
       }, 1000);
     return false;
      }






/*-------------------------GET ALL DELIVERY TO SELCETED CHECKBOXES-------------------------*/

var selected = [];
$('.admin_delivery_inner input:checked').each(function() {
  var city_id = $(this).attr('id');
    selected.push(city_id);
});
var selected_cities=JSON.stringify(selected);
var photoshoot=$('.photoshoot_request').is(":checked"); 
var phone=$('#contact_phone').val();
var email=$('#contact_email').val();
var website=$('#website').val();
var facebook=$('#facebook').val();
var twitter=$('#twitter').val();
var instagram=$('#instagram').val();
/*-----------------------END----------------------------*/
var res_min_order = $('#rest_min_order').val();
$('#deliver_cities_array_value').val(selected_cities);
    // $.ajax({
    //     type: 'POST',
    //     url:  save_restaurent,
    //     data: {'min_order':res_min_order,'shifts': shifts_data,'logo':logo,'res_1st':res_1st,'res_2nd':res_2nd,'res_3rd':res_3rd,'res_4th':res_4th,'res_5th':res_5th,'discount_start_date':discount_start_date,'discount_end_date':discount_end_date,'discount_start_time':discount_start_time,'discount_end_time':discount_end_time,'res_discount_text':res_discount_text,'discountp':discountp,'res_desc':res_desc,'selected':selected_cities,'photoshoot':photoshoot,'phone':phone,'email':email,'website':website,'facebook':facebook,'twitter':twitter,'instagram':instagram,'csrfmiddlewaretoken':token,'res_1std':res_1std,'res_2ndd':res_2ndd,'res_3rdd':res_3rdd,'res_4thd':res_4thd,'res_5thd':res_5thd},
    //     success: function (response) {
    //      alert(response.success);
    //     }
    // });



});






$(document).on("click", '#hide_coupon',function(){


$('.attract_visitor_section').hide();
$('.show_coupon_class').show()


})

$(document).on("click", '#show_coupon',function(){
   $('.show_coupon_class').hide();
  $('.attract_visitor_section').show();
 


})



$(document).on("keyup", '#datetimepicker3',function(){

    return false;

});


$(document).on("keyup", '#datetimepicker4',function(){
    
    return false;

});



$(document).on("keyup", '#datetimepicker1',function(){
    
    return false;

});



$(document).on("keyup", '#datetimepicker2',function(){
    
    return false;

});



























var _URL = window.URL || window.webkitURL;
function imgvalidate(rimgfile,imgid,csize){

    var file, img;
    if ((file = rimgfile.files[0])) {
        img = new Image();


             
            img.onload = function () {



            if(this.width < 600 || this.height < 400){
                $.toast({
                  heading: 'Error',
                  text: "Required minimum dimensions:600*400. Width should be less then height.",
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'error'
                });
                return false;
            }
            else if(this.height > this.width || this.height == this.width){
                $.toast({
                  heading: 'Error',
                  text: "Required minimum dimensions:600*400. Width should be less then height.",
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'error'
                });
                return false;
            }
            else{
                previewimg(rimgfile,imgid,csize);
                var again_file=rimgfile.files[0];

                var reader= new FileReader();
                reader.onloadend=function(){
        
                var base_64=$('#hidden'+csize).val(reader.result);
                

                }
                reader.readAsDataURL(again_file);
                

                


                return true;
            }
        }
        img.src = _URL.createObjectURL(file);

        

    }
}
function previewimg(rimgfile,imgid,csize){
    document.getElementById(imgid).src = window.URL.createObjectURL(rimgfile.files[0]);
   
}
//--------------------------------------------------------Datepicker
$('#datetimepicker1').datetimepicker({
    datepicker:false,
    format:'H:i',
    step:5
});


$('#datetimepicker2').datetimepicker({
    datepicker:false,
    format:'H:i',
    step:5
});



$('#datetimepicker3').datetimepicker({
    //yearOffset:222,
    numberOfMonths: 2,
    lang:'ch',
    timepicker:false,
    format:'Y-m-d',
    formatDate:'Y-m-d',
    ignoreReadonly: true,
    onClose: function(dp,$input){
                        var endDate = $("#datetimepicker4").val();
                            var startDate = $("#datetimepicker3").val();
                            if( endDate!='' && startDate>endDate){
                                   $('#datetimepicker3').val('');
                             }
                                                           }
     
});
$('#datetimepicker4').datetimepicker({
    //yearOffset:222,
    lang:'ch',
    timepicker:false,
     closeOnDateSelect:true,
    format:'Y-m-d',
    formatDate:'Y-m-d',
    ignoreReadonly: true,
    onClose: function(current_time, $input){
        
                            var endDate = $("#datetimepicker4").val();
                            var startDate = $("#datetimepicker3").val();
                            if(startDate>endDate){
                                   $('#datetimepicker4').val('');
                             }
                         }
      
});

$('#datetimepicker31').datetimepicker({
    //yearOffset:222,
    numberOfMonths: 2,
    lang:'ch',
    timepicker:false,
    format:'Y-m-d',
    formatDate:'Y-m-d',
    ignoreReadonly: true,
    onClose: function(dp,$input){
                        var endDate = $("#datetimepicker41").val();
                            var startDate = $("#datetimepicker31").val();
                            if( endDate!='' && startDate>endDate){
                                   $('#datetimepicker31').val('');
                             }
                                                           }
     
});
$('#datetimepicker41').datetimepicker({
    //yearOffset:222,
    lang:'ch',
    timepicker:false,
     closeOnDateSelect:true,
    format:'Y-m-d',
    formatDate:'Y-m-d',
    ignoreReadonly: true,
    onClose: function(current_time, $input){
        
                            var endDate = $("#datetimepicker41").val();
                            var startDate = $("#datetimepicker31").val();
                            if(startDate>endDate){
                                   $('#datetimepicker41').val('');
                             }
                         }
      
});
var a;
 $('.timepicker_d4').each(function(index,item){
    a='#'+this.id;
    $(a).datetimepicker({
        datepicker:false,
        format:'H:i',
        minDate: 0,
        step:1
    });
})
  $('.timepicker_d5').each(function(index,item){
    a='#'+this.id;
    $(a).datetimepicker({
        datepicker:false,
        format:'H:i',
        minDate: 0,
        step:1
    });
})
$('#datetimepicker0').datetimepicker({
        datepicker:false,
        format:'H:i',
        minDate: 0,
        step:1
    });
//------------------------------------------------------------------------
function addrows(){
    // var str="";
    // var intvalue=0;
    // if(a.length == 16){
    //   str=a.substr(9, 1);
    //   str=str.trim();
    //   intvalue=parseInt(str);
    // }
    // else if(a.length == 17){
    //   str=a.substr(9, 2);
    //   str=str.trim();
    //   intvalue=parseInt(str);
    // }
    // else{
    //   str=a.substr(9, 3);
    //   str=str.trim();
    //   intvalue=parseInt(str);
    // }
    // intvalue=intvalue+1;
    var tbattr=document.getElementById("mytable").getElementsByTagName('tbody')[0];
    var lastRow = tbattr.rows[ tbattr.rows.length - 1 ];
    var ctdstart=lastRow.getElementsByTagName('td')[1];
    var cf1=lastRow.getElementsByTagName('input')[0];
    var pid1=cf1.id;
    var str1="";
    var intid1=0;
    if(pid1.length == 15){
      str1=pid1.substr(8, 1);
      str1=str1.trim();
      intid1=parseInt(str1);
    }
    else if(pid1.length == 16){
      str1=pid1.substr(8, 2);
      str1=str1.trim();
      intid1=parseInt(str1);
    }
    else{
      str1=pid1.substr(8, 3);
      str1=str1.trim();
      intid1=parseInt(str1);
    }
    
    intid1=intid1+1;
    var clone = lastRow.cloneNode(true);
    var selecttd=clone.getElementsByTagName('td')[0];
    var tdstart=clone.getElementsByTagName('td')[1];
    var tdend=clone.getElementsByTagName('td')[2];
    var f1=tdstart.getElementsByTagName('input')[0];
    var f2=tdend.getElementsByTagName('input')[0];
    var sl_fi=selecttd.getElementsByTagName('select')[0];
    sl_fi.name="week_day[]";
    f1.id="id_form-"+intid1+"-start";
    f2.id="id_form-"+intid1+"-end";
    f1.name="form-start[]";
    f2.name="form-end[]";
    var id1="#id_form-"+intid1+"-start";
    var id2="#id_form-"+intid1+"-end";

    tbattr.appendChild(clone);
    $(id1).val("");
    $(id2).val("");
    $(id1).datetimepicker({
            datepicker:false,
            format:'H:i',
            step:1
        });
    $(id2).datetimepicker({
            datepicker:false,
            format:'H:i',
            step:1
        });
}








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
    });
  }
}
//-----------------------------------------------------------------------------------------

$('#add_box_form').submit(function(){
  var name = $('#name_of_box').val();
  var from_date = $('#datetimepicker3').val();
  var till_date = $('#datetimepicker4').val();
  var fat = $('#fat').val();
  var protein = $('#protein').val();
  var sugar = $('#sugar').val();
  var carbo = $('#carbo').val();
  var sodium = $('#sodium').val();
  var price = $('#price').val();
  var rate = $('#rate').val();
  var vat = $('#vat').val();
  var per1 = $('#per1').val();
  var per2 = $('#per2').val();
  var per3 = $('#per3').val();
  var dis1 = $('#dis1').val();
  var dis2 = $('#dis2').val();
  var dis3 = $('#dis3').val();
  $('#name_of_box').removeClass('error');
  $('#datetimepicker3').removeClass('error');
  $('#datetimepicker4').removeClass('error');
  $('#fat').removeClass('error');
  $('#protein').removeClass('error');
  $('#sugar').removeClass('error');
  $('#carbo').removeClass('error');
  $('#sodium').removeClass('error');
  $('#price').removeClass('error');
  $('#rate').removeClass('error');
  $('#vat').removeClass('error');
  $('#per1').removeClass('error');
  $('#per2').removeClass('error');
  $('#per3').removeClass('error');
  $('#dis1').removeClass('error');
  $('#dis2').removeClass('error');
  $('#dis3').removeClass('error');
  if (name=="" || name==null) {
    $('#name_of_box').addClass('error');
    $('#name_of_box').focus();
    return false;
  }
  else if (from_date=="" || from_date==null) {
    $('#datetimepicker3').addClass('error');
    $('#datetimepicker3').focus();
    return false;
  }
  else if (till_date=="" || till_date==null) {
    $('#datetimepicker4').addClass('error');
    $('#datetimepicker4').focus();
    return false;
  }
  else if (fat=="" || fat==null) {
    $('#fat').addClass('error');
    $('#fat').focus();
    return false;
  }
  else if (protein=="" || protein==null) {
    $('#protein').addClass('error');
    $('#protein').focus();
    return false;
  }
  else if (sugar=="" || sugar==null) {
    $('#sugar').addClass('error');
    $('#sugar').focus()
    return false;
  }
  else if (carbo=="" || carbo==null) {
    $('#carbo').addClass('error');
    $('#carbo').focus()
    return false;
  }
  else if (sodium=="" || sodium==null) {
    $('#sodium').addClass('error');
    $('#sodium').focus()
    return false;
  }
  else if (price=="" || price==null) {
    $('#price').addClass('error');
    $('#price').focus()
    return false;
  }
  else if (rate=="" || rate==null) {
    $('#rate').addClass('error');
    $('#rate').focus()
    return false;
  }
  else if (vat=="" || vat==null) {
    $('#vat').addClass('error');
    $('#vat').focus()
    return false;
  }
  else if (per1=="" || per1==null) {
    $('#per1').addClass('error');
    $('#per1').focus()
    return false;
  }
  else if (dis1=="" || dis1==null) {
    $('#dis1').addClass('error');
    $('#dis1').focus()
    return false;
  }
  else if (per2=="" || per2==null) {
    $('#per2').addClass('error');
    $('#per2').focus()
    return false;
  }
  else if (dis2=="" || dis2==null) {
    $('#dis2').addClass('error');
    $('#dis2').focus()
    return false;
  }
  else if (per3=="" || per3==null) {
    $('#per3').addClass('error');
    $('#per3').focus()
    return false;
  }
  else if (dis3=="" || dis3==null) {
    $('#dis3').addClass('error');
    $('#dis3').focus()
    return false;
  }
  else{
    $('#name_of_box').removeClass('error');
    $('#datetimepicker3').removeClass('error');
    $('#datetimepicker4').removeClass('error');
    $('#fat').removeClass('error');
    $('#protein').removeClass('error');
    $('#sugar').removeClass('error');
    $('#carbo').removeClass('error');
    $('#sodium').removeClass('error');
    $('#price').removeClass('error');
    $('#rate').removeClass('error');
    $('#vat').removeClass('error');
    $('#per1').removeClass('error');
    $('#per2').removeClass('error');
    $('#per3').removeClass('error');
    $('#dis1').removeClass('error');
    $('#dis2').removeClass('error');
    $('#dis3').removeClass('error');
    var discount_regex =/^\d+(\.\d{1,2})?$/;
    var qty_regex =/^[0-9]{0,9}$/;
      if (!discount_regex.test(fat)) {
        $('#fat').addClass('error');
        $('#fat').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(protein)) {
        $('#protein').addClass('error');
        $('#protein').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(sugar)) {
        $('#sugar').addClass('error');
        $('#sugar').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(carbo)) {
        $('#carbo').addClass('error');
        $('#carbo').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(sodium)) {
        $('#sodium').addClass('error');
        $('#sodium').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(price)) {
        $('#price').addClass('error');
        $('#price').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(rate)) {
        $('#rate').addClass('error');
        $('#rate').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(vat)) {
        $('#vat').addClass('error');
        $('#vat').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per1)) {
        $('#per1').addClass('error');
        $('#per1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis1)) {
        $('#dis1').addClass('error');
        $('#dis1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per2)) {
        $('#per2').addClass('error');
        $('#per2').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis2)) {
        $('#dis2').addClass('error');
        $('#dis2').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per3)) {
        $('#per3').addClass('error');
        $('#per3').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis3)) {
        $('#dis3').addClass('error');
        $('#dis3').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
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
});
$('#edit_box_form').submit(function(){
  // alert("asd");
  var name = $('#name_of_box1').val();
  var from_date = $('#datetimepicker31').val();
  var till_date = $('#datetimepicker41').val();
  var fat = $('#fat1').val();
  var protein = $('#protein1').val();
  var sugar = $('#sugar1').val();
  var carbo = $('#carbo1').val();
  var sodium = $('#sodium1').val();
  var price = $('#price1').val();
  var rate = $('#rate1').val();
  var vat = $('#vat1').val();
  var per1 = $('#per11').val();
  var per2 = $('#per21').val();
  var per3 = $('#per31').val();
  var dis1 = $('#dis11').val();
  var dis2 = $('#dis21').val();
  var dis3 = $('#dis31').val();
  // alert(name+"="+from_date+" "+till_date+" "+fat+" "+fat+" "+protein+" "+sugar+" "+sugar+" ");
  $('#name_of_box1').removeClass('error');
  $('#datetimepicker31').removeClass('error');
  $('#datetimepicker41').removeClass('error');
  $('#fat1').removeClass('error');
  $('#protein1').removeClass('error');
  $('#sugar1').removeClass('error');
  $('#carbo1').removeClass('error');
  $('#sodium1').removeClass('error');
  $('#price1').removeClass('error');
  $('#rate1').removeClass('error');
  $('#vat1').removeClass('error');
  $('#per11').removeClass('error');
  $('#per21').removeClass('error');
  $('#per31').removeClass('error');
  $('#dis11').removeClass('error');
  $('#dis21').removeClass('error');
  $('#dis31').removeClass('error');
  if (name=="" || name==null) {
    $('#name_of_box1').addClass('error');
    $('#name_of_box1').focus();
    return false;
  }
  else if (from_date=="" || from_date==null) {
    $('#datetimepicker31').addClass('error');
    $('#datetimepicker31').focus();
    return false;
  }
  else if (till_date=="" || till_date==null) {
    $('#datetimepicker41').addClass('error');
    $('#datetimepicker41').focus();
    return false;
  }
  else if (fat=="" || fat==null) {
    $('#fat1').addClass('error');
    $('#fat1').focus();
    return false;
  }
  else if (protein=="" || protein==null) {
    $('#protein1').addClass('error');
    $('#protein1').focus();
    return false;
  }
  else if (sugar=="" || sugar==null) {
    $('#sugar1').addClass('error');
    $('#sugar1').focus()
    return false;
  }
  else if (carbo=="" || carbo==null) {
    $('#carbo1').addClass('error');
    $('#carbo1').focus()
    return false;
  }
  else if (sodium=="" || sodium==null) {
    $('#sodium1').addClass('error');
    $('#sodium1').focus()
    return false;
  }
  else if (price=="" || price==null) {
    $('#price1').addClass('error');
    $('#price1').focus()
    return false;
  }
  else if (rate=="" || rate==null) {
    $('#rate1').addClass('error');
    $('#rate1').focus()
    return false;
  }
  else if (vat=="" || vat==null) {
    $('#vat1').addClass('error');
    $('#vat1').focus()
    return false;
  }
  else if (per1=="" || per1==null) {
    $('#per11').addClass('error');
    $('#per11').focus()
    return false;
  }
  else if (dis1=="" || dis1==null) {
    $('#dis11').addClass('error');
    $('#dis11').focus()
    return false;
  }
  else if (per2=="" || per2==null) {
    $('#per21').addClass('error');
    $('#per21').focus()
    return false;
  }
  else if (dis2=="" || dis2==null) {
    $('#dis21').addClass('error');
    $('#dis21').focus()
    return false;
  }
  else if (per3=="" || per3==null) {
    $('#per31').addClass('error');
    $('#per31').focus()
    return false;
  }
  else if (dis3=="" || dis3==null) {
    $('#dis31').addClass('error');
    $('#dis31').focus()
    return false;
  }
  else{
    $('#name_of_box1').removeClass('error');
    $('#datetimepicker31').removeClass('error');
    $('#datetimepicker41').removeClass('error');
    $('#fat1').removeClass('error');
    $('#protein1').removeClass('error');
    $('#sugar1').removeClass('error');
    $('#carbo1').removeClass('error');
    $('#sodium1').removeClass('error');
    $('#price1').removeClass('error');
    $('#rate1').removeClass('error');
    $('#vat1').removeClass('error');
    $('#per11').removeClass('error');
    $('#per21').removeClass('error');
    $('#per31').removeClass('error');
    $('#dis11').removeClass('error');
    $('#dis21').removeClass('error');
    $('#dis31').removeClass('error');
    var discount_regex =/^\d+(\.\d{1,2})?$/;
    var qty_regex =/^[0-9]{0,9}$/;
      if (!discount_regex.test(fat)) {
        $('#fat1').addClass('error');
        $('#fat1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(protein)) {
        $('#protein1').addClass('error');
        $('#protein1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(sugar)) {
        $('#sugar1').addClass('error');
        $('#sugar1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(carbo)) {
        $('#carbo1').addClass('error');
        $('#carbo1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(sodium)) {
        $('#sodium1').addClass('error');
        $('#sodium1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(price)) {
        $('#price1').addClass('error');
        $('#price1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(rate)) {
        $('#rate1').addClass('error');
        $('#rate1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(vat)) {
        $('#vat1').addClass('error');
        $('#vat1').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per1)) {
        $('#per11').addClass('error');
        $('#per11').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis1)) {
        $('#dis11').addClass('error');
        $('#dis11').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per2)) {
        $('#per21').addClass('error');
        $('#per21').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis2)) {
        $('#dis21').addClass('error');
        $('#dis21').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!discount_regex.test(per3)) {
        $('#per31').addClass('error');
        $('#per31').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only. Value with '.' are also not allowed in quantity.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
              icon: 'error'
            });
        return false;
      }
      else if (!qty_regex.test(dis3)) {
        $('#dis31').addClass('error');
        $('#dis31').focus();
        $.toast({
              heading: 'Error',
              text: "Numbers only.",
              position: 'top-center',
              loader: false,
              hideAfter: 3000,
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
});
 $(".order-status-check").click(function() {
        var t = $(this).attr("data-id"),
            s = $(this).attr("data-status");
        
        $.ajax({

            url: order_set,
            type: "POST",
            data: {
                order_item_id: t,
                status: s,
                'csrfmiddlewaretoken':token
            },
            success: function(response) {
              if(response.data.status=="success"){
                $.toast({
                  heading: 'Success',
                  text: response.data.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'success'
                });
              }
              else{
                $.toast({
                  heading: 'Failure',
                  text: response.data.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,

                });
              }
            }
        });

  });


$(".archive_notification").click(function() {
        var t = $(this).parents(".notification_msg").attr("data-mid"),
            s = $(this).parents(".notification_msg").attr("data-u"),
            i = $(this).parents(".notification_msg"),
            type = $(this).parents(".notification_msg").attr("data-t"),
            n = 0;
          var parent_id = $(this).parents(".notification_msg").attr("id");
          if(type=="order_notify"){
          n = 2;
          }
          else if(type=="admin"){
            n = 1;
          }
          else{
            n = 0;
          }
      $.ajax({
            url: archieve_notification,
            type: "POST",
            data: {
                uid: s,
                mid: t,
                lb_msg_type: n,
                'csrfmiddlewaretoken':token
            },
            success: function(t) {

               if(t.status=="error"){
                $.toast({
                  heading: 'Failure',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,

                });

               }
               else{
                var id_row='#'+parent_id;
                $(id_row).slideUp();
                $.toast({
                  heading: 'Success',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'success'
                });
               }
            }
        });
    });



 $(".priority-check").click(function(t) {
        var s = $(this).parents(".notification_priority").attr("data-id"),
            i = $(this).parents(".notification_priority").attr("data-idd"),
            n = $(this).attr("data-priority"),
            o = $(this).parents(".notification_msg"),
            l = 0;
        var gte_id = $(this).attr("id");
        var get_id = gte_id.substring(1,gte_id.length);
        var id1 ="h"+get_id ,
            id2 ="l"+get_id ,
            id3 ="c"+get_id ;
        var elmnt_checked1 = $("#"+id1).prop("checked");
        var elmnt_checked2 = $("#"+id2).prop("checked");
        var elmnt_checked3 = $("#"+id3).prop("checked");

        if(gte_id==id1){
          $("#"+id2).prop("checked",false);
          $("#"+id3).prop("checked",false);
        }
        else if(gte_id==id2){
          $("#"+id1).prop("checked",false);
          $("#"+id3).prop("checked",false);
        }
        else{
          $("#"+id2).prop("checked",false);
          $("#"+id1).prop("checked",false);
        }
         $.ajax({
            url: set_msg_priorty,
            type: "POST",
            data: {
                msg_id: s,
                idd: i,
                priority: n,
                lb_msg_type: l,
                'csrfmiddlewaretoken':token
            },
            success: function(t) {
              if(t.data.status=="error"){
                $.toast({
                  heading: 'Failure',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,

                });

               }
               else{
                $.toast({
                  heading: 'Success',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'success'
                });
               }        
            }
        })
    });

 $(".priority-check1").click(function(t) {
        var s = $(this).parents(".notification_priority").attr("data-id"),
            i = $(this).parents(".notification_priority").attr("data-idd"),
            type = $(this).parents(".notification_priority").attr("data-t"),
            n = $(this).attr("data-priority"),
            o = $(this).parents(".notification_msg"),
            l = 0;
        if(type=="order_notify"){
          l = 2;
        }
        else if(type=="admin"){
          l = 1;
        }
        else{
          l = 0;
        }
        var gte_id = $(this).attr("id");
        var get_id = gte_id.substring(2,gte_id.length);
        var id1 ="ah"+get_id ,
            id2 ="al"+get_id ,
            id3 ="ac"+get_id ;
        var elmnt_checked1 = $("#"+id1).prop("checked");
        var elmnt_checked2 = $("#"+id2).prop("checked");
        var elmnt_checked3 = $("#"+id3).prop("checked");

        if(gte_id==id1){
          $("#"+id2).prop("checked",false);
          $("#"+id3).prop("checked",false);
        }
        else if(gte_id==id2){
          $("#"+id1).prop("checked",false);
          $("#"+id3).prop("checked",false);
        }
        else{
          $("#"+id2).prop("checked",false);
          $("#"+id1).prop("checked",false);
        }
         $.ajax({
            url: set_msg_priorty,
            type: "POST",
            data: {
                msg_id: s,
                idd: i,
                priority: n,
                lb_msg_type: l,
                'csrfmiddlewaretoken':token
            },
            success: function(t) {

              if(t.data.status=="error"){
                $.toast({
                  heading: 'Failure',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,

                });

               }
               else{
                $.toast({
                  heading: 'Success',
                  text: t.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,
                  icon: 'success'
                });
               }        
            }
        })
    });




$.urlParam = function(name){
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  if(results == null || results == "")
  {
    return results
  }
  else{
    return results[1] || 0;  
  }
  
}

$( document ).ready(function() {

    var today = new Date().toISOString().split('T')[0];
$('[name="mail_date"]').attr('min',today);
  var param_value=$.urlParam('tabv');

  if(param_value == null || param_value == "")
  {
    return false
  }
  else{

    var a='#'+param_value;
    var b='#'+param_value+'b';

    $(a).siblings().removeClass("active");
    $(b).siblings().removeClass("active");
    $(a).addClass("active");
    $(b).addClass("active");
    // $('#exTab'+param_value+' a[href="#'+param_value+'b"]').tab('show');
  }
  
});

function chngData(emnts,r_id) {
            $(emnts).siblings('div').children('a.active').removeClass("active");
            $(emnts).children('a').addClass("active");
        $.ajax({
            url: '/dashboard/get/data/',
            type: "GET",
            data: {
                't': '1',
                'id': r_id,
                'csrfmiddlewaretoken':token
            },
            success: function(response) {
              $('#order_time_table').html(response);
            }
        });
        $.ajax({
            url: '/dashboard/get/data/',
            type: "GET",
            data: {
                't': '2',
                'id': r_id,
                'csrfmiddlewaretoken':token
            },
            success: function(response) {
              $('#1st_tab_content').html(response);
            }
        });

  }


$(".send-chat").click(function() {
    var t = $(this).parent().children('#res_chat_box_text').attr("data-lb"),
        emnt = $(this).parent().children('#res_chat_box_text'),
        s = $(this).parent().children('#res_chat_box_text').attr("data-res"),
        i = $(this).parent().children('#res_chat_box_text').val(),
        n = $(this).parent().parent().children().children().children().children('#chat_msg_list');
        if(i != null || i != ""){
          $.ajax({
              url: askrestaurant,
              type: "POST",
              data: {
                  lb: t,
                  res: s,
                  msg: i,
                  'csrfmiddlewaretoken':token
              },
              success: function(response) {
                // alert(response.msg);
                if(response.msg=="Success"){
                  var a = "<li><span><img src='"+response.src+"' alt='user-img'></span><p class='user-name'>"+response.user+"</p><p id='chat_msg_res' class='user-content'>"+i+"</p><span class='d-and-t'><span class='time'>"+response.time+"</span><span>"+response.date+"</span></span></li>";
                  $(n).append(a);
                  $(n).parent().parent().animate({
                    scrollTop: $(n)[0].scrollHeight
                  });
                  emnt.val("");  
                }
                else{
                  $.toast({
                  heading: 'Failure',
                  text: response.msg,
                  position: 'top-right',
                  loader: false,
                  hideAfter: 4000,

                  });
                }
              }
          });
        }
});

// $('#res_chat_box_text').keydown(function(event){ 

//     var keyCode = (event.keyCode ? event.keyCode : event.which);   
//     if (keyCode == 13) {
//         // alert($(this).parent().children('.send-chat').attr("class"));
//         $(this).parent().children('.send-chat').trigger('click');

//     }
// });

function send_chat_lb(elemnt){
  // alert("a");
  // alert($(elemnt).parent().parent().attr("class"));
        var t = $(elemnt).parent().parent().children(".top-chat-list"),
            s = $(elemnt).parent().children(".lb_msg").val(),
            i = $(elemnt).parent().parent().attr("data-lb"),
            n = $(elemnt).parent().parent().attr("data-res"),
            m = $("#lb_msg_list");
            // alert(s+"-"+i+"-"+n);
        $.ajax({
            url: communication_with_restaurant,
            type: "POST",
            data: {
                lb: i,
                res: n,
                msg: s,
                'csrfmiddlewaretoken':token
            },
            success: function(response) {
                if(response.msg=="Success"){
                  var a = "<li><span><img src='"+response.src+"' alt='user-img'></span><p class='user-name'>"+response.user+"</p><p id='chat_msg_res' class='user-content'>"+s+"</p><span class='d-and-t'><span class='time'>"+response.time+"</span><span>"+response.date+"</span></span></li>";
                  $(m).append(a);
                  $(t).animate({
                    scrollTop: $(t)[0].scrollHeight
                  });
                  $(elemnt).parent().children(".lb_msg").val("");  
                  $('#no_msg_avl').css("display","none");
                }
                else{
                  $.toast({
                  heading: 'Failure',
                  text: response.msg,
                  position: 'top-center',
                  loader: false,
                  hideAfter: 3000,

                  });
                }
            }
        });
    }

$(".btn-reply").click(function() {
        $(this).hasClass("clicked") ? $(this).removeClass("clicked") : $(this).addClass("clicked"), $(this).parents(".notification_msg").children(".notification_reply").fadeToggle()
    });

 $(".notification_reply button").click(function() {
        var t = $(this).parent().children(".msgs"),
            s = $(this).parent().children(".msg"),
            i = $(this),
            n = 0,
            o = $(this).parents(".notification_msg").attr("data-lb"),
            c = $(this).parents(".notification_msg").attr("data-mid"),
            l = $(this).parents(".notification_msg").attr("data-u"),
            d = $(this).parents(".notification_msg");
            
            ms=$(s).val();
         $.ajax({
            url: restaurant_reply,
            type: "POST",
            data: {
                uid: l,
                mid: c,
                lb: o,
                admin_reply: n,
                msg: ms,
                'csrfmiddlewaretoken':token
            },
            success: function(e) {
                var a = "<strong>" + e.user + "</strong><div class='clearfix'></div><span>" + e.date + "</span><p>" + s.val() + "</p>\n";
                $(t).append(a), $(t).animate({
                    scrollTop: $(t)[0].scrollHeight
                }), $(s).val(""), $(s).remove(), $(i).remove(), setTimeout(function() {
                    $(d).remove()
                }, 2e3)
            }
        })
    })
/*-----------------------------send mail of orders-----------------------------------------*/
 function ordermail() {

        $.ajax({
            url: '/mailorderdetail/',
            type: "GET",
            success: function(response) {
                $.toast({
              text: 'Mail is successfully sended to ypur account.',
              position: 'top-right',
              loader: false,
              hideAfter: 4000,
              icon: 'success'
            });
              //$('.admin_order_list_outer').html(response);
            }
        });

  }


function delete_shift(elmnt){


  var a=$(".shifts");
  if(a.length>1){
    $(elmnt).parents("tr").remove();  
  }
  else{
    $.toast({
      heading: 'Failure',
      text: "Can't delete last.",
      position: 'top-center',
      loader: false,
      hideAfter: 3000,
      icon: 'error'
    });
  }
}

function validateRecoveryForm(){
  var email = $('.recovery_email').val();
  var email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  if(email == "" || email == null || !email_regex.test(email)){
    $.toast({
      heading: 'Error',
      text: "Please enter a valid email address",
      position: 'top-center',
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

$(".close_logo").click(function(t) {
        t.preventDefault();
        var s = $(this).attr("data-res"),
            i = $(this).parent();
        $.ajax({

            url: remove_restaurant,
            type: "POST",
            data: {
                res_id: s,
                'csrfmiddlewaretoken':token
            },
            success: function(t) {
                if(t.data.msg=="success"){
                  $(i).remove();
                  $.toast({
                      heading: 'Successfull',
                      text: "Restaurant removed successfully.",
                      position: 'top-right',
                      loader: false,
                      hideAfter: 5000,
                      icon: 'success'
                    });
                }
                else{
                  $.toast({
                      heading: 'Error',
                      text: "Some error occur.",
                      position: 'top-right',
                      loader: false,
                      hideAfter: 5000,
                      icon: 'error'
                    });
                }
            }
        });
    });


function show_icon(){
  $('.close_logo').fadeToggle();
}

$(document).ready(function(){
  var msgsucc=$('#msgsucc').html();

  if(msgsucc!=null && msgsucc != "" && typeof  msgsucc != "undefined"){
      $.toast({
          text: msgsucc,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'success'
        });
  }

 var msgsucc1=$('#msgvalid').html();

  if(msgsucc1!=null && msgsucc1 != "" && typeof msgsucc1 != "undefined"){
      $.toast({
          text: msgsucc1,
          position: 'top-right',
          loader: false,
          hideAfter: 5000,
          icon: 'warning'
        });
  }

});

 $('#from_mail_date').datetimepicker({
        lang:'ch',
        timepicker:false,
        closeOnDateSelect:true,
        format:'d/m/Y',
        formatDate:'d/m/Y',
        ignoreReadonly: true,
        minDate: 0
    })

     $('#till_mail_date').datetimepicker({
        lang:'ch',
        timepicker:false,
        closeOnDateSelect:true,
        format:'d/m/Y',
        formatDate:'d/m/Y',
        ignoreReadonly: true,
        minDate: 0
    })

      $('#actual_mail_date').datetimepicker({
        lang:'ch',
        timepicker:false,
        closeOnDateSelect:true,
        format:'d/m/Y',
        formatDate:'d/m/Y',
        ignoreReadonly: true,
        minDate: 0
    })
