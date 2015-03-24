<?php
namespace Admin\Action;
use Common\Action;

class TemplateAction extends \Common\Action\backendAction {
    /**
     * 模板列表
     */
    public function index() {
        $config_file = APP_PATH . 'Home/Conf/config.php';
        $config = include $config_file;
        if ($dirname = input('get.dirname', 'trim')) {
            //写入配置文件
            $config['DEFAULT_THEME'] = $dirname;
            file_put_contents($config_file, "<?php \nreturn " . var_export($config, true) . ";", LOCK_EX);
            $obj_dir = new \Common\ORG\Dir;
            is_dir(CACHE_PATH . 'Home/') && $obj_dir->delDir(CACHE_PATH . 'Home/');
            @unlink(RUNTIME_FILE);
        }
        $tpl_dir = APP_PATH . 'Home/View/';
        $opdir = dir($tpl_dir);
        $template_list = array();
        while (false !== ($entry = $opdir->read())) {
            if ($entry{0} == '.') {
                continue;
            }
            if (!is_file($tpl_dir . $entry . '/info.php')) {
                continue;
            }
            $info = include_once $tpl_dir . $entry . '/info.php';
            $info['preview'] = basename(APP_PATH) . '/Home/View/' . $entry . '/preview.gif';
            $info['dirname'] = $entry;
            $template_list[$entry] = $info;
        }
        $this->assign('template_list', $template_list);
        //当前使用的模板

        $this->assign('def_tpl', $config['DEFAULT_THEME']);
        $this->display();
    }
}