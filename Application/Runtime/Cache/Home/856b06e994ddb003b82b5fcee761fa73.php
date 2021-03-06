<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>
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
        <div class="title-fr">添加地址</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">        
        <div class="userblank"></div>
        <form method="post" action="<?php echo U('User/addaddress');?>" id="address_form">
            <ul class="padding-content" id="address_form">
                <li>
                    <p class="title">收货人姓名</p>
                    <p>
                    <input value="" name="consignee" id="consignee" class="text" type="text" required="required" />
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
                    <input value="" name="address" id="address" class="text width1" type="text" required="required" />
                    </p>
                </li>
                <li>
                    <p class="title">手机号码</p>
                    <p>
                    <input value="" id="phone_mob" name="phone_mob" class="text" type="text" required="required" />
                    </p>
                </li>
            </ul>
            <input type="submit" id="submit" style="display:none;">
        </form>
        <div class="userblank"></div>
    </div>
    <div class="detail-bot">
        <div class="buy">
            &nbsp;&nbsp;<span class="nowbuy" id="confirm">确认</span>
            <span class="nowbuy back">返回</span>
        </div>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function() {
    $('#header .back').click(function() {
        location.href = '<?php echo U('User/address');?>';
    });
    $('.detail-bot .back').click(function() {
        history.back();
    });
    $.address("s1", "s2", "s3", "四川", "成都", "郫　县");
    $('#confirm').click(function(){
        $('#submit').click();
    });
});
</script>
</body>
</html>