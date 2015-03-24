<?php
namespace Admin\Action;
use Common\Action;

class AutoUserAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = M('auto_user');
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_auto_user'),
            'iframe' => U('auto_user/add'),
            'id'     => 'add',
            'width'  => '400',
            'height' => '170',
        );
        $this->assign('big_menu', $big_menu);
    }

    protected function _search() {
        $map                                                          = array();
        ($keyword = input('request.keyword', 'trim')) && $map['name'] = array('like', '%' . $keyword . '%');
        $this->assign('search', array(
            'keyword' => $keyword,
        ));
        return $map;
    }

    public function ajax_check_name() {
        $name = input('get.name', 'trim');
        $id   = input('get.id', 'intval');
        if (D('auto_user')->name_exists($name, $id)) {
            $this->ajaxReturn(0, L('该名称已存在'));
        } else {
            $this->ajaxReturn(1);
        }
    }
}