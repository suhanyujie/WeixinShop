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
        <div class="title-fr"><?php echo ($info["title"]); ?></div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div class="clear clearfix">
        <div class="about">
            <div class="about_top">
                <ul class="about_nav clearfix">
                    <?php $tag_article_class = new \Common\Pintag\articleTag;$about_nav = $tag_article_class->cate(array('type'=>'cate','cateid'=>'11','return'=>'about_nav','cache'=>'0',)); if(is_array($about_nav)): $i = 0; $__LIST__ = $about_nav;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><li <?php if($info['cate_id'] == $val['id']): ?>class="current"<?php endif; ?>><a href="<?php echo U('Aboutus/index', array('id'=>$val['id']));?>"><?php echo ($val["name"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
            <div class="about_content">
                <?php echo ($info["info"]); ?>
            </div>
        </div>
    </div>
    <div class="bot_nav">
        <ul class="clear clearfix">
            <li class="item cur" src="<?php echo U('Index/index');?>">
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
            <li class="item" src="<?php echo U('User/account');?>">
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
    $('li[src]').click(function(){
        location.href=$(this).attr('src');
    });
});
</script>
</body>
</html>