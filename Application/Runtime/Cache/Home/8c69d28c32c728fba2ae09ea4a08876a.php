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
        <div class="title-fr"><?php echo ($cateInfo["name"]); ?></div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div class="plist clear clearfix">
        <div class="t"><?php echo ($cateInfo["name"]); ?></div>
        <ul class="list clear clearfix" id="products_list">
            <?php if(is_array($itemList)): $i = 0; $__LIST__ = $itemList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
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
        <div class="clearfix">
            <div id="J_wall_loading" class="tc gray" style="display:none;">
                <span><?php echo L('load_more');?></span>
            </div>
            <div id="J_wall_no_more_data" class="tc gray" style="display:none;">
                <span><?php echo L('no_more');?></span>
            </div>
            <?php if(isset($pageBar)): ?><div id="J_wall_page" style="display:none;">
                <div class="pageBar"><?php echo ($pageBar); ?></div>
            </div><?php endif; ?>
        </div>
    </div>
    <div class="bot_nav">
        <ul class="clear clearfix">
            <li class="item" src="<?php echo U('Index/index');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_home_normal.png" alt="猫眼商城" />
            </li>
            <li class="item cur" src="<?php echo U('Cate/showAllCategories');?>">
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
window.onload = function(){
    var p = <?php echo ($p); ?>;
    var totalPages = <?php echo ($totalPages); ?>;
    var hasPages = 0;
    var cid = <?php echo ($cid); ?>;
    <?php if(isset($pageBar)): ?>hasPages = 1;<?php endif; ?>
    if(hasPages) {
        var stop=false; 
        // The scroll event.
        $(window).scroll(function() {
            // When scroll at bottom, invoked getData() function.
            // We do not known why jQuery(window).height equals with jQuery(document).height
            var scrollPos; 
            if (typeof window.pageYOffset != 'undefined') { 
                scrollPos = window.pageYOffset; 
            } 
            else if (typeof document.compatMode != 'undefined' && 
            document.compatMode != 'BackCompat') { 
                scrollPos = document.documentElement.scrollTop; 
            } 
            else if (typeof document.body != 'undefined') { 
                scrollPos = document.body.scrollTop; 
            } 
            if (scrollPos + $(window).height() + 40 >= $(document).height()) {
                if (p < totalPages && !stop) {
                    stop = true;      // Blocks other loading data again.
                    $('#J_wall_loading').show();
                    var data = {
                        p: ++p, 
                        cid: cid, 
                        sort: '<?php echo ($sort); ?>', 
                        minPrice: <?php echo ($minPrice); ?>, 
                        maxPrice: <?php echo ($maxPrice); ?>
                    };
                    $.getJSON('<?php echo U('Cate/showCategoryProducts');?>', data, function(data){
                        stop = false;
                        $('#J_wall_loading').hide();
                        $('#products_list').append(data.info);
                    });
                }
                if(p == totalPages) {
                    $('#J_wall_loading').hide();
                    $('#J_wall_no_more_data').show();
                    return;
                }
            }
        });
    }
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
    $('li[src]').click(function(){
        location.href=$(this).attr('src');
    });
};
</script>
</body>
</html>