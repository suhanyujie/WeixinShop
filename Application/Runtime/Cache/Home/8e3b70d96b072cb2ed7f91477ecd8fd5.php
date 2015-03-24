<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE HTML>
<html>

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
    <script type="text/javascript" src="/Public/maoyan/js/plugins/zepto.selector.js"></script>
</head>

<body>
    <div id="page-contents">
        <div id="header" class="clear clearfix">
            <div class="back"></div>
            <div class="title-fr">修改密码</div>
        </div>
        <div id="header-placeholder">&nbsp;</div>
        <div id="content" class="clear clearfix">
            <div class="userblank"></div>
            <form method="post" action="<?php echo U('User/password');?>" id="address_form">
                <ul class="padding-content" id="address_form">
                    <li>
                        <p class="title">当前密码</p>
                        <p>
                            <input value="" name="oldpassword" id="oldpassword" class="text" type="text" required="required" placeholder="请输入当前使用的密码" />
                        </p>
                    </li>
                    <li>
                        <p class="title">新密码</p>
                        <p>
                            <input value="" name="password" id="password" class="text width1" type="text" required="required" placeholder="请输入一个新密码，密码长度6-20位" />
                        </p>
                    </li>
                    <li>
                        <p class="title">重复新密码</p>
                        <p>
                            <input value="" id="repassword" name="repassword" class="text" type="text" required="required" placeholder="请再输入一次新密码" />
                        </p>
                    </li>
                    <li>
                        <p class="title"></p>
                        <p><?php echo ($msg["info"]); ?>
                        </p>
                    </li>
                </ul>
                <input type="submit" id="submit" style="display:none;">
            </form>
            <div class="userblank"></div>
        </div>
        <div class="detail-bot">
            <div class="buy">
                &nbsp;&nbsp;<span class="nowbuy" id="confirm">确认</span>
                <span class="nowbuy back">返回</span>
            </div>
        </div>
        <div class="bot_nav_placeholder"></div>
    </div>
    <script type="text/javascript">
    $(function() {
        $('#header .back').click(function() {
            location.href = '<?php echo U('User/account');?>';
        });
        $('.detail-bot .back').click(function() {
            history.back();
        });
        $('#confirm').click(function() {
            $('#submit').click();
        });
    });
    </script>
</body>

</html>