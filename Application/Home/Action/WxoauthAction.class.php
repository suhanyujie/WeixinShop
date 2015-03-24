<?php
namespace Home\Action;
use Common\Action;
use Common\Pinlib;

class WxoauthAction extends \Common\Action\frontendAction {
    /**
     * 第三方帐号登陆和绑定
     */
    public function index() {
        $mod = input('get.mod', 'trim');
        !$mod && $this->_404();
        $wxoauth = new \Common\Pinlib\wxoauth($mod);
        return $wxoauth->authorize();
    }

    /**
     * 登陆回调页面
     */
    function callback() {
        $mod = input('get.mod', 'trim');
        !$mod && $this->_404();
        $callback_type = cookie('callback_type');
        $wxoauth = new \Common\Pinlib\wxoauth($mod);
        $rk = $wxoauth->NeedRequest();
        $request_args = array();
        foreach ($rk as $v) {
            $request_args[$v] = input('get.' . $v);
        }
        if (!empty($request_args['code'])) {
            $url = $wxoauth->callbackbinduser($request_args);
        } else {
            $url = U('User/login');
            $_SESSION['oauth2cache'] = 'ok';
        }
        redirect($url);
    }
}