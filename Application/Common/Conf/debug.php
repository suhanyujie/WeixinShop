<?php
return array(
    'DEFAULT_C_LAYER' => 'Action', // 默认的控制器层名称
    'MODULE_ALLOW_LIST' => array('Home', 'Admin'), // 配置你原来的分组列表
    'DEFAULT_MODULE' => 'Home', // 配置你原来的默认分组
    'DEFAULT_CONTROLLER' => 'Index',
    'TAGLIB_PRE_LOAD' => 'pin', //自动加载标签
    'TMPL_ACTION_SUCCESS' => 'public:success',
    'TMPL_ACTION_ERROR' => 'public:error',
    'COOKIE_SECURE' => false, // Cookie安全传输
    'DATA_CACHE_SUBDIR' => true, //缓存文件夹
    'DATA_PATH_LEVEL' => 3, //缓存文件夹层级
    'LOAD_EXT_CONFIG' => 'url,db,tags', //扩展配置
    'LANG_SWITCH_ON' => true,

    'SHOW_PAGE_TRACE' => false,
    'DEFAULT_LANG' => 'zh_cn', // 默认语言
    'DB_TYPE' => 'mysqli', // 数据库类型
    'LOG_LEVEL' => 'EMERG,ALERT,CRIT,ERR,INFO,NOTIC,DEBUG,SQL', // 允许记录的日志级别
    'VAR_MODULE' => 'g', // 默认模块获取变量
    'VAR_ADDON' => 'addon', // 默认的插件控制器命名空间变量
    'VAR_CONTROLLER' => 'm', // 默认控制器获取变量
    'VAR_ACTION' => 'a', // 默认操作获取变量
    'VAR_AJAX_SUBMIT' => 'ajax', // 默认的AJAX提交变量
    // sms api type
    'SMS_API' => 'Weimi',
    'SMS_VERIFY_CODE_TIME' => '1',

    'URL_CASE_INSENSITIVE' => true,

    'FREE_DELIVERY_AMOUNT' => 29, //满包邮金额
    'DELIVERY_FEE' => 5, //金额不达时，邮费每单
);