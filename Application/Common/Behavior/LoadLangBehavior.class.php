<?php
namespace Common\Behavior;
use Behavior;

defined('THINK_PATH') or exit();

class LoadLangBehavior {
    protected $options = array(
        'DEFAULT_LANG' => 'zh_cn', // 当前语言包
    );

    public function run(&$params) {
        $lang = $group_lang = $module_lang = array();
        $lang_dir = MODULE_PATH . 'Lang/' . C('DEFAULT_LANG');
        // 读取项目公共语言包
        $langFile = "{$lang_dir}/" . C('DEFAULT_LANG') . '.php';
        if (is_file($langFile)) {
            $lang = include $langFile;
        }
        // 读取当前模块语言包
        $module_lang_file = $lang_dir . '/' . CONTROLLER_NAME . '.php';

        if (is_file($module_lang_file)) {
            $module_lang = include $module_lang_file;
        }
        $lang = array_merge($lang, $group_lang, $module_lang);

        $js_lang = isset($lang['js_lang']) ? $lang['js_lang'] : array();
        $module_js_lang = isset($lang['js_lang_' . CONTROLLER_NAME]) ? $lang['js_lang_' . CONTROLLER_NAME] : array();
        $lang['js_lang'] = array_merge($js_lang, $module_js_lang);
        L($lang);
    }
}