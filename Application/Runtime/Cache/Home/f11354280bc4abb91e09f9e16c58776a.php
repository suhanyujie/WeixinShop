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
        <div class="title-fr">地址管理</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">        
        <div class="userblank"></div>
        <ul class="address_list">
        <?php if(is_array($address_list)): $i = 0; $__LIST__ = $address_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                <p><?php echo ($vo["consignee"]); ?>(<?php echo ($vo["mobile"]); ?>)</p>
                <p><?php echo ($vo["sheng"]); ?>&nbsp;<?php echo ($vo["shi"]); ?>&nbsp;<?php echo ($vo["qu"]); ?>&nbsp;<?php echo ($vo["address"]); ?></p>
                <p class="new_line"><br /></p>
                <p class="address_action">
                    <span class="edit"><a href="<?php echo U('User/editAddress',array('id'=>$vo['id']));?>"><i class="edit_icon"></i>编辑</a></span>
                    <span><a href="<?php echo U('User/address',array('id'=>$vo['id'],'type'=>'del'));?>" class="delete float_none"><i class="delete_icon"></i>删除</a></span>
                </p>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <div class="userblank"></div>
    </div>
    <div class="detail-bot">
        <div class="buy"><span class="nowbuy back">返回</span>
            &nbsp;&nbsp;<a href="<?php echo U('User/addAddress');?>" id="order118_action_cancel"><span class="nowbuy">增加地址</span></a>
        </div>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
$(function() {
    $('#header .back').click(function() {
        history.back();
    });
    $('#detail-bot .back').click(function() {
        history.back();
    });
});
</script>
</body>
</html>