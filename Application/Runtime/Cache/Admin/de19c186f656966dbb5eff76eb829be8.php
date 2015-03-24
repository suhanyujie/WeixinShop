<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商城后台</title>
<link href="/Public/css/admin/pancl01.css" type="text/css" rel="stylesheet" />
<link href="/Public/css/admin/pancl02.css" type="text/css" rel="stylesheet" />
<script charset="utf-8" src="/Public/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="/Public/js/all.js"></script>
<script type="text/javascript" src="/Public/js/colorbox.js"></script>
<link href="/Public/js/colorbox/colorbox.css" type="text/css" rel="stylesheet" />
<script>
$(document).ready(function(){
	$(".group1").colorbox({rel:'group1'});
});
</script>
</head>

<body>
<div id="mainer">
    <div class="mainbox">
       <div class="mleft">
            <div class="mbar">
               <h4>微商城信息</h4>
             <!--  <div class="vshop" id="divShopName"><a class="bindwx" href="#">已绑定</a><span class="sname">您的微商城名称: 智风科技有限公司</span><a title="资料已认证" class="vok" href="#">已认证</a><sapn class="red">您的店铺已过期，请与管理员联系</sapn></div>-->
               <div class="clear"></div>
                       
               <div class="lbar">
                   <p><img height="90" id="imgWxQRCode" src="<?php echo attach(get_thumb(C('pin_weixin_img'), ''), 'weixin'); ?>"></p>
                   <p><span>微信公众号二维码</span></p>
                   <p>
                       <a href="<?php echo U('setting/index');?>">[设置]</a>
                       <a title="微信公众号二维码" class="group1" id="aDownLoadWxQRcode" href="<?php echo attach(get_thumb(C('pin_weixin_img'), ''), 'weixin'); ?>">[预览]</a>
                   </p>
               </div>
           
               <div class="lbar">
                   <p><img height="90" id="imgShopQRcode" src="<?php echo attach(get_thumb(C('pin_weixinshop_img'), ''), 'weixin'); ?>"></p>
                   <p><span>微商城二维码</span></p>
                   <p>
                       <a href="<?php echo U('setting/index');?>">[设置]</a>
                       <a class="group1" title="微商城二维码" id="aDownLoadShopQRcode" href="<?php echo attach(get_thumb(C('pin_weixinshop_img'), ''), 'weixin'); ?>">[预览]</a>
                   </p>
               </div>
               <div class="clear"></div>
               <div class="shoplink" id="divShopLink">
                    微商城链接：<input type="text" value="http://<?php echo $_SERVER['SERVER_NAME']; ?>" title="选中，按Ctrl + C可复制！"; onclick="this.select()" class="seltext hand" readonly="readonly" id="txtShopLink" name="txtShopLink">
               </div>
               
                <div class="shoplink" >
                    微商接口配置URL：<input type="text" value="http://<?php echo $_SERVER['SERVER_NAME']; ?>/index.php?m=Weixin&a=index" title="选中，按Ctrl + C可复制！";  onclick="this.select()" class="seltext hand" readonly="readonly" id="txtShopLink" name="txtShopLink">
               </div>
               <div class="shoplink" >
                    微商接口配置Token：<input type="text" value="weixin"  class="seltext hand" title="选中，按Ctrl + C可复制！"; onclick="this.select()" readonly="readonly" id="txtShopLink" name="txtShopLink">
               </div>
            </div>
        
            <div class="mbar">
               <h4>微商城提醒</h4>
           
               <div class="mtishi">
                   <p><strong>您需要立即处理:</strong></p>
               
                   <p><span>订单提醒:</span>
                       <a  href="<?php echo U('item_order/index',array('status'=>1,'menuid'=>296));?>">待付款订单 [<span class="count"><?php echo ($count["fukuan"]); ?></span>]</a>
                       <a href="<?php echo U('item_order/index',array('status'=>2,'menuid'=>296));?>">待发货订单 [<span class="count"><?php echo ($count["fahuo"]); ?></span>]</a>
                       <a href="<?php echo U('item_order/index',array('status'=>3,'menuid'=>296));?>">已发货订单 [<span class="count"><?php echo ($count["yfahuo"]); ?></span>]</a>
                      <!-- <a href="<?php echo U('item_order/index',array('status'=>1,'menuid'=>296));?>">退款中订单 [<span class="count">0</span>]</a>-->
                   </p>
                   <p><span>商品提醒:</span> <a href="<?php echo U('item/index',array('status'=>0));?>">待上架商品 [<span class="count"><?php echo ($count["nobuycount"]); ?></span>]</a></p>
               </div>
           
               <p><span>商品管理:</span> <a href="<?php echo U('item/index',array('status'=>1,));?>">出售中商品 [<span class="count"><?php echo ($count["buycount"]); ?></span>]</a></p>
            <!--   <p><span>购买咨询:</span> <a href="#">待回复咨询 [<span class="count">0</span>]</a></p>-->
            </div>            
        
           <!-- <div class="mbar">
               <h4>服务专区</h4>
               <p class="th"><strong>您的套餐类型:【企业型】<span class="red">（试用）</span><br>有效期: 2013-7-11 始至 2013-7-20 止</strong> </p>             
            </div>-->	
       </div>
       <div class="mright"> </div>
    </div>
</div>

<div id="footer">
    <div class="f-box">
        <div class="copy">版权所有 &copy; 四川猫眼科技有限公司 2013-2015</div>
    </div>
</div>
</body>
</html>