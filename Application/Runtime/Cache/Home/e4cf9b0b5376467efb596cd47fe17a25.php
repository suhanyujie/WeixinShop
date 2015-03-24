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
        <div class="content clear clearfix">
            <div class="logo"></div>  
            <div class="search-fr">
                <form class="clear clearfix" action="<?php echo U('Search/index');?>" method="get">                    
                    <div class="btn-box"><input type="submit" class="submit" value="<?php echo L('search');?>" /></div>
                    <div class="search"><input class="text-input" autocomplete="off" placeholder="<?php echo C('pin_default_keyword');?>" name="q"></div>
                    <input type="hidden" name="type" value="item">
                    <input type="hidden" name="m" value="Search">
                </form>
            </div>
        </div>              
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div class="slide" id="slide3">
        <ul>
            <?php if(is_array($ad)): $i = 0; $__LIST__ = $ad;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
                <a href="<?php echo ($vo["url"]); ?>">
                    <img title="<?php echo ($vo["desc"]); ?>" width="100%" src="data/upload/advert/<?php echo ($vo["content"]); ?>" />
                </a>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
        <div class="dot">
            <?php if(is_array($ad)): $k = 0; $__LIST__ = $ad;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><span></span><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
    </div>
    <div class="index-help">
        <ul class="clear clearfix">
            <li src="<?php echo U('User/followProduct');?>">
                <div class="main">
                    <div class="icon"><img src="/Public/maoyan/images/lib_story_icon_shelf_pressed.png" alt="我的关注" /></div>
                    <div class="text">我的关注</div>
                </div>
            </li>
            <li src="<?php echo U('User/index');?>">
                <div class="main">
                    <div class="icon"><img src="/Public/maoyan/images/lib_story_icon_my_normal.png" alt="订单查询" /></div>
                    <div class="text">订单查询</div>
                </div>
            </li>
            <li src="<?php echo U('Cate/showAllCategories');?>">
                <div class="main">
                    <div class="icon"><img src="/Public/maoyan/images/lib_story_icon_category_pressed.png" alt="商品分类" /></div>
                    <div class="text">商品分类</div>
                </div>
            </li>
            <li src="<?php echo U('Aboutus/index?id=10');?>">
                <div class="main">
                    <div class="icon"><img src="/Public/maoyan/images/bing_help.png" alt="配送说明" /></div>
                    <div class="text">配送说明</div>
                </div>
            </li>
        </ul>
    </div>
    <div class="plist clear clearfix">
        <div class="t">人气推荐</div>
        <ul class="list clear clearfix">
        <?php if(is_array($tuijian)): $i = 0; $__LIST__ = $tuijian;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
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
    <div class="plist clear clearfix">
        <div class="t">新品力荐</div>
        <ul class="list clear clearfix">
        <?php if(is_array($news)): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
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
    <div class="clear clearfix">
        <dl class="categories_tree clear clearfix">
        <?php if(is_array($categories)): $i = 0; $__LIST__ = $categories;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$category): $mod = ($i % 2 );++$i;?><dt class="dt clear clearfix">
                <span class="title"><?php echo ($category["name"]); ?></span> 
            </dt>
            <dd class="clear clearfix"></dd>
            <?php if(is_array($category["subCategories"])): $i = 0; $__LIST__ = $category["subCategories"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subCategory): $mod = ($i % 2 );++$i;?><dd class="dd">
                <div class="img"><a href="<?php echo ($subCategory["url"]); ?>" title="<?php echo ($subCategory["name"]); ?>"><img src="/data/upload/item_cate/<?php echo ($subCategory["img"]); ?>" alt="<?php echo ($subCategory["name"]); ?>" /></a></div>
                <div class="category_name"><a href="<?php echo ($subCategory["url"]); ?>" title="<?php echo ($subCategory["name"]); ?>"><?php echo ($subCategory["name"]); ?></a></div>
            </dd><?php endforeach; endif; else: echo "" ;endif; ?>
            <dd class="clear clearfix"></dd><?php endforeach; endif; else: echo "" ;endif; ?>
        </dl>
    </div>
    <?php if(is_array($categories)): $i = 0; $__LIST__ = $categories;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$category): $mod = ($i % 2 );++$i; if(is_array($category["subCategories"])): $i = 0; $__LIST__ = $category["subCategories"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subCategory): $mod = ($i % 2 );++$i;?><div class="plist clear clearfix hidefirst">
        <div class="t"><span class="m"><a href="<?php echo U('Cate/showCategoryProducts',array('cid'=>$subCategory['id']));?>">&gt;&gt;更多</a></span><?php echo ($subCategory["name"]); ?></div>
        <ul class="list clear clearfix">
        <?php $tag_item_class = new \Common\Pintag\itemTag;$lists = $tag_item_class->lists(array('type'=>'lists','return'=>'lists','cateid'=>$subCategory['id'],'num'=>'8','cache'=>'0',)); if(is_array($lists)): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li class="item">
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
    </div><?php endforeach; endif; else: echo "" ;endif; endforeach; endif; else: echo "" ;endif; ?>
    <div class="clear clearfix">
        <div id="J_wall_loading" class="tc gray">
            <span><?php echo L('load_more');?></span>
        </div>
        <div id="J_wall_no_more_data" class="tc gray" style="display:none;">
            <span><?php echo L('no_more');?></span>
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
    $('#slide3').swipeSlide({
        continuousScroll:true,
        speed : 3000,
        transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)'
    },function(i){
        $('.dot').children().eq(i).addClass('cur').siblings().removeClass('cur');
    });
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
    $('li[src]').click(function(){
        location.href=$(this).attr('src');
    });
    // 首页默认隐藏部分内容，滑动显示，避免首次打开太慢
    var stop=false; 
    // The scroll event.
    $(window).scroll(function() {
        if($('.hidefirst').length < 1) {
            $('#J_wall_loading').hide();
            $('#J_wall_no_more_data').show();
            return;
        }
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
            if (!stop) {
                stop = true;      // Blocks other loading data again.
                $('.hidefirst').eq(0).show().removeClass('hidefirst');
                stop = false;
            }
        }
    });
});
</script>
</body>
</html>