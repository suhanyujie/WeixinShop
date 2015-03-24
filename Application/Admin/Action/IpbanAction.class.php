<?php
namespace Admin\Action;
use Common\Action;

class IpbanAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('ipban');
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_ipban'),
            'iframe' => U('ipban/add'),
            'id'     => 'add',
            'width'  => '400',
            'height' => '130',
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

    protected function _before_insert($data) {
        $data['expires_time'] = strtotime($data['expires_time']);
        return $data;
    }

    protected function _before_update($data) {
        $data['expires_time'] = strtotime($data['expires_time']);
        return $data;
    }
}