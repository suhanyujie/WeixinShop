<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-seo';
	var SELF = '/index.php?g=admin&m=seo&a=url&menuid=282';
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
<!--SEO设置-->
<div class="pad_lr_10">
	<form id="info_form" action="<?php echo u('seo/url');?>" method="post">
	<table width="100%" class="table_form">
        <tr>
            <th width="150"><?php echo L('url_model');?> :</th>
            <td>
                <select name="url_model">
                    <option value="0" <?php if($config['URL_MODEL'] == 0): ?>selected="selected"<?php endif; ?>> <?php echo L('url_model_0');?> </option>
                    <option value="1" <?php if($config['URL_MODEL'] == 1): ?>selected="selected"<?php endif; ?>> <?php echo L('url_model_1');?> </option>
                    <option value="2" <?php if($config['URL_MODEL'] == 2): ?>selected="selected"<?php endif; ?>> <?php echo L('url_model_2');?> </option>
                </select>
            </td>
        </tr>
        <tr>
            <th><?php echo L('url_suffix');?> :</th>
            <td><input type="text" name="url_suffix" class="input-text" size="10" value="<?php echo ($config["URL_HTML_SUFFIX"]); ?>"></td>
        </tr>
        <tr>
            <th><?php echo L('url_depr');?> :</th>
            <td><input type="text" name="url_depr" class="input-text" size="4" value="<?php echo ($config["URL_PATHINFO_DEPR"]); ?>"></td>
        </tr>
        <tr>
        	<th></th>
        	<td><input type="hidden" name="menuid"  value="<?php echo ($menuid); ?>"/><input type="submit" class="btn btn_submit" name="do" value="<?php echo L('submit');?>"/></td>
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
</body>
</html>