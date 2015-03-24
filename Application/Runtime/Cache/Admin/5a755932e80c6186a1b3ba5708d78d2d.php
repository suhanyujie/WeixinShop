<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-item';
	var SELF = '/index.php?g=admin&m=item&a=listpurchase&menuid=328';
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
<!--商品列表-->
<div class="pad_lr_10" >    
    <div class="J_tablelist table_list" data-acturi="<?php echo U('item/purchaseEdit');?>">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
                <th width=25><input type="checkbox" id="checkall_t" class="J_checkall"></th>
                <th><span data-tdtype="order_by" data-field="id">ID</span></th>
                <th align="left"><span data-tdtype="order_by" data-field="title">商品名称</span></th>
                <th align="left"><span data-tdtype="order_by" data-field="goods_id">商品ID</span></th>
                <th width="70"><span data-tdtype="order_by" data-field="price">进货价格</span></th>
                <th width="60"><span data-tdtype="order_by" data-field="number">数量</span></th>               
                <th width="70"><span data-tdtype="order_by" data-field="price">录入时间</span></th>
                <th width="80"><?php echo L('operations_manage');?></th>
            </tr>
        </thead>
        <tbody>
            <?php if(is_array($itemList)): $i = 0; $__LIST__ = $itemList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><tr>
                <td align="center"><input type="checkbox" class="J_checkitem" value="<?php echo ($val["id"]); ?>"></td>
                <td align="center"><?php echo ($val["id"]); ?></td>
                <td align="left"><?php echo ($val["title"]); ?></td>
                <td align="left"><?php echo ($val["goods_id"]); ?></td>
                <td align="center"><b><?php echo ($val["price"]); ?></b></td>
                <td align="center"><b><?php echo ($val["number"]); ?></b></td>
                <td align="center"><?php echo (date('Y-m-d H:i:s',$val["date"])); ?></td>
                <td align="center"><a href="javascript:;" class="J_showdialog" data-uri="<?php echo U('item/purchaseEdit', array('id'=>$val['id']));?>" data-title="<?php echo L('edit');?> - <?php echo ($val["name"]); ?>"  data-id="edit" data-acttype="ajax" data-width="400" data-height="130"><?php echo L('edit');?></a> | <a href="javascript:void(0);" class="J_confirmurl" data-uri="<?php echo u('item/purchasedelete', array('id'=>$val['id']));?>" data-acttype="ajax" data-msg="<?php echo sprintf(L('confirm_delete_one'),$val['title']);?>"><?php echo L('delete');?></a></td>
            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
        </tbody>
    </table>
    </div>
    <div class="btn_wrap_fixed">
        <label class="select_all mr10"><input type="checkbox" name="checkall" class="J_checkall"><?php echo L('select_all');?>/<?php echo L('cancel');?></label>
        <input type="button" class="btn" data-tdtype="batch_action" data-acttype="ajax" data-uri="<?php echo U('item/purchasedelete');?>" data-name="id" data-msg="<?php echo L('confirm_delete');?>" value="<?php echo L('delete');?>" />
        <div id="pages"><?php echo ($pageBar); ?></div>
    </div>
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