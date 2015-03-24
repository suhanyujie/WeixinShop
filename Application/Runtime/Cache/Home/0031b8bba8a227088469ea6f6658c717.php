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
</head>
<body>
<div id="page-contents">
    <div id="header" class="clear clearfix">
        <div class="back"></div>
        <div class="title-fr">取消订单</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">        
        <div class="userblank"></div>
        <form method="post" action="<?php echo U('Order/closeOrder');?>" >
            <div class="order_cancel_box">
                <h1>您是否确定要取消以下订单？</h1>
                <p>订单号:<span><?php echo ($orderId); ?></span></p>
                <dl>
                    <dt>取消原因:</dt>
                    <dd>
                        <div class="li"><input checked="checked" name="cancel_reason" id="d1" value="改选其他商品" type="radio"> <label for="d1">改选其他商品</label></div>
                        <div class="li"><input name="cancel_reason" id="d2" value="改选其他配送方式" type="radio"> <label for="d2">改选其他配送方式</label></div>
                        <div class="li"><input name="cancel_reason" id="d3" value="改选其他卖家" type="radio"> <label for="d3">改选其他卖家</label></div>
                        <div class="li"><input name="cancel_reason" flag="other_reason" id="d4" value="其他原因" type="radio"> <label for="d4">其他原因</label></div>
                    </dd>
                    <dd id="other_reason" style="display:none">
                        <textarea class="text" id="other_reason_input" style="width:200px;" name="remark"></textarea>
                    </dd>
                </dl>
            </div>
            <div class="btn">
               <input type="hidden" name="orderId" value="<?php echo ($orderId); ?>" >
                <input id="confirm_button" style="display:hidden;" class="btn1 enter" value="确认" type="submit">
            </div>
         
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
        location.href = '<?php echo U('User/index');?>';
    });
    $('.detail-bot .back').click(function() {
        history.back();
    });
    $('#confirm').click(function(){
        $('#submit').click();
    });
});
</script>
</body>
</html>