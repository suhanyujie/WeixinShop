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
</head>
<body>
<div id="page-contents">
    <div id="header" class="clear clearfix">
        <div class="back"></div>
        <div class="title-fr">忘记密码</div>
    </div>
    <div id="header-placeholder">&nbsp;</div>

    <div id="content">
        <form method="post" id="login_form">
            <input name="mobile" id="mobile" class="text width5" required="required" placeholder="请输入手机号码，以修改密码" type="text">
            <label></label>
            <input name="password" id="password" class="text width5" required="required" placeholder="请输入新密码" type="password" style="display:none;" />
            <label></label>
            <input name="password_confirm" id="password_confirm" class="text width5" required="required" placeholder="请再输入一次新密码" type="password" style="display:none;" />
            <label></label>
            <input name="sendms" id="sendsms" value="获取验证码" class="login_btn" title="立即发送" type="button" style="display:none;" />
            <input name="sms" placeholder="请点击获取验证码，并输入收到的短信验证码" id="sms" required="required" class="text width10" type="text" style="display:none;" />
            <label id="login_text"></label>
            <input name="Submit" id="submit" value="确 认" class="enter" type="button">
            <input name="ret_url" value="<?php echo ($ret_url); ?>" type="hidden">
        </form>
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
            <li class="item cart" src="<?php echo U('Shopcart/index');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_cart_normal.png" alt="购物车" />
            </li>
            <li class="item cur" src="<?php echo U('User/account');?>">
                <img src="/Public/maoyan/images/main_bottom_tab_personal_normal.png" alt="我的账户" />
            </li>
        </ul>
    </div>
    <div class="bot_nav_placeholder"></div>
</div>
<script type="text/javascript">
var retUrl = '<?php echo ($ret_url); ?>';
$(function(){
    $('#header .back').click(function(){
        history.back();
    });

    $('#mobile').blur(function(event) {
        var mobile = $.trim($(this).val());
        var url = "<?php echo U('User/ajaxCheckMobile');?>";
        $.post(url, {
            mobile: mobile,
        }, function(data) {
            if (data.status == 1) {
                $('#login_text').html("<b>输入新密码！</b>");
                $('#sendsms').show();
                $('#sms').show();
                $('#password').show();
                $('#password_confirm').show();
            }else if(data.status == -1){
                $('#login_text').html("<i>手机号错误！</i>");
            }  else {
                $('#login_text').html("<i>未注册手机号！</i>");
            }
        }, 'json');
    });
    $('#submit').click(function(event) {
        var mobile = $('#mobile').val();
        var password = $('#password').val();
        var password_confirm = $('#password_confirm').val();
        var sms = $('#sms').val();

        var url = "<?php echo U('User/forgotPassword');?>";
        $.post(url, {
            mobile: mobile,
            password: password,
            password_confirm: password_confirm,
            sms: sms
        }, function(data) {
            if (data.status == 1) {
                $('#login_text').html("<b>"+data.info+"</b>");
                function a() {
                    if(retUrl) {
                        location.href = decodeURIComponent(retUrl);
                    } else {
                        location.href = decodeURIComponent("index.php?m=User&a=login");
                    }
                }
                setTimeout(a, 2000);
            }else if(data.status == -1){
                $('#login_text').html("<i>手机号错误！</i>");
            } else {
                $('#login_text').html("<i>"+data.info+"！</i>");
            }
        }, 'json');
    });
    $('#sendsms').click(function(event) {
        sendSmsVerifyCode();
    });
    window.timer = null;
    function sendSmsVerifyCode() {
        var mobile = $('#mobile').val();
        if (mobile.length < 1) {
            alert('请输入手机号');
            return false;
        }
        $.getJSON('<?php echo U("User/ajaxSendSmsVerifyCode");?>', {
            mobile: mobile
        }, function(data) {
            if (data.status == 1) {
                alert('短信已经发送，请查收。60秒后可以重新发送！');
                $('#sendsms').unbind('click');
                window.resendTimeCount = 60;
                window.timer = setInterval(function(){
                    window.resendTimeCount--;
                    if(window.resendTimeCount > 0) {
                        $('#sendsms').val('请在'+ window.resendTimeCount + '秒后重新发送');
                    } else {
                        clearInterval(window.resendTimeCount);
                        $('#sendsms').val('发送验证码');
                    }
                }, 1000);
                setTimeout(function() {
                    $('#sendsms').click(function(event) {
                        sendSmsVerifyCode();
                    });
                }, 60);
            } else {
                alert('短信发送失败，请稍候再试');
            }
        });
    }
    $('li[src]').click(function(){
        location.href=$(this).attr('src');
    });
});
</script>
</body>
</html>