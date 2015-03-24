<?php
/**
 * 404错误
 */
namespace Admin\Action;
use Think\Action;

class EmptyAction extends Action {
    public function _empty() {
        send_http_status(404);
        $this->display('public/404');
    }
}