    function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            // Does this cookie string begin with the name we want?
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}
var csrftoken = getCookie('csrftoken');


    var cart = {
    add: function (pk, quantity) {
      quantity = quantity || 1
      return $.post(URLS.addItem, {pk: pk, quantity: quantity,csrfmiddlewaretoken:csrftoken,date:"10/07/2017",time:"09:50"}, 'json')
    },

    remove: function (itemPK) {
      return $.post(URLS.removeItem, {pk: itemPK,csrfmiddlewaretoken:csrftoken}, 'json')
    },

    changeQuantity: function (pk, quantity) {
      return $.post(URLS.changeQuantity, {pk: pk, quantity: quantity,csrfmiddlewaretoken:csrftoken}, 'json')
    },

    empty: function () {
      $.post(URLS.emptyCart,{csrfmiddlewaretoken:csrftoken}, 'json')
    }
    };

