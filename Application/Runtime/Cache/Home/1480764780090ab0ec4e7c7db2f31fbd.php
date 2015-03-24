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
        <div class="title-fr">我的订单</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div id="content" class="clear clearfix">
        <div class="order-status-tab">
            <div class="content clear clearfix">
                <div class="tab <?php if($status == 1): ?>cur<?php endif; ?> "><a href="<?php echo U('User/index',array('status'=>1));?>">待付款</a>
                </div>
                <div class="tab <?php if($status == 2): ?>cur<?php endif; ?> "><a href="<?php echo U('User/index',array('status'=>2));?>">待发货</a>
                </div>
                <div class="tab <?php if($status == 3): ?>cur<?php endif; ?>"><a href="<?php echo U('User/index',array('status'=>3));?>">待收货</a>
                </div>
                <div class="tab <?php if($status == 4): ?>cur<?php endif; ?>"><a href="<?php echo U('User/index',array('status'=>4));?>">已完成</a>
                </div>
            </div>
        </div>
        <div class="clear clearfix orders">
            <div class="clear clearfix orders-container">
                <?php if(!empty($item_orders)): if(is_array($item_orders)): $i = 0; $__LIST__ = $item_orders;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><div class="order_form">
                            <p class="num">订单号: <?php echo ($vo["orderId"]); ?></p>
                            <?php if(is_array($vo["item"])): $i = 0; $__LIST__ = $vo["item"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><div class="con">
                                    <p class="ware_pic">
                                        <a href="<?php echo U('Item/index',array('id'=>$item['itemId']));?>">
                                            <img src="<?php echo attach(get_thumb($item['img'], '_b'), 'item');?>" height="80" width="80">
                                        </a>
                                    </p>
                                    <p class="ware_text"><a href="<?php echo U('Item/index',array('id'=>$item['itemId']));?>"><?php echo ($item["title"]); ?></a>
                                        <br>
                                        <span class="attr"></span>
                                    </p>
                                    <p class="price">价格:
                                        <span>¥<?php echo ($item["price"]); ?></span>
                                    </p>
                                    <?php if(is_array($item["attr"])): $i = 0; $__LIST__ = $item["attr"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$attr): $mod = ($i % 2 );++$i;?><p class="price"><?php echo ($attr["name"]); ?>:
                                            <span><?php echo ($attr["value"]); ?></span>
                                        </p><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <p class="amount">数量:
                                        <span><?php echo ($item["quantity"]); ?></span>
                                    </p>
                                </div><?php endforeach; endif; else: echo "" ;endif; ?>
                            <div class="clear"></div>
                            <div class="foot">
                                <p class="time">下单时间: <?php echo (date('Y-m-d H:i:s',$vo["add_time"])); ?></p>
                                <div class="handle clear clearfix">
                                    <div class="order-price">订单总价: <b>¥<?php echo ($vo["order_sumPrice"]); ?></b></div>
                                    <div class="clear clearfix"></div>
                                    <div class="clear clearfix">
                                    <?php switch($vo["status"]): case "1": ?><!--待付款 -->
                                            <a href="<?php echo U('Order/pay',array('orderId'=>$vo['orderId']));?>" class="btn">付款</a>
                                            <a href="<?php echo U('Order/cancelOrder',array('orderId'=>$vo['orderId']));?>" class="btn">取消订单</a>
                                            <a href="<?php echo U('Order/checkOrder',array('orderId'=>$vo['orderId'],'status'=>$status));?>" class="btn">查看订单</a><?php break;?>
                                        <?php case "2": ?><!--待发货 -->
                                            <a href="<?php echo U('Order/cancelOrder',array('orderId'=>$vo['orderId']));?>" class="btn">取消订单</a>
                                            <a href="<?php echo U('Order/checkOrder',array('orderId'=>$vo['orderId'],'status'=>$status));?>">查看订单</a><?php break;?>
                                        <?php case "3": ?><!-- 待收货 -->
                                            <a href="<?php echo U('Order/confirmOrder',array('orderId'=>$vo['orderId'],'status'=>$status));?>" class="btn">确认收货</a>
                                            <a href="<?php echo U('Order/checkOrder',array('orderId'=>$vo['orderId'],'status'=>$status));?>" class="btn">查看订单</a><?php break;?>
                                        <?php default: ?>
                                        <a href="<?php echo U('Order/checkOrder',array('orderId'=>$vo['orderId'],'status'=>$status));?>" class="btn">查看订单</a><?php endswitch;?>
                                    </div>
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
        <div class="no-orders" style="display:none;">
            您目前还没有已生成的订单
            <br>去<a href="/">商城首页</a>，挑选喜爱的商品，体验购物乐趣吧。
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