var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};

var code = "";
function fixDiscount(isX){
    if (isX){
        $(".promo_code_input").val("");
        code = "";
    }
    if ($(".promo_price").length){
        total_price = parseFloat($(".total_price").text());
        company_discount = 0;
        if ($(".promo_price").length){
            company_discount = parseFloat($(".company_discount_price").text());
        }
        discount_price_num = total_price - company_discount;
        $(".discount_price").text(discount_price_num.toFixed(2));
    }
    $("#coupon_discount").remove();
}

window.addEventListener ('resize', function(e) {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || $(window).innerWidth() <= 800) {
        $('body').addClass('isMobile');
    }

    if ($(window).innerWidth() > 800) {
        $('body').removeClass('isMobile');
    }
});

(function () {
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || $(window).innerWidth() <= 800) {
        $('body').addClass('isMobile');
    }

    //CSRF
    function getCookie(name) {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }

    var csrftoken = getCookie('csrftoken');

    function csrfSafeMethod(method) {
        // these HTTP methods do not require CSRF protection
        return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
    }

    function sameOrigin(url) {
        // test that a given url is a same-origin URL
        // url could be relative or scheme relative or absolute
        var host = document.location.host; // host + port
        var protocol = document.location.protocol;
        var sr_origin = '//' + host;
        var origin = protocol + sr_origin;
        // Allow absolute or scheme relative URLs to same origin
        return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||
            (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||
                // or any other URL that isn't scheme relative or absolute i.e relative.
            !(/^(\/\/|http:|https:).*/.test(url));
    }

    if ($('.auth_email').length) {
        $('.auth_email').click().focus();
    }

    $('#fullpage').fullpage({
        scrollOverflow: true
    });

    $('.small img').click(function () {
        $(this).parent().parent().children('.big').children('img').attr('src', $(this).data('image'));
    });

    var loop;
    $('.restaurant-lunchbox').on({
        mouseenter: function (e) {
            var images = $(this).find('.hidden'),
                i = 0;
            loop = setInterval(function (that) {
                if (i < images.length - 1) {
                    i++;
                } else {
                    i = 0;
                }
                if ($(images[i]).attr('src') !== undefined) {
                    $(e.currentTarget).find('.big').css({
                        'background': 'silver',
                        'background-image': 'url(' + $(images[i]).attr('src') + ')',
                        'background-size': 'cover'
                    });
                }
            }, 900);
        },
        mouseleave: function () {
            clearInterval(loop);
        }
    });

    $.fn.extend({
        animateCss: function (animationName) {
            var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            $(this).addClass('animated ' + animationName).one(animationEnd, function () {
                $(this).removeClass('animated ' + animationName);
            });
        }
    });

    $('.add_to_basket').click(function (e) {
        e.preventDefault();
        var lunchbox_id = $(this).parent().parent().parent().data('lunchbox'),
            qty = $(this).parent().find('.lb-qty').val();
        if ($(this).hasClass('catering')) {
            $.ajax({
                beforeSend: function (xhr, settings) {
                    if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                        // Send the token to same-origin, relative URLs only.
                        // Send the token only if the method warrants CSRF protection
                        // Using the CSRFToken value acquired earlier
                        xhr.setRequestHeader("X-CSRFToken", csrftoken);
                    }
                },
                url: '/add_to_catering_cart/',
                type: 'POST',
                data: {
                    'lunchbox': lunchbox_id,
                    'qty': qty
                },
                success: function (data) {
                    humane.log(gettext('Lunchbox successfully added to catering!'));
                    $('.cart-icon').animateCss('bounce');
                }
            });
        } else {
            $.ajax({
                beforeSend: function (xhr, settings) {
                    if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                        // Send the token to same-origin, relative URLs only.
                        // Send the token only if the method warrants CSRF protection
                        // Using the CSRFToken value acquired earlier
                        xhr.setRequestHeader("X-CSRFToken", csrftoken);
                    }
                },
                url: '/add_to_cart/',
                type: 'POST',
                data: {
                    'lunchbox': lunchbox_id,
                    'qty': qty
                },
                success: function (data) {
                    humane.log(gettext('Lunchbox successfully added to basket!'));
                    $('.cart-icon').animateCss('bounce');
                    $('#checkout_href').attr("href", "/cart/");
                    $('#checkout_nav_href').attr("href", "/cart/");
                }
            });
        }
    });

    $('.checkbox-radio input[type="checkbox"]').click(function () {
        $(this).parent().children('input').each(function () {
            $(this).prop('checked', false);
        });
        $(this).prop('checked', true);
    });

    function checkPasswordMatch() {
        var password = $("#id_password1").val();
        var confirmPassword = $("#id_password2").val();

        if (password != confirmPassword) {
            $("#id_password1").parent().addClass('has-error');
            if (!$('.error_msg').length) {
                var err_msg = gettext('Passwords mismatch!');
                $('.register_form').prepend('<label class="control-label small error_msg">' + err_msg + '</label>');
            }
        } else {
            $("#id_password1").parent().removeClass('has-error');
            $('.error_msg').remove();
        }
    }

    $("#id_password2").keyup(checkPasswordMatch);

    var company_select = $('#id_company');
    if (company_select.length) {
        company_select.change(function () {
            var value = $(this).val();

            if (parseInt(value) == 0) {
                if (window.location.pathname == '/edit_user_profile/') {
                    $('.c_hidden').fadeIn();
                } else {
                    window.location.href = '/company_registration/';
                }
            } else {
                if (window.location.pathname == '/edit_user_profile/') {
                    $('.c_hidden').fadeOut();
                }
            }
        });
    }

    $('.show_company_info').click(function (e) {
        e.preventDefault();
        var company_select = $('#id_company');
        $(company_select).children('option').each(function () {
            $(this).removeAttr('selected');
        });
        $(company_select).find('option[value="0"]').prop('selected', true);

        $('.c_hidden').fadeIn();
    });


    $('.lb-chat').each(function () {
        $(this).children('.msgs').animate({scrollTop: $(this).children('.msgs')[0].scrollHeight}, 500);
    });

    $('.lb-chat button').click(function () {
        var msgs = $(this).parent().children('.msgs'),
            msg = $(this).parent().children('.msg'),
            lb = $(this).parent().attr('data-lb'),
            resid = $(this).parent().attr('data-res');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/ask_restaurant/',
            type: 'POST',
            data: {
                'lb': lb,
                'res': resid,
                'msg': $(msg).val()
            },
            success: function (data) {
                var html = "<strong>" + data['user'] + "</strong>" +
                    "<div class='clearfix'></div>" +
                    "<span>" + data['date'] + "</span>" +
                    "<p>" + msg.val() + "</p>\n";
                $(msgs).append(html);
                $(msgs).animate({scrollTop: $(msgs)[0].scrollHeight});
                $(msg).val('');
            }
        });
    });

    $('.reviews button').click(function () {
        var msgs = $(this).parent().children('.review-msgs'),
            msg = $(this).parent().children('.msg'),
            btn = $(this),
            resid = $(this).parent().attr('data-res'),
            no_review_msg = $('.no_review_msg');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/leave_review/',
            type: 'POST',
            data: {
                'res': resid,
                'msg': $(msg).val()
            },
            success: function (data) {
                var html = "<strong>" + data['user'] + "</strong>" +
                    "<div class='clearfix'></div>" +
                    "<span>" + data['date'] + "</span>" +
                    "<p>" + msg.val() + "</p>\n";

                if (no_review_msg.length) {
                    no_review_msg.remove();
                }

                $(msgs).append(html);
                $(msgs).animate({scrollTop: $(msgs)[0].scrollHeight});
                $(msg).val('');
                $(msg).remove();
                $(btn).remove();

                $('.title').text('Reviews')
            }
        });
    });

    $('.rate a').click(function (e) {
        e.preventDefault();

        $(this).parents('.rate').children('.active').removeClass('active');
        $(this).parent().addClass('active');

        var rating = parseInt($(this).attr('data-rate')),
            rate_block = $(this).parents('.rate_this_lunchbox'),
            lb = parseInt($(this).parents('.rate_this_lunchbox').attr('data-lb')),
            lunchbox = $(this).parents('.restaurant').children('.restaurant-lunchboxes'),
            ribbon = $(this).parents('.restaurant').find('.ribbon');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/rate_lunchbox/',
            type: 'POST',
            data: {
                'lb': lb,
                'rating': rating
            },
            success: function (data) {
                var new_rating = data['data']['lunchbox_rating'],
                    new_rating_int = parseInt(new_rating),
                    stars_html = "",
                    i = 0;

                new_rating = new_rating.toFixed(1);

                //rate_block.remove();

                if (ribbon.length) {
                    ribbon.children('.rating').text(new_rating);

                    for (i = 1; i <= new_rating_int; i++) {
                        stars_html += "<li><span class='glyphicon glyphicon-star'></span></li>";
                    }

                    for (i = 1; i <= 5 - new_rating_int; i++) {
                        stars_html += "<li><span class='glyphicon glyphicon-star-empty'></span></li>";
                    }

                    ribbon.children('.stars').html(stars_html);
                } else {
                    var html = '';

                    stars_html = '<ul class="stars">';

                    for (i = 1; i <= new_rating_int; i++) {
                        stars_html += "<li><span class='glyphicon glyphicon-star'></span></li>";
                    }

                    for (i = 1; i <= 5 - new_rating_int; i++) {
                        stars_html += "<li><span class='glyphicon glyphicon-star-empty'></span></li>";
                    }
                    stars_html += "</ul>";

                    html += '<div class="ribbon">' +
                        '<p class="rating_txt">' + gettext('Rating') + '</p>' +
                        '<p class="rating">' + new_rating + '</p>' +
                        stars_html +
                        '</div>';

                    lunchbox.prepend(html);
                }

            }
        });
    });

    $('.request_lunchbox_again').click(function (e) {
        e.preventDefault();

        var lb = parseInt($(this).attr('data-lb')),
            qty = $(this).parent().children('.qty');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/request_lunchbox/',
            type: 'POST',
            data: {
                'lb': lb
            },
            success: function (data) {
                if (data.msg === "success") {
                    var new_requests_qty = data['data']['requests'];
                    qty.text(new_requests_qty);
                }
            }
        });
    });

    $('.edit_and_save').click(function (e) {
        e.preventDefault();

        $('#id_c_last_name, #id_c_first_name, #id_c_address, #id_c_zipcode, #id_c_phone').removeClass('unselectable').attr('readonly', false);

        if (!$(this).hasClass('clicked')) {
            $(this).addClass('clicked');
            $(this).val('Save');
        } else {
            $('.register_form').submit();
        }
    });

    if ($('.timepicker').length || $('.datepicker').length || $('.datetimepicker').length) {
        $('.timepicker').datetimepicker({
            datepicker: false,
            format: 'H:i',
            theme: 'dark',
            minDate: 0
        });

        $('.datepicker').datetimepicker({
            timepicker: false,
            format: 'M d Y',
            theme: 'dark',
            minDate: 0
        });

        $('.datetimepicker').datetimepicker({
            format: 'M d Y H:i',
            theme: 'dark',
            minDate: 0
        });
    }

    if ($('.delivery').length) {
        $('.qty').change(function () {
            var parent = $(this).parent();
            var order_item_id = $(this).attr('data-item-id');
            var new_qty = $(this).val();

            var update_button_html = "<form action='/update_item_qty/' method='GET'>" +
                "<input name='new_qty' type='hidden' value=" + new_qty + ">" +
                "<input name='order_item_id' type='hidden' value=" + order_item_id + ">" +
                "<input type='submit' class='update-btn btn btn-default' value='" + gettext('Update basket') + "'></form>";

            if (parent.next('form').length <= 0) {
                parent.after(update_button_html);
            }
            else {
                parent.next('form').remove();
                parent.after(update_button_html);
            }

            /*var total = 0.0,
                total_with_discount = 0.0,
                items_html = $('.items_info');

            items_html.html("");

            $('.restaurant').each(function () {
                var lb_name = $(this).find('.restaurant-lunchbox-name').text(),
                    qty = parseInt($(this).find('select[name="qty"]').children('option:selected').val()),
                    price = parseFloat($(this).find('.lb-price').text()),
                    discount_price = parseFloat($(this).find('.lb-discount_price').text()),
                    item_html = "" +
                        "<p class='pull-left'>" +
                        "<span class='text-uppercase'>" + lb_name + "</span> | " +
                        "<span>" + gettext('Quantity') + ": </span><strong>" + qty + "</strong> /" +
                        "<strong>" + price + " EUR</strong>" +
                        "</p>";

                items_html.append(item_html);

                if (discount_price) {
                    total_with_discount += qty * discount_price;
                } else {
                    total_with_discount += qty * price;
                }

                total += qty * price;
            });
            $('.total_txt').children('span').text(total.toFixed(2) + ' EUR');

            if (window.promo_discount) {
                $('.total_with_discount_txt').children('span').text((window.promo_discount * total_with_discount / 100).toFixed(2) + ' EUR');
            } else if (total != total_with_discount) {
                $('.total_with_discount_txt').children('span').text(total_with_discount.toFixed(2) + ' EUR');
            }*/
        });
    }

    var timeout = null;
    $('.promo_code_input').on('keyup', function () {
        var that = this;
        if (timeout !== null) {
            clearTimeout(timeout);
        }
        timeout = setTimeout(function () {
            if ($(that).val().length >= 3 && code != $(that).val()) {
                code = $(that).val();
                var total_wrap = $('.total'),
                    total_price_num = parseFloat($('.total_price').text()),
                    discount_price = $('.discount_price'),
                    discount_price_num = parseFloat(discount_price.text()),
                    new_discount_price = 0;

                $.ajax({
                    beforeSend: function (xhr, settings) {
                        if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                            // Send the token to same-origin, relative URLs only.
                            // Send the token only if the method warrants CSRF protection
                            // Using the CSRFToken value acquired earlier
                            xhr.setRequestHeader("X-CSRFToken", csrftoken);
                        }
                    },
                    url: '/get_promo_code_discount/',
                    type: 'POST',
                    data: {
                        'code': code
                    },
                    success: function (data) {
                        fixDiscount(false);
                        if (data.status == "success") {
                            var discount = parseFloat(data.discount),
                                promo_discount = 0;
                            discount_price = $('.discount_price');
                            if (discount_price.length) {
                                discount_price_num = parseFloat(discount_price.text());
                                promo_discount = discount_price_num * discount / 100;
                                new_discount_price = discount_price_num - promo_discount;
                                prepend_html = "<div id='coupon_discount'> <span id='close' onclick='fixDiscount(true)'>x</span><strong class='total_with_discount_txt'>" + gettext('Coupon discount') + ": " + code + "<span class='pull-right'><span class='promo_price'> -" + promo_discount.toFixed(2) + "</span> eur</span></div>"
                                $("#total_discount").prepend(prepend_html);
                                discount_price.text(new_discount_price.toFixed(2));
                            } else {
                                promo_discount = total_price_num * discount / 100;
                                new_discount_price = total_price_num - promo_discount;
                                var discount_html = "<div id='coupon_discount'> <span id='close' onclick='fixDiscount(true)'>x</span><strong class='total_with_discount_txt'>" + gettext('Coupon discount') + ": " + code + "<span class='pull-right'><span class='promo_price'>-" + promo_discount.toFixed(2) +
                                    "</span> eur</span><div id='total_discount'><strong class='total_with_discount_txt'>" + gettext('With discount') + "<span class='pull-right'><span class='discount_price'>" + new_discount_price.toFixed(2) + "</span> eur</span></strong></div>"
                                if ($(".catering_delivery_date").length){
                                    $("#total_amount_txt").append(discount_html);
                                }
                                else{
                                    total_wrap.append(discount_html);
                                }
                            }
                            window.promo_discount = discount;
                            $('p#couponErr').html("");
                            $(that).removeClass('error');
                        } else {
                            var msg = data.msg;
                            $('p#couponErr').html(msg);
                            $(that).addClass('error');
                        }
                    }
                });
            }
        }, 1000);
    });

    //Cart checkout:
    $('.cart_checkout_btn').click(function () {
        var process_form = $(this).prev(),
            checkout_orders = $('.checkout_orders'),
            date_error = $('.date_error'),
            date_set = true,
            min_date = new Date(),
            past_dates = false,
            data = {
                'promo_code': $(".promo_code_input").val(),
                'orders': [],
                'restaurants': []
            };

        if (min_date.getHours() === 12 && min_date.getMinutes() >= 1 || min_date.getHours() > 12) {
            min_date.setDate (min_date.getDate() + 1);
        }

        min_date.setHours (0, 0, 0, 0);

        $('.restaurant-lunchboxes').each(function () {
            var lb_id = parseInt($(this).attr('data-lunchbox'));
            var qty = parseInt($(this).find('.lb-qty').val());
            var date = $(this).find('.cart_delivery_date');
            var restaurant_name = $(this).attr('restaurant-name');
            var min_order = $(this).attr('restaurant-min-order');

            if (!date.val()) {
                date.addClass('error');
                date_set = false;
            }
            else if (new Date (date.val()).getTime() < min_date.getTime()) {
                past_dates = true;
            }
            else {
                date.removeClass('error');
            }

            data.orders.push({
                'lb': lb_id,
                'qty': qty,
                'date': date.val()
            });

            function sumQtys (element) {
                if (element.restaurant === restaurant_name) element.qty += qty;
            };

            if (!data.restaurants.some(function(element){ return element.restaurant === restaurant_name; })) {
                data.restaurants.push ({
                    'restaurant': restaurant_name,
                    'minOrder': min_order,
                    'qty': qty
                });
            }
            else {
                data.restaurants.map (sumQtys);
            }
        });

        date_error.remove();

        var closed_restaurants = false;
        if ($(".date_error_msg").length > 0){
            $('.total').prepend("<p class='error_msg date_error'>" + gettext('There are restaurants closed on the selected delivery dates') + ".</p>");
            closed_restaurants = true;
        }

        if (!date_set) {
            $('.total').prepend("<a href='#footer' class='error_msg date_error'>" + gettext('Missing delivery dates of lunchboxes!') + "</a>");
        }

        var minimum_order = true;
        if (!data.restaurants.every(function (element) { return element.qty >= element.minOrder; })) {
            $('.total').prepend("<p class='error_msg date_error'>" + gettext('Check minimum order of lunchboxes!') + "</p>");
            minimum_order = false;
        }

        if (past_dates) {
            $('.total').prepend("<p class='error_msg date_error'>" + gettext('Invalid delivery date! Your order can be delivered from tomorrow') + ".</p>");
        }

        if (date_set && minimum_order && !past_dates && !closed_restaurants) {
            $(checkout_orders).val(JSON.stringify(data));
            process_form.submit();
        }
        else {
            document.getElementById('paymentModal').style.display = "none";
        }

    });


    $('.cart_delivery_date').change(function() {
        var lunchbox_id = '';
        if ($(this).attr('data-lunchbox-id') !== undefined) {
            lunchbox_id = $(this).attr('data-lunchbox-id');
        }

        var delivery_date = $(this).val();
        var that = $(this);

        if (delivery_date !== "") {
            $.ajax({
                beforeSend: function (xhr, settings) {
                    if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                        // Send the token to same-origin, relative URLs only.
                        // Send the token only if the method warrants CSRF protection
                        // Using the CSRFToken value acquired earlier
                        xhr.setRequestHeader("X-CSRFToken", csrftoken);
                    }
                },
                url: '/check_restaurant_availability/',
                type: 'POST',
                data: {
                    'lunchbox_id': lunchbox_id,
                    'delivery_date': delivery_date
                },
                success: function (data) {
                    if (that.next().hasClass('date_error_msg')) {
                        that.next().remove();
                    }

                    if (data.status === "error") {
                        var html = '';

                        if (lunchbox_id === '') {
                            html = "<p class='date_error_msg' style='line-height: 2;'>" + gettext('The following restaurants are closed on the selected date') + ": ";
                            html += data.closed_restaurants.join(', ') + "</p>";
                        }
                        else {
                            html = "<p class='date_error_msg' style='margin-bottom: -10px;'>" + gettext('The restaurant is closed on the selected date') + "</p>";
                        }

                        that.after(html);
                    }
                }
            });
        }
    });

    //Cart checkout:
    $('.catering_cart_checkout_btn').click(function () {
        var process_form = $(this).prev(),
            checkout_orders = $('.checkout_orders'),
            delivery_info = $('.delivery_info'),
            date_error = $('.date_error'),
            date_time = $('.datetimepicker').val(),
            min_date = new Date(),
            data = {
                'promo_code': $(".promo_code_input").val(),
                'orders': [],
                'restaurants': []
            };

        var $inputs = $('#catering_delivery_info :input');
        var values = {};
        $inputs.each(function() {
            values[this.name] = $(this).val();
        });

        if (min_date.getHours() === 12 && min_date.getMinutes() >= 1 || min_date.getHours() > 12) {
            min_date.setDate (min_date.getDate() + 1);
        }

        min_date.setHours (0, 0, 0, 0);

        $('.restaurant-lunchboxes').each(function () {
            var lb_id = parseInt($(this).attr('data-lunchbox')),
                qty = parseInt($(this).find('.lb-qty').val()),
                restaurant_name = $(this).attr('restaurant-name'),
                min_order = $(this).attr('restaurant-min-order');

            data.orders.push({
                'lb': lb_id,
                'qty': qty,
                'restaurant': restaurant_name,
                'date': date_time
            });

            function sumQtys (element) {
                if (element.restaurant === restaurant_name) element.qty += qty;
            }

            if (!data.restaurants.some(function(element){ return element.restaurant === restaurant_name; })) {
                data.restaurants.push ({
                    'restaurant': restaurant_name,
                    'minOrder': min_order,
                    'qty': qty
                });
            }
            else {
                data.restaurants.map (sumQtys);
            }
        });

        date_error.remove();

        var closed_restaurants = false;
        if ($(".date_error_msg").length > 0){
            var message = gettext('There are restaurants closed on the selected delivery date');
            $('.total').prepend("<p class='error_msg date_error'>" + message + ".</p>");
            closed_restaurants = true;
        }

        var valid_date = true;
        if (!date_time) {
            $('.total').prepend("<p class='error_msg date_error'>" + gettext('Missing delivery date and time of order!') + "</p>");
            valid_date = false;
        }
        else {
            var delivery_datetime = new Date(date_time);
            if (delivery_datetime.getTime() < min_date.getTime()) {
                $('.total').prepend("<p class='error_msg date_error'>" + gettext('Invalid delivery date. Your order can be delivered from tomorrow') + ".</p>");
                valid_date = false;
            }

            if (delivery_datetime.getHours() < 13 || (delivery_datetime.getHours() === 16 && delivery_datetime.getMinutes() > 0) || delivery_datetime.getHours() > 16) {
                $('.total').prepend("<p class='error_msg date_error'>" + gettext('Invalid delivery time. Orders can be delivered between 1pm - 4pm') + ".</p>");
                valid_date = false;
            }
        }

        var minimum_order = true;
        if (!data.restaurants.every(function(element){ return element.qty >= element.minOrder; })) {
            $('.total').prepend("<p class='error_msg date_error'>" + gettext('Check minimum order of lunchboxes!') + "</p>");
            minimum_order = false;
        }

        if (valid_date && minimum_order && !closed_restaurants) {
            $(checkout_orders).val(JSON.stringify(data));
            $(delivery_info).val(JSON.stringify(values));
            process_form.submit();
        }
        else {
            document.getElementById('paymentModal').style.display = "none";
        }

    });

    $('.service-rating').click(function () {
        var rating = $(this).attr('data-rating');
        var order_uuid = getUrlParameter('order-uuid');
        var thank_you_note = $(this).parent().parent().parent().children('.note');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/service_rating/',
            type: 'POST',
            data: {
                'order_uuid': order_uuid,
                'rating': rating
            },
            success: function (data) {
                if (data.status == "success") {
                    var html = "<p class='text-center rating-sent'>" + gettext('Rating sent!') + "</p>";
                    $(thank_you_note).prepend(html);
                    window.location.replace(window.location.protocol + "//" + window.location.host);
                }
            }
        });

    });

    if($('.paypal_form').length){
        $(window).load(function(){
            $('.paypal_form form').submit();
        });
    }

})();