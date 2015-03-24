<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-user';
	var SELF = '/index.php?g=admin&m=user&a=add_users&menuid=149';
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
<!--批量添加会员-->
<form id="info_form" action="<?php echo U('user/add_users');?>" method="post">
<div class="pad_lr_10">
	<table width="100%" class="table_form">
        <tr>
            <th width="100">会员昵称 :</th>
            <td><textarea id="username" name="username" style="width:400px; height:70px;"></textarea>
            <label class="gray">&nbsp;&nbsp;会员名之间用","隔开</label>
            </td>
        </tr>
        <tr>
            <th>性别 :</th>
            <td>
                <label><input type="radio" name="gender" value="1" checked> 男</label>&nbsp;&nbsp;
                <label><input type="radio" name="gender" value="0"> 女</label>&nbsp;&nbsp;
                <label><input type="radio" name="gender" value="3"> 随机</label>
            </td>
        </tr>
        <tr>
            <th>密码 :</th>
            <td><input type="text" name="password" class="input-text" size="30"></td>
        </tr>
        <tr>
            <th></th>
            <td><input type="submit" value="<?php echo L('submit');?>" class="btn btn_submit"></td>
        </tr>
    </table>
</div>
</form>
<script src="/Public/js/jquery/jquery.js"></script>
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