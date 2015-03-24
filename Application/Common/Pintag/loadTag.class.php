<?php
/**
 * 合并加载JS和CSS文件
 *
 * @author brivio
 */
namespace Common\Pintag;
use Common\ORG;

class loadTag {

    private $jm;
    private $dir;

    function __construct() {
        // $this->jm = new JSMin();
        $this->dir = new \Common\ORG\Dir();
    }

    public function js($options) {
        $path        = PIN_DATA_PATH . 'static/' . md5($options['href']) . '.js';
        $statics_url = C('pin_statics_url') ? C('pin_statics_url') : './static';
        if (!is_file($path)) {
            //静态资源地址
            $files     = explode(',', $options['href']);
            $content   = '';
            $themePath = __ROOT__ . '/' . basename(APP_PATH) . '/' . MODULE_NAME . '/View/' . C('DEFAULT_THEME') . '/Style';
            foreach ($files as $val) {
                $val = str_replace('__STATIC__', $statics_url, $val);
                $val = str_replace('__PUBLIC__', __PUBLIC__, $val);
                $val = str_replace('../Style', $themePath, $val);
                $val = ROOT_PATH . $val;
                $content .= file_get_contents($val);
            }
            $dir = dirname($path);
            if (!is_dir($dir)) {
                mkdir($dir, 0755, true);
            }
            file_put_contents($path, \Common\ORG\JSMin::minify($content));
        }
        echo ('<script type="text/javascript" src="' . __ROOT__ . '/data/static/' . md5($options['href']) . '.js?' . PIN_RELEASE . '"></script>');
    }
}