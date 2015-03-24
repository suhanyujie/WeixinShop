<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<title><?php echo L('message_title');?></title>
<meta name="keywords" content="<?php echo ($page_seo["keywords"]); ?>" />
<meta name="description" content="<?php echo ($page_seo["description"]); ?>" />
<meta name="viewport" content="width=device-width,minimum-scale=0.5,initial-scale=1.0,maximum-scale=2.0,user-scalable=0" />
<meta content="telephone=yes" name="format-detection" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/Public/maoyan/css/main.css?v=<?php echo time(); ?>">
<script type="text/javascript" src="/Public/maoyan/js/zepto.js"></script>
<script type="text/javascript" src="/Public/maoyan/js/plugins/swipeSlide.min.js"></script>
</head>
<body>
<div id="page-contents">
    <div id="header" class="clear clearfix">
        <div class="back"></div>
        <div class="title-fr">猫眼商城</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div class="clear clearfix">
        <div class="main_wrap">
            <div class="msg_wrap">
                <div class="message_box">
                    <div class="msg_error">
                        <p><?php echo ($message); ?></p>
                        <p class="msg_btnleft"><a href="<?php echo ($jumpUrl); ?>"><?php echo L('msg_jump_desc');?></a></p>
                    </div>
                    <script language="javascript">
                        setTimeout("location.href='<?php echo ($jumpUrl); ?>';",<?php echo ($waitSecond); ?>*1000);
                    </script>
                </div>
            </div>
        </div>
    </div>    
    <div class="bot_nav">
        <ul class="clear clearfix">
            <li class="item">
                <img src="/Public/maoyan/images/main_bottom_tab_home_normal.png" alt="猫眼商城" />
            </li>
            <li class="item cur">
                <img src="/Public/maoyan/images/main_bottom_tab_category_normal.png" alt="商品分类" />
            </li>
            <li class="item">
                <img src="/Public/maoyan/images/main_bottom_tab_search_normal.png" alt="搜索" />
            </li>
            <li class="item cart">
                <img src="/Public/maoyan/images/main_bottom_tab_cart_normal.png" alt="购物车" />
            </li>
            <li class="item">
                <img src="/Public/maoyan/images/main_bottom_tab_personal_normal.png" alt="我的账户" />
            </li>
        </ul>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function(){
    $('#header .back').click(function(){
        history.back();
    });
});
</script>
</body>
</html>