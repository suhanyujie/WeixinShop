<?php
namespace Home\Action;
use Common\Action;

class AboutusAction extends \Common\Action\frontendAction {

    public function index() {
        $id = I('get.id', 0, 'intval');
        !$id && $this->redirect('index/index');
        $info = M('article_page')->find($id);
        $this->assign('info', $info);
        $this->assign('id', $id);
        $this->_config_seo();
        $this->display();
    }

    public function flink() {
        $this->_config_seo();
        $this->display();
    }
}