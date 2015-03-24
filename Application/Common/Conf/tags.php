<?php
// 行为插件
return array(
    /**
    +------------------------------------------------------------------------------
     * 系统标签
    +------------------------------------------------------------------------------
     */
    'app_begin' => array(
        'Common\\Behavior\\CheckIpbanBehavior', //禁止IP
        'Common\\Behavior\\LoadLangBehavior', //语言
    ),
    'view_template' => array(
        'Common\\Behavior\\BasicTemplateBehavior', '_overlay' => 1, //自动定位模板文件
    ),
    'view_filter' => array(
        'Common\\Behavior\\ContentReplaceBehavior', //路径替换
    ),

    /**
    +------------------------------------------------------------------------------
     * 用户行为标签
    +------------------------------------------------------------------------------
     */
    //登陆
    'login_begin' => array(
    ),
    'login_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //注册
    'register_begin' => array(
    ),
    'register_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //发布分享
    'pubitem_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //添加喜欢
    'likeitem_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //添加到专辑
    'joinalbum_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //转发分享
    'fwitem_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //发表评论
    'pubcmt_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //创建专辑
    'addalbum_end' => array(),
    //删除分享
    'delitem_end' => array(
        'Common\\Behavior\\AlterScoreBehavior', // 积分
    ),
    //删除专辑
    'delalbum_end' => array(),
);