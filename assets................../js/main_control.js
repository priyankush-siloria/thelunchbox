$(document).ready(function () {
    var files = [];

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

    $('.upload_image').on('click', function (e) {
        e.preventDefault();
        var el_class = $(this).attr('data-class');
        $('.upload_btn-' + el_class).children('.image_upload_btn').click();
    });

    //Image preview function
    function readURL(input, pre) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $(pre).attr({
                    'src': e.target.result
                });
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $(document).on('change', '.image_upload_btn', function (e) {
        if (!($(this).parent().parent().find('.preview').length > 0)) {
            var image = "<img src='' class='preview'/>";
            $(this).parent().parent().find('.upload_image').append(image);
        }
        var pre = $(this).parent().parent().find('.preview');

        readURL(this, pre, e);

        pre.css('display', 'block');
    });


    if ($('.timepicker').length || $('.datepicker').length) {
        $('.timepicker').datetimepicker({
            datepicker: false,
            format: 'H:i',
            theme: 'dark'
        });

        $('.datepicker').datetimepicker({
            timepicker: false,
            format: 'M d Y',
            theme: 'dark'
        });
    }

    $('.nutrition-facts li a').click(function (e) {
        e.preventDefault();

        var sclass = $(this).attr('data-class'),
            shtml = $('.nutrition-choices .' + sclass).clone(),
            block_name = sclass.split('_').length > 1 ? sclass.split('_')[0] + ' ' + sclass.split('_')[1] : sclass.split('_')[0],
            main_block = $('.lunchbox_nutrition-facts'),
            phtml = "<li class='" + sclass + "'><p>" + block_name + "</p></li>";

        if (!$(main_block).children('.' + sclass)[0]) {
            $(main_block).append(phtml);
            $(main_block).children('.' + sclass).append(shtml);
        } else {
            $(main_block).children('.' + sclass).append(shtml);
        }
    });

    $('.lb-desc').focus(function () {
        $(this).text('');
    });

    $(document).on('click', '.remove-nutrition', function (e) {
        e.preventDefault();
        if ($(this).parent().parent().parent().find('.trans_select_box_wrapper').length > 1) {
            $(this).parent().remove();
        } else {
            $(this).parent().parent().remove();
        }
    });

    $(document).on('click', '.lunchbox_submit_btn', function (e) {
        e.preventDefault();

        var nutrition_facts = {};
        $('.lunchbox_nutrition-facts').children('li').each(function () {
            var key_name = $(this).attr('class');

            if (!(key_name in nutrition_facts)) {
                nutrition_facts[key_name] = [];
            }

            $(this).children('.trans_select_box_wrapper').each(function () {
                nutrition_facts[$(this).attr('data-class')].push({
                    id: $(this).find('select').val(),
                    val: $(this).find('input[name="value"]').val()
                });
            });
        });

        $('.nf_input').val(JSON.stringify(nutrition_facts));
        $('.lunchbox_form').submit()
    });

    $('.lunchboxTabs a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');

        var lunchbox_id = parseInt($(this).attr('data-id')),
            cb_content = $('.communication_box_content');

        if (cb_content.length) {
            $.ajax({
                beforeSend: function (xhr, settings) {
                    if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                        // Send the token to same-origin, relative URLs only.
                        // Send the token only if the method warrants CSRF protection
                        // Using the CSRFToken value acquired earlier
                        xhr.setRequestHeader("X-CSRFToken", csrftoken);
                    }
                },
                url: '/get_lunchbox_admin_messages/',
                type: 'POST',
                data: {
                    'lunchbox': lunchbox_id
                },
                success: function (data) {
                    cb_content.html('');

                    if (data.data['photoshoot_requested']) {
                        cb_content.append("<p>" + gettext('Photoshoot requested') + ": " + data.data['photoshoot_requested'] + "</p><br>");
                    }

                    if (data.data['msg']) {
                        cb_content.append("<p>" + data.data['msg'] + "</p><br>");
                    }

                }
            });
        }
    });

    $('.lunchboxTabs a:first').click();


    $('.restaurant_submit_btn').click(function (e) {
        e.preventDefault();

        var dict = {};

        $('.city_delivery').each(function () {
            dict[parseInt($(this).attr('id'))] = $(this).is(':checked');
        });

        $('.delivery_to').val(JSON.stringify(dict));

        $('.restaurant_edit_form').submit();
    });

    $('.order-status-check').click(function () {
        var order_item_id = $(this).attr('data-id');
        var order_status = $(this).attr('data-status');
        var parent = $(this).parent().parent().parent();

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/control/set_order_process_status/',
            type: 'POST',
            data: {
                'order_item_id': order_item_id,
                'status': order_status
            },
            success: function (data) {
                var html = "";

                if (parent.hasClass('status_info')) {
                    parent.removeClass('status_info').addClass('status_default_steps');
                    if (order_status === "2") {
                        html = "<strong>" + gettext('Request payment') + ":</strong> " + gettext('not available yet');
                    }
                    else if (order_status === "3") {
                        html = "<strong>" + gettext('To be confirmed by La Fiambrera') + "</strong>"
                    }
                    else if (order_status === "4") {
                        html = "<strong>" + gettext('Payment') + "</strong>";
                    }
                }
                else if (order_status !== "1") {
                    if (order_status === "2") {
                        html = "<strong>" + gettext('Payment requested') + ": </strong>" + data['data']['date'];
                    }
                    else if (order_status === "3") {
                        html = "<strong>" + gettext('Confirmed') + ": </strong> " + data['data']['date'];
                    }
                    else if (order_status === "4") {
                        html = "<strong>" + gettext('Transferred') + ": </strong>" + data['data']['date'];
                    }

                    parent.removeClass('status_default_steps').addClass('status_info');
                }

                parent.children('.col-md-14').html(html)
            }
        });
    });

    $('.priority-check').click(function (e) {
        var msg_id = $(this).parents('.notification_priority').attr('data-id'),
            idd = $(this).parents('.notification_priority').attr('data-idd'),
            priority = $(this).attr('data-priority'),
            msg_block = $(this).parents('.notification_msg'),
            parent = $(this).parent().parent(),
            lb_msg_type = 0;

        if ($(this).parents('.notification_msg').hasClass('lb-admin-msg')) {
            lb_msg_type = 1;
        }

        if ($(this).parents('.notification_msg').hasClass('lb-order-msg')) {
            lb_msg_type = 2;
        }

        msg_block.removeClass('status_default');
        if (priority == 1) {
            if (msg_block.hasClass('high-priority')) {
                msg_block.removeClass('high-priority').addClass('status_default');
                priority = 4;
            }
            else {
                parent.children('.less-priority').children('.priority-check').prop('checked', false);
                parent.children('.low-priority').children('.priority-check').prop('checked', false);
            }
        } else if (priority == 2) {
            if (msg_block.hasClass('less-priority')) {
                msg_block.removeClass('less-priority').addClass('status_default');
                priority = 4;
            }
            else {
                parent.children('.high-priority').children('.priority-check').prop('checked', false);
                parent.children('.low-priority').children('.priority-check').prop('checked', false);
            }
        } else if (priority == 3) {
            if (msg_block.hasClass('low-priority')) {
                msg_block.removeClass('low-priority').addClass('status_default');
                priority = 4;
            }
            else {
                parent.children('.high-priority').children('.priority-check').prop('checked', false);
                parent.children('.less-priority').children('.priority-check').prop('checked', false);
            }
        }

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/control/set_msg_priority/',
            type: 'POST',
            data: {
                'msg_id': msg_id,
                'idd': idd,
                'priority': priority,
                'lb_msg_type': lb_msg_type
            },
            success: function (data) {
                if (data.data.msg == "success") {
                    if (priority == 1) {
                        msg_block.removeClass('low-priority').removeClass('less-priority').addClass('high-priority');
                    } else if (priority == 2) {
                        msg_block.removeClass('high-priority').removeClass('low-priority').addClass('less-priority');
                    } else if (priority == 3) {
                        msg_block.removeClass('high-priority').removeClass('less-priority').addClass('low-priority');
                    }
                }
            }
        });

    });

    $('.btn-reply').click(function () {
        if (!$(this).hasClass('clicked')) {
            $(this).addClass('clicked');
        } else {
            $(this).removeClass('clicked');
        }
        $(this).parents('.notification_msg').children('.notification_reply').fadeToggle();
    });

    $('.notification_reply button').click(function () {
        var msgs = $(this).parent().children('.msgs'),
            msg = $(this).parent().children('.msg'),
            btn = $(this),
            admin_reply = 0,
            lb = $(this).parents('.notification_msg').attr('data-lb'),
            mid = $(this).parents('.notification_msg').attr('data-mid'),
            uid = $(this).parents('.notification_msg').attr('data-u'),
            parent = $(this).parents('.notification_msg');

        if ($(this).parent().hasClass('a_reply')) {
            admin_reply = 1;
        }

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/restaurant_reply/',
            type: 'POST',
            data: {
                'uid': uid,
                'mid': mid,
                'lb': lb,
                'admin_reply': admin_reply,
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
                $(msg).remove();
                $(btn).remove();

                setTimeout(function () {
                    $(parent).remove();
                }, 2000);
            }
        });
    });

    $('.communication_box_with_restaurant button').click(function () {
        var msgs = $(this).parent().children('.restaurant-lunchbox-msgs'),
            msg = $(this).parent().children('.msg'),
            admin_reply = 1,
            lb = $(this).parent().attr('data-lb');

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/restaurant_reply/',
            type: 'POST',
            data: {
                'lb': lb,
                'admin_reply': admin_reply,
                'msg': $(msg).val()
            },
            success: function (data) {
                var html = "<strong>" + data['user'] + "</strong>" +
                    "<div class='clearfix'></div>" +
                    "<span>" + data['date'] + "</span>" +
                    "<p>" + msg.val() + "</p>\n";
                $(msgs).prepend(html);
                $(msg).val('');
            }
        });
    });


    $('.archive_notification').click(function () {
        var mid = $(this).parents('.notification_msg').attr('data-mid'),
            uid = $(this).parents('.notification_msg').attr('data-u'),
            parent = $(this).parents('.notification_msg'),
            lb_msg_type = 0;

        if ($(this).hasClass('lb-admin-msg')) {
            lb_msg_type = 1;
        }

        if ($(this).hasClass('lb-order-msg')) {
            lb_msg_type = 2;
        }

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/archive_notification/',
            type: 'POST',
            data: {
                'uid': uid,
                'mid': mid,
                'lb_msg_type': lb_msg_type
            },
            success: function (data) {
                console.log(data);
                if (data['msg'] == 'Success!') {
                    setTimeout(function () {
                        $(parent).remove();
                    }, 500);
                }
            }
        });
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

    $('.cb-chat button').click(function () {
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
            url: '/communication_with_restaurant/',
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
                $(msgs).prepend(html);
                //$(msgs).animate({scrollTop: $(msgs)[0].scrollHeight});
                $(msg).val('');
            }
        });
    });

    $('.rm-btn').click(function (e) {
        e.preventDefault();
        var btns = $(this).parents('.restaurants').find('.remove_restaurant');
        if (!$(this).hasClass('clicked')) {
            btns.fadeIn();
            $(this).addClass('clicked');
        } else {
            btns.fadeOut();
            $(this).removeClass('clicked');
        }
    });

    $('.remove_restaurant').click(function (e) {
        e.preventDefault();
        var resid = $(this).attr('data-res'),
            item = $(this).parent();

        $.ajax({
            beforeSend: function (xhr, settings) {
                if (!csrfSafeMethod(settings.type) && sameOrigin(settings.url)) {
                    // Send the token to same-origin, relative URLs only.
                    // Send the token only if the method warrants CSRF protection
                    // Using the CSRFToken value acquired earlier
                    xhr.setRequestHeader("X-CSRFToken", csrftoken);
                }
            },
            url: '/control/remove_restaurant/',
            type: 'POST',
            data: {
                'res_id': resid
            },
            success: function (data) {
                if (data.data.msg == "success") {
                    $(item).remove();
                }
            }
        });
    });

    var images_for_del = [];

    $('.remove_icon').click(function (e) {
        e.preventDefault();
        e.stopPropagation();

        var image_id = $(this).data('image'),
            images_del_input = $('.images_del'),
            deleted_html = "<div class='deleted_image'><span class='glyphicon glyphicon-remove'></span></div>";

        if ($.inArray(image_id, images_for_del) < 0) {
            images_for_del.push(image_id);
            $(this).parent().append(deleted_html);
        } else {
            images_for_del = $.grep(images_for_del, function (value) {
                return value != image_id;
            });
            $(this).parent().find('.deleted_image').remove();
        }

        images_del_input.val(images_for_del);
    });

    var pcodes_for_del = [];

    $('.remove_promo_code').click(function (e) {
        e.preventDefault();
        e.stopPropagation();

        var pcode_id = $(this).data('code'),
            pcodes_del_input = $('.pcodes_del');

        if ($.inArray(pcode_id, pcodes_for_del) < 0) {
            pcodes_for_del.push(pcode_id);
            $(this).parent().css('text-decoration', 'line-through');
        } else {
            pcodes_for_del = $.grep(images_for_del, function (value) {
                return value != pcode_id;
            });
            $(this).parent().css('text-decoration', 'none');
        }

        pcodes_del_input.val(pcodes_for_del);

    });

    //Admin control active links:
    var curr_href = window.location.pathname;
    $("a[href='"+curr_href+"']").addClass('active');
    if(curr_href.match(/^\/control\/restaurant\/\d\/$/gm)){
        $('#admin_restaurant_info').addClass('active');
    } else if(curr_href.match(/^\/control\/restaurant\/\d\/lunchbox\/create\/$/gm)){
        $('#admin_create_lunchbox').addClass('active');
    } else if(curr_href.match(/^\/control\/restaurant\/\d\/published_lunchboxes\/$/gm)){
        $('#admin_create_lunchbox').addClass('active');
    } else if(curr_href.match(/^\/control\/restaurant\/\d\/saved_lunchboxes\/$/gm)){
        $('#admin_create_lunchbox').addClass('active');
    } else if(curr_href.match(/^\/control\/restaurant\/\d\/archived_lunchboxes\/$/gm)){
        $('#admin_create_lunchbox').addClass('active');
    } else if(curr_href.match(/^\/control\/restaurant\/\d\/contract\/$/gm)){
        $('#admin_contract').addClass('active');
    }

});