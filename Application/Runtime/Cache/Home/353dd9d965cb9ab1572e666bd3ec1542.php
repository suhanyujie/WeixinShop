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
            <div class="title-fr">购物车</div>
        </div>
        <div id="header-placeholder">&nbsp;</div>
        <script type="text/javascript" src="/Public/maoyan/js/cart.js" charset="utf-8"></script>

        <div id="content">
            <?php if(count($_SESSION[ 'cart'])==0){ ?>
            <div class="null_shopping">
                <div class="cart_pic"></div>
                <h4>您还没有宝贝，赶快去逛逛吧！</h4>
                <p>
                    <a class="enter" href="<?php echo U('Index/index');?>">马上去逛逛</a>
                </p>
            </div>
            <?php }else{ ?>
            <h3 id="chose_all"><b class="ico">全选商品</b></h3>
            <ul class="cart_list">
                <?php if(is_array($item)): $i = 0; $__LIST__ = $item;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="clear clearfix" id="cart_item_<?php echo ($vo["id"]); ?>">
                        <div class="clear clearfix main">
                            <div class="product-img"><a href="<?php echo U('Item/index',array('id'=>$vo['id']));?>" ><img src="<?php echo attach(get_thumb($vo['img'], '_s'), 'item');?>" height="100" width="100"></a></div>
                            <div class="goods_info">
                                <div class="title"><a href="<?php echo U('Item/index',array('id'=>$vo['id']));?>" ><?php echo ($vo["name"]); ?></a></div>
                                <div class="price">价格:<span class="price1">¥<?php echo ($vo["price"]); ?></span></div>
                                <?php if(is_array($vo['attr'])): $i = 0; $__LIST__ = $vo['attr'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$sub): $mod = ($i % 2 );++$i;?><div> <?php echo ($sub["name"]); ?>:<span><?php echo ($sub["value"]); ?> </span></div><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                            <div class="buynum clear clearfix">
                                    <span class="less fl" onclick="decrease_quantity(<?php echo ($vo["id"]); ?>);">-</span>
                                    <input type="text" id="input_item_<?php echo ($vo["id"]); ?>" value="<?php echo ($vo["num"]); ?>" orig="1" changed="<?php echo ($vo["num"]); ?>" onkeyup="this.value=this.value.replace(/\D/g,'');change_quantity(<?php echo ($vo["id"]); ?>, this);" class="text buynuminput fl" onafterpaste="this.value=this.value.replace(/\D/g,'')" />
                                    <span class="plus fl" onclick="add_quantity(<?php echo ($vo["id"]); ?>);">+</span>
                                    <span class="delete">
                                        <a class="del" href="javascript:;" onclick="drop_cart_item(<?php echo ($vo["id"]); ?>);"> <img src="/Public/maoyan/images/lib_story_icon_delete_normal.png"  style="vertical-align: middle;height:40px;width=40px"></a>
                                    </span>
                                </div>
                            <div class="buy_info">
                                <div class="total">
                                    <span>小计:</span>
                                    <span class="price2" id="item<?php echo ($vo["id"]); ?>_subtotal">¥<?php echo sprintf("%01.2f",$vo['num']*$vo['price']); ?></span>
                                </div>
                            </div>
                        </div>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>

            <div class="buy_foot">
                <div class="goods_amount">
                    <span>商品总价:</span>
                    <strong class="price" id="cart_amount">¥<?php echo ($sumPrice); ?></strong>
                </div>
                <div class="jiesuan_btn">
                    <a href="<?php echo U('Order/jiesuan');?>" class="btn"><span>去结算</span></a>
                </div>
            </div>
            <?php } ?>
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
                <li class="item cart cur" src="<?php echo U('Shopcart/index');?>">
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
    $(function() {
        $('#header .back').click(function() {
            history.back();
        });
        $('li[src]').click(function() {
            location.href = $(this).attr('src');
        });
    });
    </script>
</body>

</html>