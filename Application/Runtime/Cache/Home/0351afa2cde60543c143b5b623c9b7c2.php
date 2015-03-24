<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    
</head>

<body>
    
    <div class="clear"></div>
    <div class="banner">
        <div id="slider" class="slider" style="overflow: hidden; visibility: visible; list-style: none outside none; position: relative;">
            <ul id="sliderlist" class="sliderlist" style="position: relative; overflow: hidden; transition: left 600ms ease 0s; width: 1800px; left: -1200px;">
                <?php if(is_array($ad)): $i = 0; $__LIST__ = $ad;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li style="float: left; display: block; width: 600px;">
                        <span>
                            <a href="<?php echo ($vo["url"]); ?>">
                                <img title="<?php echo ($vo["desc"]); ?>" width="100%" src="data/upload/advert/<?php echo ($vo["content"]); ?>">
                            </a>
                        </span>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>

            </ul>
            <div id="pagenavi">
                <?php if(is_array($ad)): $k = 0; $__LIST__ = $ad;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><a <?php if($k == 1): ?>class="active"<?php endif; ?> href="javascript:void(0);"><?php echo ($k); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>

            </div>
        </div>
    </div>
    <div class="s_bottom"></div>
    <script type="text/javascript">
    $(function() {
        var active = 0,
            as = document.getElementById('pagenavi').getElementsByTagName('a');

        for (var i = 0; i < as.length; i++) {
            (function() {
                var j = i;
                as[i].onclick = function() {
                    t2.slide(j);
                    return false;
                }
            })();
        }
        var t2 = new TouchSlider({
            id: 'sliderlist',
            speed: 600,
            timeout: 6000,
            before: function(index) {
                as[active].className = '';
                active = index;
                as[active].className = 'active';
            }
        });
    });
    
    </script>
    <div id="content">
        <div class="top_search">
            <form class="search_form_box" action="<?php echo U('Search/index');?>" method="get">
                <input type="hidden" name="m" value="Search">
                <input type="text" autocomplete="off" placeholder="<?php echo C('pin_default_keyword');?>" class="ts_txt fl" name="q">
                <input type="hidden" name="type" value="item">
                <input type="submit" class="ts_btn" value="<?php echo L('search');?>">
            </form>
        </div>
        <div class="module_special">
            <div class="row row_category">
                <ul class="h_box">
                    <li>
                        <a href="#">
                            <img src="../Style/images/ico/icon_indexn_01.png" alt="">
                        </a>
                        <p>秒杀</p>
                    </li>
                    <li>
                        <a href="#">
                            <img src="../Style/images/ico/icon_indexn_02.png" alt="">
                        </a>
                        <p>特惠</p>
                    </li>
                    <li>
                        <a href="<?php echo U('User/index');?>">
                            <img src="../Style/images/ico/icon_indexn_03.png" alt="">
                        </a>
                        <p>个人中心</p>
                    </li>

                </ul>
            </div>
        </div>
        <div class="module_special">
            <h2 class="common_title veins2">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1">
                    <span class="ico2">特惠推荐</span>
                </span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <div class="major">
                        <ul class="list">
                            <?php if(is_array($tuijian)): $i = 0; $__LIST__ = $tuijian;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li>
                                    <div class="pic">
                                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>">
                                            <img src="<?php echo attach(get_thumb($item['img'], '_b'), 'item');?>">
                                        </a>
                                    </div>
                                    <div class="good_content">
                                        <h3>
                                            <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"><?php echo ($item["title"]); ?></a>
                                        </h3>
                                        <p>¥<?php echo ($item["price"]); ?></p>
                                    </div>
                                    <span class="show_good">
                                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"></a>
                                    </span>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="module_special tbr">
            <h2 class="common_title veins2">
                <div class="ornament1"></div>
                <div class="ornament2"></div>
                <span class="ico1">
                    <span class="ico2">新品上架</span>
                </span>
            </h2>
            <div class="wrap">
                <div class="wrap_child">
                    <div class="major">
                        <ul class="list">
                            <?php if(is_array($news)): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><li>
                                    <div class="pic">
                                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>">
                                            <img src="<?php echo attach(get_thumb($item['img'], '_b'), 'item');?>">
                                        </a>
                                    </div>
                                    <div class="good_content">
                                        <h3>
                                            <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"><?php echo ($item["title"]); ?></a>
                                        </h3>
                                        <p>¥<?php echo ($item["price"]); ?></p>
                                    </div>
                                    <span class="show_good">
                                        <a href="<?php echo U('Item/index',array('id'=>$item['id']));?>"></a>
                                    </span>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="module_special tbr">
            <dl class="categories_tree">
            <?php if(is_array($categories)): $i = 0; $__LIST__ = $categories;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$category): $mod = ($i % 2 );++$i;?><dt class="dt">
                    <div class="left">&nbsp;</div>
                    <div class="title"><?php echo ($category["name"]); ?></div> 
                    <div class="clear"></div>               
                </dt>
                <?php if(is_array($category["subCategories"])): $i = 0; $__LIST__ = $category["subCategories"];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$subCategory): $mod = ($i % 2 );++$i;?><dd class="dd">
                    <div class="img"><a href="<?php echo ($subCategory["url"]); ?>" title="<?php echo ($subCategory["name"]); ?>"><img src="/data/upload/item_cate/<?php echo ($subCategory["img"]); ?>" alt="<?php echo ($subCategory["name"]); ?>" /></a></div>
                    <div class="category_name"><a href="<?php echo ($subCategory["url"]); ?>" title="<?php echo ($subCategory["name"]); ?>"><?php echo ($subCategory["name"]); ?></a></div>
                </dd><?php endforeach; endif; else: echo "" ;endif; ?>
                <dd class="clear"></dd><?php endforeach; endif; else: echo "" ;endif; ?>
            </dl>
        </div>
        
        <div class="clear"></div>
    </div>
    
</body>
</html>