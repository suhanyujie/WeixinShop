<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-setting';
	var SELF = '/index.php?g=admin&m=setting&a=index&menuid=148';
	var ROOT_PATH = '';
	var APP	 =	 '/index.php';
	//语言项目
	var lang = new Object();
	<?php $_result=L('js_lang');if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?>lang.<?php echo ($key); ?> = "<?php echo ($val); ?>";<?php endforeach; endif; else: echo "" ;endif; ?>
	</script>
	<script charset="utf-8" src="/Public/js/jquery.js" type="text/javascript"></script>
</head>

<body>
<div id="J_ajax_loading" class="ajax_loading"><?php echo L('ajax_loading');?></div>
<?php if(($sub_menu != '') OR ($big_menu != '')): ?><div class="subnav">
    <div class="content_menu ib_a blue line_x">
    	<?php if(!empty($big_menu)): ?><a class="add fb J_showdialog" href="javascript:void(0);" data-uri="<?php echo ($big_menu["iframe"]); ?>" data-title="<?php echo ($big_menu["title"]); ?>" data-id="<?php echo ($big_menu["id"]); ?>" data-width="<?php echo ($big_menu["width"]); ?>" data-height="<?php echo ($big_menu["height"]); ?>"><em><?php echo ($big_menu["title"]); ?></em></a>　<?php endif; ?>
        <?php if(!empty($sub_menu)): if(is_array($sub_menu)): $key = 0; $__LIST__ = $sub_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($key % 2 );++$key; if($key != 1): ?><span>|</span><?php endif; ?>
        <a href="<?php echo U($val['module_name'].'/'.$val['action_name'],array('menuid'=>$menuid)); echo ($val["data"]); ?>" class="<?php echo ($val["class"]); ?>"><em><?php echo ($val['name']); ?></em></a><?php endforeach; endif; else: echo "" ;endif; endif; ?>
    </div>
</div><?php endif; ?>
<!--网站设置-->
<div class="pad_lr_10">
	<form id="info_form" action="<?php echo u('setting/edit');?>" method="post" enctype="multipart/form-data">
	<table width="100%" class="table_form">
        <tr>
            <th width="150"><?php echo L('site_name');?> :</th>
            <td><input type="text" name="setting[site_name]" class="input-text" size="50" value="<?php echo C('pin_site_name');?>"></td>
        </tr>
        <tr>
            <th><?php echo L('seo_title');?> :</th>
            <td><input type="text" name="setting[site_title]" class="input-text" size="50" value="<?php echo C('pin_site_title');?>"></td>
        </tr>
        <tr>
            <th><?php echo L('seo_keys');?> :</th>
            <td><input type="text" name="setting[site_keyword]" class="input-text" size="50" value="<?php echo C('pin_site_keyword');?>"></td>
        </tr>
        <tr>
            <th><?php echo L('seo_desc');?> :</th>
            <td><textarea rows="3" cols="50" name="setting[site_description]"><?php echo C('pin_site_description');?></textarea></td>
        </tr>
         <tr>
            <th>微信公众号二维码 :</th>
            <td>
            <?php if(C('pin_weixin_img')!=''){ ?>
            <img src="<?php echo attach(get_thumb(C('pin_weixin_img'), ''), 'weixin'); ?>" width="100" height="100"/><br />
            <?php }else{ ?>
            <?php } ?>
  	<input type="file" name="weixin_img" /></td>
        </tr>
         <tr>
            <th>微信公商城二维码 :</th>
            <td>
            <?php if(C('pin_weixinshop_img')!=''){ ?>
            <img src="<?php echo attach(get_thumb(C('pin_weixinshop_img'), ''), 'weixin'); ?>" width="100" height="100"/><br />
            <?php }else{ ?>
            <?php } ?>
  	<input type="file" name="weixinshop_img" /></td>
        </tr>
        	
       <!-- <tr>
            <th><?php echo L('site_icp');?> :</th>
            <td><input type="text" name="setting[site_icp]" class="input-text" size="50" value="<?php echo C('pin_site_icp');?>"></td>
        </tr>
        <tr>
            <th><?php echo L('statistics_code');?> :</th>
            <td><textarea rows="3" cols="50" name="setting[statistics_code]"><?php echo C('pin_statistics_code');?></textarea></td>
        </tr>-->
		 <tr>
            <th>支付宝二维码收款:</th>
            <td><textarea rows="2" cols="50" name="setting[alipayhome]"><?php echo C('pin_alipayhome');?></textarea>
             <p>如：https://qr.alipay.com/apbp55iyjy0266uidc 
             使用说明：客户在支付宝新建二维码，然后使用二维码识别软件获得二维码包含信息，支付说明此二维码仅限于手机支付宝客户端使用。其余不识别！</p>客户付款后，请查看支付记录，并在订单处理中手动完成后台付款操作！清空自动隐藏！</td>
            
        </tr>
        <tr>
            <th>个人主页收款:</th>
            <td><textarea rows="2" cols="50" name="setting[pay2home]"><?php echo C('pin_pay2home');?></textarea>
             <p>如：https://me.alipay.com/wzhceo，说明支付宝收款主页已下线！客户付款后，请查看支付记录，并在订单处理中手动完成后台付款操作！</p>如果不需要接入个人主页收款请不要填写内容。可用于第二收款主页，清空自动隐藏；</td>
            
        </tr>
        <tr>
            <th>QQ客服链接地址:</th>
            <td><textarea rows="2" cols="50" name="setting[qqcode]"><?php echo C('pin_qqcode');?></textarea>
             <p>使用说明：手机QQ 我的资料 我的二维码
             然后扫描此二维码获得二维码链接的信息（uc浏览器可以，专业扫描软件也可以），填写此处即可！</p>若不需要QQ客服，清空自动隐藏；</td>
        </tr>
        <tr>
            <th>在线客服系统代码:</th>
            <td><textarea rows="5" cols="50" name="setting[statistics_code]"><?php echo C('pin_statistics_code');?></textarea>
            <p>需要您去百度商桥网站申请账号。<a href="http://qiao.baidu.com" style="color:#F00" target="_blank">【百度商桥】</a> 。然后登陆客服系统后台设置，设置手机网站客服代码，将设置好的代码粘贴此处。</p><p>应答客户咨询可以下载pc客户端或手机客户端app。</p>不需要客服系统，可删除客服代码即可</td>
            
        </tr> 
    	<tr>
        	<th><?php echo L('site_status');?> :</th>
        	<td>
            	<label><input type="radio" class="J_change_status" <?php if(C('pin_site_status') == '1'): ?>checked="checked"<?php endif; ?> value="1" name="setting[site_status]"> <?php echo L('open');?></label> &nbsp;&nbsp;
                <label><input type="radio" class="J_change_status" <?php if(C('pin_site_status') == '0'): ?>checked="checked"<?php endif; ?> value="0" name="setting[site_status]"> <?php echo L('close');?></label>
            </td>
    	</tr>
        <tr id="J_closed_reason" <?php if(C('pin_site_status') == 1): ?>class="hidden"<?php endif; ?>>
        	<th><?php echo L('closed_reason');?> :</th>
        	<td><textarea rows="4" cols="50" name="setting[closed_reason]" id="closed_reason"><?php echo C('pin_closed_reason');?></textarea></td>
    	</tr>
        <tr>
        	<th></th>
        	<td><input type="hidden" name="menuid"  value="<?php echo ($menuid); ?>"/><input type="submit" class="btn btn_submit" value="<?php echo L('submit');?>"/></td>
    	</tr>
	</table>
	</form>
</div>
<script src="/Public/js/jquery/plugins/jquery.tools.min.js"></script>
<script src="/Public/js/jquery/plugins/formvalidator.js"></script>
<script src="/Public/js/pinphp.js"></script>
<script src="/Public/js/admin.js"></script>
<script>
//初始化弹窗
(function (d) {
    d['okValue'] = lang.dialog_ok;
    d['cancelValue'] = lang.dialog_cancel;
    d['title'] = lang.dialog_title;
})($.dialog.defaults);
</script>

<?php if(isset($list_table)): ?><script src="/Public/js/jquery/plugins/listTable.js"></script>
<script>
$(function(){
	$('.J_tablelist').listTable();
});
</script><?php endif; ?>
<script>
$(function(){
    $('.J_change_status').on('click', function(){
        if($(this).val() == '0'){
            $('#J_closed_reason').fadeIn();
        }else{
            $('#J_closed_reason').fadeOut();
        }
    });
});
</script>
</body>
</html>