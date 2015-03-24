<?php if (!defined('THINK_PATH')) exit();?><!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link href="/Public/css/admin/style.css" rel="stylesheet"/>
	<title><?php echo L('website_manage');?></title>
	<script>
	var URL = '/index.php/admin-keyword';
	var SELF = '/index.php?g=admin&m=keyword&a=addkeyword&menuid=301';
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
<link rel="stylesheet" type="text/css" href="/Public/css/admin/weixin.css"/>
<div class="main_right">
<a href="#" class="addreply"><img src="/Public/images/admin/keywords_03.jpg" /></a>
<div class="list" id="add_zsc" style="display:none;"></div>
<!---------回复列表-------------->
<?php if(is_array($keyinfo)): $i = 0; $__LIST__ = $keyinfo;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?><div class="list" style="position:relative">
<h3>规则：<?php echo ($item["kename"]); ?><a href="#" id="zsc_btninfo<?php echo ($item["kid"]); ?>" class="add" onclick="zsc_show('<?php echo ($item["kid"]); ?>')"></a>
<a href="#" class="del" id="zsc_del_<?php echo ($item["kid"]); ?>" onclick="zscdel('<?php echo ($item["kid"]); ?>')"></a></h3>
<div id="zsc_content_<?php echo ($item["kid"]); ?>">
<p>关键字：<?php echo ($item["kyword"]); ?></p>
<?php if($item["type"] == 1): ?><p>回复：文本消息 </p><?php else: ?><p>回复：图文消息 </p><?php endif; ?>
</div>
</div><?php endforeach; endif; else: echo "" ;endif; ?>
<div id="localImag"><img id="preview" width=-1 height=-1 style="diplay:none" /></div>
</div>
</div>
</div>
<div class="showimg" style="display:none">
	<div class="stit">
    	<span>上传图片</span>
        <a href="javascript:zsc_close();"><img src="/Public/images/admin/addpageup_06.jpg" /></a>
    </div>
    <div class="sup">
	<input type="button" value="上传图片" class="uploadbtn"/>
    <form action="<?php echo U('keyword/ajaxupload');?>" method="post" id="zsc_myform" enctype="multipart/form-data" target="yframe">
    	<input type="file" value="上传图片" class="uploadbtn" style="position:absolute; top:75px; left:20px; filter:alpha(pacity=0);opacity:0; z-index:999;" onchange="zsc_upload()" name="image[]" />大小不超过1M ，仅限png,jpeg,jpg
        <input type="hidden" name="sub" value="submit" /> 
    </form>
	<iframe name="yframe" src="<?php echo U('keyword/ajaxupload');?>" style="border:none; display:none;"></iframe>
    </div>
    <div class="imgbox">
   
    </div>
    <div class="sbottom"><input type="button" class="submit" id="zsc_surebtn" /></div>
     <!-----正在提交------>
    <span class="loadsubmit">正在上传...</span>
</div>
<div class="zhe" style="display:none"></div>
<script type="text/javascript" src="/Public/js/dingcan/addkeyword.js"></script>
</body>
</html>