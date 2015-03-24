<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title><?php echo ($page_seo["title"]); ?></title>
    <meta name="keywords" content="<?php echo ($page_seo["keywords"]); ?>" />
    <meta name="description" content="<?php echo ($page_seo["description"]); ?>" />
    <meta name="viewport" content="width=device-width,minimum-scale=0.5,initial-scale=1.0,maximum-scale=2.0,user-scalable=0" />
    <meta content="telephone=yes" name="format-detection" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="/Public/maoyan/css/main.css?v=<?php echo time(); ?>">
    <script type="text/javascript" src="/Public/maoyan/js/zepto.js"></script>
    <script type="text/javascript" src="/Public/maoyan/js/plugins/zepto.selector.js"></script>
    <script type="text/javascript" src="/Public/maoyan/js/plugins/zepto.address.js"></script>
</head>
<body>
<div id="page-contents">
    <div id="header" class="clear clearfix">
        <div class="back"></div>
        <div class="title-fr">确认收货信息</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">
        <form method="POST" action="<?php echo U('Order/pay');?>" id="order_form" name="order_form">
            <div class="order_address_list">
                <h4 class="add_title">收货人地址</h4>
                <?php if(count($address_list)!=0){ ?>
                <?php if(is_array($address_list)): $i = 0; $__LIST__ = $address_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><ul class="receive_add address_item selected_address">
                    <li class="radio">
                        <input id="address_<?php echo ($vo["id"]); ?>" checked="checked" name="address_options" value="<?php echo ($vo["id"]); ?>" type="radio">
                    </li>
                    <li class="particular"><?php echo ($vo["sheng"]); ?>&nbsp;<?php echo ($vo["shi"]); ?>&nbsp;<?php echo ($vo["qu"]); ?>&nbsp;<?php echo ($vo["address"]); ?></li>
                    <li class="name">收货人姓名: <?php echo ($vo["consignee"]); ?></li>
                    <li class="mobile">手机号码:<?php echo ($vo["mobile"]); ?></li>
                </ul><?php endforeach; endif; else: echo "" ;endif; ?>
                <ul class="new_receive_add address_item">
                    <li class="radio">
                        <input name="address_options" id="use_new_address" value="0" type="radio">
                    </li>
                    <li class="particular">使用新的收货地址</li>
                </ul>
                <ul style="display: none;" class="fill_in_content" id="address_form">
                    <li>
                        <p class="title">收货人姓名</p>
                        <p>
                        <input value="" name="consignee" id="consignee" class="text" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">所在地区</p>
                        <p></p>
                        <div id="region">
                            <select name="sheng" id="s1"></select>
                            <select name="shi" id="s2"></select>
                            <select name="qu" id="s3"></select>
                        </div>
                        <p></p>
                    </li>
                    <li>
                        <p class="title">详细地址</p>
                        <p>
                        <input value="" name="address" id="address" class="text width1" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">手机号码</p>
                        <p>
                        <input value="" id="phone_mob" name="phone_mob" class="text" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">&nbsp;</p>
                        <p>
                        <label>
                            <input value="1" id="save_address" name="save_address" type="checkbox">&nbsp;自动保存收货地址
                            <span class="explain">&nbsp;(&nbsp;选择后该地址将会保存到您的收货地址列表&nbsp;)&nbsp;</span>
                        </label>
                        </p>
                    </li>
                </ul>
                <?php }else{ ?>
                <ul class="new_receive_add address_item">
                    <li class="radio">
                        <input checked='checked' name="address_options" id="use_new_address" value="0" type="radio">
                    </li>
                    <li class="particular">使用新的收货地址</li>
                </ul>
                <ul class="fill_in_content" id="address_form">
                    <li>
                        <p class="title">收货人姓名</p>
                        <p>
                        <input value="" name="consignee" id="consignee" class="text" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">所在地区</p>
                        <p></p>
                        <div id="region">
                            <select name="sheng" id="s1"></select>
                            <select name="shi" id="s2"></select>
                            <select name="qu" id="s3"></select>
                        </div>
                        <p></p>
                    </li>
                    <li>
                        <p class="title">详细地址</p>
                        <p>
                        <input value="" name="address" id="address" class="text width1" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">手机号码</p>
                        <p>
                        <input value="" id="phone_mob" name="phone_mob" class="text" type="text">
                        </p>
                    </li>
                    <li>
                        <p class="title">&nbsp;</p>
                        <p>
                        <label>
                            <input value="1" id="save_address" name="save_address" type="checkbox" checked="checked">&nbsp;自动保存收货地址
                            <span class="explain">&nbsp;(&nbsp;选择后该地址将会保存到您的收货地址列表&nbsp;)&nbsp;</span>
                        </label>
                        </p>
                    </li>
                </ul>
                <?php } ?>
            </div>
            <div class="order_delivery">
            <?php if($sumPrice<C('FREE_DELIVERY_AMOUNT')) {?>
            还差<span class="red">&yen;<?php echo (C('FREE_DELIVERY_AMOUNT') - $sumPrice); ?></span>包邮 全场满&yen;<?php echo C('FREE_DELIVERY_AMOUNT'); ?>免费配送<br />
            运费：&yen;<?php echo C('DELIVERY_FEE');?>
            <input type="hidden" id="delivery_fee" value="<?php echo C('DELIVERY_FEE');?>">
            <?php }else{ ?>
            猫眼承担运费
            <?php } ?>
            </div>
            <div class="message_box">
                <span class="add_title">给卖家的附言</span>
                <div class="message">
                    <textarea id="postscript" name="postscript" onclick="this.value='';">选填，可以告诉卖家您对商品的特殊需求，如颜色、尺码等</textarea>
                </div>
            </div>
            <div class="make_sure">
                <p class="order_amount">订单总价:
                    <strong class="fontsize3" id="order_amount">¥
                        <font id='order_amount2'>
                        <?php if($sumPrice<C('FREE_DELIVERY_AMOUNT')) { echo (C('DELIVERY_FEE') + $sumPrice); }else{ echo $sumPrice; } ?>
                        </font>
                    </strong>
                    <input class="btn1" onclick="$(this).parent('p').next().toggle();$('#coupon_sn').val('');" style="display:none" type="button">
                </p>
            </div>
            <input type="hidden" id="summoney" value="<?php echo ($sumPrice); ?>" />
        </form>
    </div>
    <div class="detail-bot">
        <div class="buy"><span class="nowbuy manageaddress">管理地址</span>&nbsp;&nbsp;<span class="nowbuy confirmorder">确认支付<span>&nbsp;&yen;<?php if($sumPrice<C('FREE_DELIVERY_AMOUNT')) { echo (C('DELIVERY_FEE') + $sumPrice); }else{ echo $sumPrice; } ?></span></span>&nbsp;&nbsp;<span class="addcart backcart">购物车</span></div>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function() {
    $('#header .back').click(function() {
        history.back();
    });
    $('.manageaddress').click(function(){
        location.href = '<?php echo U('User/address');?>';
    });
    $('.backcart').click(function(){
        location.href = '<?php echo U('Shopcart/index');?>';
    });
    $('input[name=address_options]').click(function() {
        if ($(this).val() == 0) {
            $('#address_form').show();
        } else {
            $('#address_form').hide();
        }
    });
    $.address("s1", "s2", "s3", "四川", "成都", "郫　县");

    function ordertj() {
        var addr_id = $("input[name='address_options']:checked").val();
        if (addr_id == 0) {
            var consignee = $.trim($('#consignee').val());
            var address = $.trim($('#address').val());
            var phone_mob = $.trim($('#phone_mob').val());
            var sheng = $.trim($('#s1').val());
            if (consignee == '') {
                alert('请输入收货人姓名');
                return false;
            }
            if (sheng == '') {
                alert('请选择所在地区');
                return false;
            }
            if (address == '') {
                alert('请输入详细地址');
                return false;
            }
            if (phone_mob == '') {
                alert('请输入手机号码');
                return false;
            }
            if (isNaN(phone_mob)) {
                alert('请输入正确的手机号码');
                return false;
            }
        }
        $('#order_form').get(0).submit();
    }
    $('.confirmorder').click(function(){
        ordertj();
    });
});
</script>
</body>
</html>