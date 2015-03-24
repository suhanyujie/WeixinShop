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
        你访问的产品不存在，或已经卖光下架了！
    </div>
    <div class="plist clear clearfix">
        <div class="t">猜你喜欢</div>
        <ul class="list clear clearfix">
        <?php $tag_item_class = new \Common\Pintag\itemTag;$lists = $tag_item_class->lists(array('type'=>'lists','return'=>'lists','cateid'=>$categories[0]['id'],'num'=>'8','cache'=>'0',)); if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
                <div class="main">
                    <div class="img">
                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>">
                            <img src="<?php echo attach(get_thumb($item['img'], '_b'), 'item');?>">
                        </a>
                    </div>
                    <h3 class="pname">
                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"><?php echo ($item["title"]); ?></a>
                    </h3>
                    <p class="price">猫眼价：¥<?php echo ($item["price"]); ?></p>
                </div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
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
    setInterval(function(){
        var plist = $('.plist');
        $.each(plist, function(n, c){
            var productListImages = $(c).find('.item a img');
            for (var i = 0; i < productListImages.length; i = i+2) {
                var i1 = productListImages.get(i);
                var i2 = productListImages.get(i+1);
                var l1 = $(i1).height();
                var l2 = $(i2).height();
                var l = l1 > l2 ? l1 : l2;
                if(l > 0)
                {  
                    $(i1).height(l);
                    $(i2).height(l);
                }
            }
        });
    }, 500);
    $('#header .back').click(function(){
        history.back();
    });
});
</script>
</body>
</html>