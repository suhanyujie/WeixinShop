<?php
namespace Admin\Action;
use Common\Action;

class SeoAction extends \Common\Action\backendAction {

    public function url() {
        $config_file = CONF_PATH . 'url.php';
        $config      = require $config_file;
        if (IS_POST) {
            $url_model  = input('post.url_model', 'intval', 0);
            $url_suffix = input('post.url_suffix', 'trim');
            $url_depr   = input('post.url_depr', 'trim');
            $new_config = array(
                'URL_MODEL'         => $url_model,
                'URL_HTML_SUFFIX'   => $url_suffix,
                'URL_PATHINFO_DEPR' => $url_depr,
            );
            if ($this->update_config($new_config, $config_file)) {
                $this->success(L('operation_success'));
            } else {
                $this->error(L('file_no_authority'));
            }
        } else {
            $this->assign('config', $config);
            $this->display();
        }
    }

    public function page() {
        $setting_mod = D('setting');
        if (IS_POST) {
            $seo_config = input('post.seo_config', ',');
            $seo_config = serialize($seo_config);
            $setting_mod->where(array('name' => 'seo_config'))->save(array('data' => $seo_config));
            $this->success(L('operation_success'));
        } else {
            $seo_config = $setting_mod->where(array('name' => 'seo_config'))->getField('data');
            $this->assign('seo_config', unserialize($seo_config));
            $this->display();
        }
    }
}