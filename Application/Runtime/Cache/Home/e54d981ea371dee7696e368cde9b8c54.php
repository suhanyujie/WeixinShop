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
        <div class="title-fr">商品详情</div>
        <div class="cart">
            <div class="num" id="cartnum"><?php echo ($cartnum); ?></div>
        </div>
    </div>
    <div id="header-placeholder">&nbsp;</div>
    <div class="clear clearfix">
        <div id="picScroll" class="picScroll">
            <div class="hd"></div>
            <div class="bd clear clearfix">
                <ul class="clear clearfix">
                    <?php if(is_array($img_list)): $i = 0; $__LIST__ = $img_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$img): $mod = ($i % 2 );++$i;?><li>
                        <a href="<?php echo attach(get_thumb($img['url'], '_b'),'item');?>">
                            <img src="<?php echo attach(get_thumb($img['url'], '_s'), 'item');?>" />
                        </a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <input type="hidden" value="<?php echo ($item["id"]); ?>" id="goodId" />
        <input type="hidden" value="<?php echo ($item["price"]); ?>" id="price" />
        <div id="product-detail" class="clear clearfix">
            <div class="line pname"><h2><?php echo ($item["title"]); ?></h2></div>
            <div class="line price">¥<?php echo ($item["price"]); ?></div>
            <?php if($attr_list != ''): if(is_array($attr_list)): $i = 0; $__LIST__ = $attr_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><div class="line">
                <span><?php echo ($val["attr_name"]); ?>&nbsp;&nbsp;</span>
                <input type="hidden" name="<?php echo ($val["attr_name"]); ?>" value="<?php echo ($val["attr_name"]); ?>" class="letterprice attr_name_<?php echo ($i); ?>">
                <select class="attr_<?php echo ($i); ?>" name="attr">
                    <?php if(is_array($val['name_v'])): foreach($val['name_v'] as $key=>$v): ?><option value="<?php echo ($v); ?>"><?php echo ($v); ?></option><?php endforeach; endif; ?>
                </select>
            </div><?php endforeach; endif; else: echo "" ;endif; endif; ?>
            <div class="line"><span>品牌&nbsp;&nbsp;</span><?php echo ($item["brand"]); ?></div>
            <div class="line"><span>售出&nbsp;&nbsp;</span><?php echo ($item["buy_num"]); ?>件</div>
            <div class="line"><span>配送&nbsp;&nbsp;</span>红光镇城区，高新西区部分小区免费配送到家</div>
            <div class="buynum"><span class="less">-</span><input type="text" value="1" id="quantity" name="quantity" class="text buynuminput" onafterpaste="this.value=this.value.replace(/\D/g,'')" onKeyUp="this.value=this.value.replace(/\D/g,'')" /><span class="plus">+</span>&nbsp;&nbsp;库存 <span id="stock"><?php echo ($item["goods_stock"]); ?></span> 件</div>
            <div class="buy"><span class="nowbuy buytocart">立即购买</span>&nbsp;&nbsp;<span class="addcart buyaddcart">加入购物车</span></div>
        </div>
    </div>
    <div class="detail-tab clear clearfix">
        <div class="content clear clearfix">
            <div class="clear clearfix tabs">
                <div class="tab cur">图文详情</div>
                <div class="tab">晒单评价</div>
            </div>
            <div class="clear clearfix contents">
                <div class="item cur clear clearfix" id="product_detail">
                    <?php echo (html_entity_decode($item["info"])); ?>
                </div>
                <div class="item clear clearfix">
                    <div class="comment_list">
                        <ul id="J_cmt_list">
                            <?php if(is_array($cmt_list)): $i = 0; $__LIST__ = $cmt_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><li class="clear clearfix">
                                    <div class="uinfo">
                                        <a href="#" target="_blank">
                                            <img src="<?php echo avatar($val['user_id'], 48);?>" class="J_card avt" data-uid="<?php echo ($val["uid"]); ?>" />
                                        </a>
                                        <p><a href="#" class="J_card n" data-uid="<?php echo ($val["user_id"]); ?>" target="_blank"><?php echo (substr($val["mobile"],0,3)); ?>***</a>
                                        </p>
                                    </div>                                    
                                    <div class="comment">
                                        <div><?php echo ($val["info"]); ?></div>
                                        <div><?php echo (date('Y-m-d H:i:s',$val["add_time"])); ?></div>
                                    </div>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                        <div id="J_cmt_page" class="page_bar"><?php echo ($page_bar); ?></div>
                    </div>
                </div>
            </div>
        </div>
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
    <div class="detail-bot">
        <div class="buy"><span class="nowbuy followProduct"><img src="/Public/maoyan/images/love.png" height="30" />关注</span>&nbsp;&nbsp;<span class="nowbuy buytocart">立即购买</span>&nbsp;&nbsp;<span class="addcart buyaddcart">加入购物车</span></div>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<div id="dialog-overlay"></div>
<div id="dialog-box">
    <div class="dialog-content">
        <div id="dialog-message">
            <div class="message"></div>
            <div class="buy"><span class="nowbuy" id="gotocart">查看购物车</span>&nbsp;&nbsp;<span class="addcart" id="continuebuy">继续挑选商品</span></div>
        </div>
        <a href="#" class="button">关闭</a>
    </div>
</div>
<script type="text/javascript">
window.onload = function(){
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
    var stock = Math.round($('#stock').html());
    var quantity = $('#quantity');
    var currentQuantity;
    $('.less').click(function(){
        currentQuantity = Math.round(quantity.val());
        if(currentQuantity > 1) {
            quantity.val(--currentQuantity);
        }
    });
    $('.plus').click(function(){
        currentQuantity = Math.round(quantity.val());
        if(currentQuantity < stock) {
            quantity.val(++currentQuantity);
        }
    });
    $('#header .back').click(function(){
        history.back();
    });
    var productImgContainer = $('#picScroll');
    var imgs = productImgContainer.find('.bd ul li img');
    var total = imgs.length;
    var hd = productImgContainer.find('.hd');
    hd.html('1/' + total);
    if(total > 1){
        productImgContainer.find('.bd').swipeSlide({
            continuousScroll:false,
            speed : 3000,
            transitionType : 'cubic-bezier(0.22, 0.69, 0.72, 0.88)'
        },function(i){
            hd.html((i+1) + '/' + total);
        });
    }
    var productDetail = $('#product_detail');
    var maxWidth = productDetail.width() - 0;
    $.each(productDetail.find('table'), function(n, c){
        c = $(c);
        if(c.width() > maxWidth) {
            c.width('auto');
            c.removeAttr('width').removeAttr('height');
        }
    });
    $.each(productDetail.find('td'), function(n, c){
        c = $(c);
        if(c.width() > maxWidth) {
            c.width('auto');
            c.removeAttr('width').removeAttr('height');
        }
    });
    $.each(productDetail.find('div'), function(n, c){
        c = $(c);
        if(c.width() > maxWidth) {
            c.width('auto');
            c.removeAttr('width').removeAttr('height');
        }
    });
    
    //Popup dialog
    function popup(message, type) {
        if(type == 1){
            $('#dialog-message .buy').show();
        } else {
            $('#dialog-message .buy').hide();
        }
        var maskHeight = $(document).height();  
        var maskWidth = $('body').width();
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
        var dialogTop =  ($(window).height()/2) - ($('#dialog-box').height()) + scrollPos;  
        var dialogLeft = (maskWidth - $('#dialog-box').width())/2; 
        $('#dialog-overlay').css({width: maskWidth, height: maskHeight}).show();
        $('#dialog-box').show();
        dialogTop =  ($(window).height()/2) - ($('#dialog-box').height()) + scrollPos;  
        dialogLeft = ($('#header').width() - $('#dialog-box').width())/2;
        $('#dialog-box').css({top:dialogTop, left:dialogLeft});
        $('#dialog-message .message').html(message);
    }
    $('#dialog-box .button').click(function(){
        $('#dialog-overlay').hide();
        $('#dialog-box').hide();
    });
    $('#continuebuy').click(function(){
        $('#dialog-overlay').hide();
        $('#dialog-box').hide();
    });
    $('#gotocart').click(function(){
        location.href = '<?php echo U('Shopcart/index');?>';
    });
    $('#header .cart').click(function(){
        location.href = '<?php echo U('Shopcart/index');?>';
    });
    //type 1: to cart, 2: continue 
    function buys(type) {
        var goodId = $("#goodId").val();
        var quantity = $("#quantity").val();
        var attr = "";
        for (var i = 0; i < '<?php echo ($attr_list_count); ?>'; i++) {
            var a = ".attr_" + (i + 1);
            var b = ".attr_name_" + (i + 1);
            attr += ";" + ($(b).val()) + "|" + ($(a).val());
        }
        var price = $("#price").val();
        if (quantity == '') {
            alert('请输入购买数量');
            return;
        }
        if (parseInt(quantity) < 1) {
            alert("购买数量不能小于1");
            return;
        }
        if (isNaN(quantity)) {
            alert("请输入正确的购买数量");
            return;
        }

        var url = "<?php echo U('Shopcart/add_cart');?>";
        $.post(url, {
            goodId: goodId,
            quantity: quantity,
            attr: attr,
            price: price
        }, function(data) {
            if (data.status == 1) {
                $('#cartnum').html(data.count);
                if(type == 1) {
                    location.href = '<?php echo U('Shopcart/index');?>';
                    return;
                }
                // 
                popup(data.msg, 1);
            } else {
                popup(data.msg, 1);
            }
        }, 'json');
    }
    $('.buytocart').click(function(){
        buys(1);
    });
    $('.buyaddcart').click(function(){
        buys(2);
    });
    var tabContainer = $('.tabs');
    var tabs = tabContainer.find('.tab');
    $.each(tabs, function(n, c){
        $(c).click(function(){            
            tabs.removeClass('cur');
            $(c).addClass('cur');
            tabContainer.next().find('.item').hide().eq(n).show();
        });
    });
    $('.followProduct').click(function(){
        var goodId = $("#goodId").val();
        var url = "<?php echo U('User/followProduct');?>";
        $.post(url, {
            item_id: goodId,
        }, function(data) {
            if (data.status == 1) {
                popup(data.info, 2);
            } else {
                popup(data.info, 2);
            }
        }, 'json');
    });
};
</script>
</body>
</html>