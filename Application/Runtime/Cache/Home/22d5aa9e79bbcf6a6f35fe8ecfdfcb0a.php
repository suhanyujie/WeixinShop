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
        <div class="title-fr">订单评价</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">        
        <div class="clear clearfix orders">
            <div class="clear clearfix orders-container">
                <?php if(!empty($items)): if(is_array($items)): $i = 0; $__LIST__ = $items;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="order_form">
                            <p class="num">订单号: <?php echo ($vo["orderId"]); ?></p>
                            <div class="con">
                                <p class="ware_pic">
                                    <a href="<?php echo U('Item/index',array('id'=>$vo['itemId']));?>">
                                        <img src="<?php echo attach(get_thumb($vo['img'], '_s'), 'item');?>" height="80" width="80">
                                    </a>
                                </p>
                                <p class="ware_text"><a href="<?php echo U('Item/index',array('id'=>$vo['itemId']));?>"><?php echo ($vo["title"]); ?></a>
                                </p>
                                <p class="price">价格:
                                    <span>¥<?php echo ($vo["price"]); ?></span>
                                </p>
                                <p class="amount">数量:
                                    <span><?php echo ($vo["quantity"]); ?></span>
                                </p>
                            </div>
                            <div class="clear"></div>
                            <div class="foot">
                                <div class="handle clear clearfix">
                                    <a href="<?php echo U('User/commentOrder',array('orderId'=>$vo['orderId'], 'itemId'=>$vo['itemId']));?>" id="order118_action_pay" class="btn">发表评价</a>
                                </div>
                            </div>
                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    <?php else: ?>
                    <div class="order_form member_no_records">
                        <span>没有符合条件的记录</span>
                    </div><?php endif; ?>
                <div class="clear"></div>
            </div>
        </div>
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