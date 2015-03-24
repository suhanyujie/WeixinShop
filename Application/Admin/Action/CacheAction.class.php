<?php
namespace Admin\Action;
use Common\Action;
use Common\ORG;

class CacheAction extends \Common\Action\backendAction {
    public function _initialize() {
        parent::_initialize();
    }

    public function index() {
        $this->display();
    }

    public function clear() {
        $type    = input('get.type', 'trim');
        $obj_dir = new \Common\ORG\Dir;
        switch ($type) {
            case 'field':
                is_dir(DATA_PATH . '_fields/') && $obj_dir->del(DATA_PATH . '_fields/');
                break;
            case 'tpl':
                is_dir(CACHE_PATH) && $obj_dir->delDir(CACHE_PATH);
                break;
            case 'data':
                is_dir(DATA_PATH) && $obj_dir->del(DATA_PATH);
                is_dir(TEMP_PATH) && $obj_dir->delDir(TEMP_PATH);
                break;
            case 'runtime':
                if (is_file(RUNTIME_FILE)) {
                    unlink(RUNTIME_FILE);
                }
                break;
            case 'logs':
                is_dir(LOG_PATH) && $obj_dir->delDir(LOG_PATH);
                break;
            case 'js':
                is_dir(PIN_DATA_PATH . '/static/') && $obj_dir->del(PIN_DATA_PATH . '/static/');
                break;
        }
        $this->ajaxReturn(1);
    }

    public function qclear() {
        $obj_dir = new \Common\ORG\Dir;
        is_dir(DATA_PATH . '_fields/') && $obj_dir->del(DATA_PATH . '_fields/');
        is_dir(CACHE_PATH) && $obj_dir->delDir(CACHE_PATH);
        is_dir(DATA_PATH) && $obj_dir->del(DATA_PATH);
        is_dir(TEMP_PATH) && $obj_dir->delDir(TEMP_PATH);
        is_dir(LOG_PATH) && $obj_dir->delDir(LOG_PATH);
        is_dir(PIN_DATA_PATH . '/static/') && $obj_dir->del(PIN_DATA_PATH . '/static/');
        if (is_file(RUNTIME_FILE)) {
            unlink(RUNTIME_FILE);
        }
        $this->ajaxReturn(1, L('clear_success'));
    }
}