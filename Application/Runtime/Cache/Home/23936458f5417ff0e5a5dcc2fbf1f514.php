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
</head>
<body>
<div id="page-contents">
    <div id="header" class="clear clearfix">
        <div class="back"></div>
        <div class="title-fr">支付方式</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">
        <form action="<?php echo U('Order/end');?>" method="POST" id="goto_pay">
            <input type="hidden" name="orderId" value="<?php echo ($orderid); ?>" />
            <input type="hidden" name="dingdanhao" value="<?php echo ($dingdanhao); ?>" />
            <div class="step_main">
                <div class="clue_on"><h4>订单提交成功！</h4><p>您的订单已成功生成，选择您想用的支付方式进行支付</p></div>
                <div class="order_information">
                        <p>订单号：<span><?php echo ($dingdanhao); ?></span></p>订单总价：<span>¥<?php echo ($order_sumPrice); ?></span>
                </div>

                <div class="paymethod">
                    <h3>选择支付方式并付款</h3>
                    <dl class="defray">
                        <?php if($wxpaystatus or $alipaystatus == 1): ?><dt>在线支付</dt><?php endif; ?>
                        <?php if($alipaystatus == 1): ?><dd>
                            <p class="radio"><input checked='checked' id="payment_alipay" name="payment_id" value="1" type="radio"></p>
                            <p class="logo"><label for="payment_alipay"><img src="/Public/maoyan/images/zhi.png" ></label></p>
                            <p class="explain">国内最爱欢迎的支付方式，安全快捷！推荐方式。</p>
                        </dd><?php endif; ?>
                        <?php if($wxpaystatus == 1): ?><dd>
                            <p class="radio"><input checked='checked' id="payment_wxpay" name="payment_id" value="3" type="radio"></p>
                            <p class="logo"><label for="payment_wxpay"><img src="/Public/maoyan/images/wei.png" ></label></p>
                            <p class="explain">欢迎使用微信支付</p>
                        </dd><?php endif; ?>
                    </dl>
                    </if>
                    <dl class="defray">
                        <dt>线下支付（<a href="<?php echo U('Aboutus/index', array('id'=>10));?>">查看支持货到付款区域 </a>）</dt>
                        <dd>
                            <p class="radio"><input id="payment_cod" name="payment_id" value="2" type="radio" <?php if($wxpaystatus and $alipaystatus != 0): ?>checked<?php else: endif; ?>></p>
                            <p class="logo"><label for="payment_cod"><img  src="/Public/maoyan/images/huodao.png"></label></p>
                            <p class="explain">到付可选择现金或刷卡（请查看配送说明，除红光镇，高新西区部分区域支持货到付款，其他区域不支持）</p>
                        </dd>
                    </dl> 
                </div>
                <div class="clear"></div>
            </div>
        </form>
    </div>
    <div class="detail-bot">
        <div class="buy"><span class="nowbuy confirmorder">确认支付<span></div>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function() {
    $('#header .back').click(function() {
        history.back();
    });
    $('.confirmorder').click(function(){
        $('#goto_pay').submit();
    });
});
</script>
</body>
</html>