<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-zhuanpan';
	var SELF = '/index.php?g=admin&m=zhuanpan&a=index&menuid=320';
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
<script charset="utf-8" src="/Public/js/jquery.js" type="text/javascript"></script>
<!--添加商品-->
<div class="subnav">
    <h1 class="title_2 line_x">基本配置</h1>
</div>
<form id="info_form" action="<?php echo u('zhuanpan/edit');?>" method="post">
<div class="pad_lr_10">
	<div class="col_tab">
		<ul class="J_tabs tab_but cu_li">
			<li class="current">基本信息</li>
		</ul>
		<div class="J_panes">
        <div class="content_list pad_10">
		<table width="100%" cellpadding="2" cellspacing="1" class="table_form">
        <tr>
				<th width="14%" style="font-size:16px; font-weight:bold; color:#FF0000;">活动开始内容</th>
				<td width="86%"></td>
			</tr>
            <tr>
				<th>活动名称 :</th>
				<td><input type="text" name="hd_name" id="hd_name" class="input-text" size="60" value="<?php echo ($zp_info["hd_name"]); ?>"></td>
			</tr>
          <tr>
				<th>兑奖信息 :</th>
				<td><input type="text" name="hd_duijiang_info" id="hd_duijiang_info" class="input-text" size="60" value="<?php echo ($zp_info["hd_duijiang_info"]); ?>"></td>
			</tr>
          <tr>
				<th>活动时间 :</th>
				<td><input type="text" name="hd_begin_time" id="J_time_start" class="date" size="12" value="<?php echo ($zp_info["hd_begin_time"]); ?>">
				到<input type="text" name="hd_end_time" id="J_time_end" class="date" size="12" value="<?php echo ($zp_info["hd_end_time"]); ?>"></td>
			</tr>
			<tr>
                <th>活动说明 :</th>
                <td><textarea name="hd_info" cols="80" rows="2"><?php echo ($zp_info["hd_info"]); ?></textarea></td>
            </tr>
		<tr>
				<th>重复抽奖说明 :</th>
				<td><input type="text" name="hd_chongfu_info" id="hd_chongfu_info" class="input-text" size="60" value="<?php echo ($zp_info["hd_chongfu_info"]); ?>"></td>
			</tr>
          <tr>
				<th style="font-size:16px; font-weight:bold; color:#FF0000;">活动结束内容</th>
				<td></td>
			</tr>
            <tr>
                <th>活动结束说明 :</th>
                <td><textarea name="hd_end_info" cols="80" rows="2"><?php echo ($zp_info["hd_end_info"]); ?></textarea></td>
            </tr>
            <tr>
				<th style="font-size:16px; font-weight:bold; color:#FF0000;">奖项设置</th>
				<td></td>
			</tr>
             <tr>
				<th>一等奖奖品设置 :</th>
				<td><input type="text" name="jp_1_1" id="jp_1_1" class="input-text" size="60" value="<?php echo ($jp1["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>一等奖奖品数量 :</th>
				<td><input type="text" name="jp_1_2" id="jp_1_2" class="input-text" size="10" value="<?php echo ($jp1["shuliang"]); ?>"><span style="color:#FF0000">如果是100%中奖,请把一等奖的奖品数量[ 1000就代表前1000人都中奖 ]填写多点</span></td>
			</tr>
            
            <tr>
				<th>二等奖奖品设置 :</th>
				<td><input type="text" name="jp_2_1" id="jp_2_1" class="input-text" size="60" value="<?php echo ($jp2["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>二等奖奖品数量 :</th>
			   <td><input type="text" name="jp_2_2" id="jp_2_2" class="input-text" size="10" value="<?php echo ($jp2["shuliang"]); ?>"></td>
			</tr>
            
            <tr>
				<th>三等奖奖品设置 :</th>
				<td><input type="text" name="jp_3_1" id="jp_3_1" class="input-text" size="60" value="<?php echo ($jp3["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>三等奖奖品数量 :</th>
			   <td><input type="text" name="jp_3_2" id="jp_3_2" class="input-text" size="10" value="<?php echo ($jp3["shuliang"]); ?>"></td>
			</tr>
            
            <tr>
				<th>四等奖奖品设置 :</th>
				<td><input type="text" name="jp_4_1" id="jp_4_1" class="input-text" size="60" value="<?php echo ($jp4["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>四等奖奖品数量 :</th>
			   <td><input type="text" name="jp_4_2" id="jp_4_2" class="input-text" size="10" value="<?php echo ($jp4["shuliang"]); ?>"></td>
			</tr>
            
            <tr>
				<th>五等奖奖品设置 :</th>
				<td><input type="text" name="jp_5_1" id="jp_5_1" class="input-text" size="60" value="<?php echo ($jp5["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>五等奖奖品数量 :</th>
			   <td><input type="text" name="jp_5_2" id="jp_5_2" class="input-text" size="10" value="<?php echo ($jp5["shuliang"]); ?>"></td>
			</tr>
            
            <tr>
				<th>六等奖奖品设置 :</th>
				<td><input type="text" name="jp_6_1" id="jp_6_1" class="input-text" size="60" value="<?php echo ($jp6["praisecontent"]); ?>"></td>
			</tr>
             <tr>
				<th>六等奖奖品数量 :</th>
			   <td><input type="text" name="jp_6_2" id="jp_6_2" class="input-text" size="10" value="<?php echo ($jp6["shuliang"]); ?>"></td>
			</tr>
            
            <tr>
				<th>预计活动人数 :</th>
			   <td><input type="text" name="hd_renshu" id="hd_renshu" class="input-text" size="10" value="<?php echo ($zp_info["hd_renshu"]); ?>">预估活动人数直接影响抽奖概率：中奖概率 = 奖品总数/预估活动人数*每人抽奖次数 如果要确保任何时候都100%中奖建议设置为1人参加!</td>
			</tr>
            
            <tr>
				<th>每人一天最多抽奖 :</th>
			   <td><input type="text" name="hd_cishu" id="hd_cishu" class="input-text" size="10" value="<?php echo ($zp_info["hd_cishu"]); ?>"></td>
			</tr>
           

		</table>
		</div>
        </div>
		<div class="mt10"><input type="submit" value="<?php echo L('submit');?>" class="btn btn_submit"></div>
	</div>
</div>
<input type="hidden" name="menuid"  value="<?php echo ($menuid); ?>"/>
</form>

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
<script src="/Public/js/jquery/plugins/colorpicker.js"></script>
<script src="/Public/js/kindeditor/kindeditor.js"></script>	
<script>

$(function() {
	KindEditor.create('#info', {
		uploadJson : '<?php echo U("attachment/editer_upload");?>',
		fileManagerJson : '<?php echo U("attachment/editer_manager");?>',
		allowFileManager : true
	});
	$('ul.J_tabs').tabs('div.J_panes > div');

	//颜色选择器
	$('.J_color_picker').colorpicker();

	//自动获取标签
	$('#J_gettags').on('click', function() {
		var title = $.trim($('#J_title').val());
		if(title == ''){
			$.pinphp.tip({content:lang.article_title_isempty, icon:'alert'});
			return false;
		}
		$.getJSON('<?php echo U("article/ajax_gettags");?>', {title:title}, function(result){
			if(result.status == 1){
				$('#J_tags').val(result.data);
			}else{
				$.pinphp.tip({content:result.msg});
			}
		});
	});
	
});
</script>

<link rel="stylesheet" href="/Public/js/calendar/calendar-blue.css"/>
<script src="/Public/js/calendar/calendar.js"></script>
<script>
Calendar.setup({
	inputField : "J_time_start",
	ifFormat   : "%Y-%m-%d",
	showsTime  : false,
	timeFormat : "24"
});
Calendar.setup({
	inputField : "J_time_end",
	ifFormat   : "%Y-%m-%d",
	showsTime  : false,
	timeFormat : "24"
});
$('.J_preview').preview(); //查看大图
$('.J_cate_select').cate_select({top_option:lang.all}); //分类联动
$('.J_tooltip[title]').tooltip({offset:[10, 2], effect:'slide'}).dynamic({bottom:{direction:'down', bounce:true}});
</script>