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
        <div class="title-fr">我的猫眼</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">
        <div class="profile clear clearfix">
            <div class="avatar"><img src="/Public/maoyan/images/android_user_no_image.png" /></div>
            <div class="information">
                <div class="username"><?php echo ($userinfo["mobile"]); ?></div>
                <div class="usergroup">普通用户</div>
                <div class="regtime"><?php echo (date("Y-m-d H:i",$userinfo["reg_time"])); ?></div>
            </div>
        </div>
        <div class="userblank"></div>
        <div class="navlist">
            <div class="main">
                <div class="item"><a href="<?php echo U('User/index');?>"><img src="/Public/maoyan/images/android_my_jd_blank_note.png" />我的订单</a></div>
                <div class="item"><a href="<?php echo U('User/followProduct');?>"><img src="/Public/maoyan/images/android_my_jd_collects.png" />我的关注</a></div>
                <div class="item"><a href="<?php echo U('User/address');?>"><img src="/Public/maoyan/images/android_my_jd_appoint.png" />地址管理</a></div>
                <div class="item"><a href="<?php echo U('User/commentOrdersList');?>"><img src="/Public/maoyan/images/android_my_jd_discuss.png" />订单评价</a></div>
                <div class="item"><a href="<?php echo U('User/password');?>"><img src="/Public/maoyan/images/android_my_jd_account_safe.png" />修改密码</a></div>
            </div>
        </div>
        <div class="userblank"></div>
    </div>
    <div class="bot_nav">
        <ul class="clear clearfix">
            <li class="item" src="<?php echo U('Index/index');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_home_normal.png" alt="猫眼商城" />
            </li>
            <li class="item" src="<?php echo U('Cate/showAllCategories');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_category_normal.png" alt="商品分类" />
            </li>
            <li class="item" src="<?php echo U('Search/index?type=item');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_search_normal.png" alt="搜索" />
            </li>
            <li class="item cart" src="<?php echo U('Shopcart/index');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_cart_normal.png" alt="购物车" />
            </li>
            <li class="item cur" src="<?php echo U('User/account');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_personal_normal.png" alt="我的账户" />
            </li>
        </ul>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function() {
    $('#header .back').click(function() {
        history.back();
    });
    $('li[src]').click(function(){
        location.href=$(this).attr('src');
    });
});
</script>
</body>
</html>