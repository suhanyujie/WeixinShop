<?php
namespace Common\Behavior;
use Behavior;
defined('THINK_PATH') or exit();

/**
 * 行为扩展：模板内容输出替换
 */
class ContentReplaceBehavior {

    public function run(&$content) {
        $content = $this->_replace($content);
    }

    private function _replace($content) {
        $themePath = __ROOT__ . '/' . basename(APP_PATH) . '/' . MODULE_NAME . '/View/' . C('DEFAULT_THEME') . '/';
        $replace   = array(
            '__THEME_PATH__' => $themePath, // 主题模板目录
            '../Style'       => $themePath . 'Style', // 项目样式模板目录
        );
        //静态资源地址
        $statics_url = C('pin_statics_url');
        if ($statics_url != '') {
            $replace['__STATIC__'] = $statics_url;
        } else {
            $replace['__STATIC__'] = __ROOT__ . '/static';
        }
        //附件地址
        $replace['__UPLOAD__'] = __ROOT__ . '/data/upload';

        $content = str_replace(array_keys($replace), array_values($replace), $content);
        return $content;
    }
}