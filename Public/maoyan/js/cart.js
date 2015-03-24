function drop_confirm(msg, url) {
    if (confirm(msg)) {
        window.location = url;
    }
}
/* 格式化金额 */
function price_format(price) {
    if (typeof(PRICE_FORMAT) == 'undefined') {
        PRICE_FORMAT = '&yen;%s';
    }
    price = number_format(price, 2);

    return PRICE_FORMAT.replace('%s', price);
}
function number_format(num, ext) {
    if (ext < 0) {
        return num;
    }
    num = Number(num);
    if (isNaN(num)) {
        num = 0;
    }
    var _str = num.toString();
    var _arr = _str.split('.');
    var _int = _arr[0];
    var _flt = _arr[1];
    if (_str.indexOf('.') == -1) {
        /* 找不到小数点，则添加 */
        if (ext == 0) {
            return _str;
        }
        var _tmp = '';
        for (var i = 0; i < ext; i++) {
            _tmp += '0';
        }
        _str = _str + '.' + _tmp;
    } else {
        if (_flt.length == ext) {
            return _str;
        }
        /* 找得到小数点，则截取 */
        if (_flt.length > ext) {
            _str = _str.substr(0, _str.length - (_flt.length - ext));
            if (ext == 0) {
                _str = _int;
            }
        } else {
            for (var i = 0; i < ext - _flt.length; i++) {
                _str += '0';
            }
        }
    }

    return _str;
}
function drop_cart_item(rec_id) {

    var tr = $('#cart_item_' + rec_id);
    var amount_span = $('#cart_amount');
    var cart_goods_kinds = $('#cart_goods_kinds');

    $.post("index.php?m=Shopcart&a=remove_cart_item", {
        itemId: rec_id
    }, function(data) {
        if (data.status == 1) {
            window.location.reload();
        }
    }, 'json');
}

function change_quantity(rec_id, input) {

    var subtotal_span = $('#item' + rec_id + '_subtotal');
    var amount_span = $('#cart_amount');
    //暂存为局部变量，否则如果用户输入过快有可能造成前后值不一致的问题
    var _v = input.value;
    // alert($(input).attr('changed')); 

    if (isNaN(input.value) || input.value < 1) {
        alert('请输入大于0的数字');
        //$(input).attr('changed', _v);
        $(input).val($(input).attr('changed'));
        return false;
    }

    $.post("index.php?m=Shopcart&a=change_quantity", {
        itemId: rec_id,
        quantity: _v
    }, function(data) {

        if (data.status == 1) {
            subtotal_span.html(price_format(data.item.price * data.item.num));
            amount_span.html(price_format(data.sumPrice));
            $(input).attr('changed', _v);
        } else {
            alert(data.msg);
            $(input).val($(input).attr('changed'));
            return false;
        }
    }, 'json');
}

function decrease_quantity(rec_id) {
    var item = $('#input_item_' + rec_id);
    var orig = Number(item.val());
    if (orig > 1) {
        item.val(orig - 1);
        item.attr('changed', orig);
        item.keyup();        
    }
}

function add_quantity(rec_id) {
    var item = $('#input_item_' + rec_id);

    var orig = Number(item.val());
    item.attr('changed', orig);
    item.val(orig + 1);
    item.keyup();
}
