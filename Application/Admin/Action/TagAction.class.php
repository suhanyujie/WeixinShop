<?php
namespace Admin\Action;
use Common\Action;

class TagAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('tag');
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_tag'),
            'iframe' => U('tag/add'),
            'id'     => 'add',
            'width'  => '400',
            'height' => '50',
        );
        $this->assign('big_menu', $big_menu);

        $p = input('get.p', 'intval', 1);
        $this->assign('p', $p);
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
        if (D('tag')->name_exists($name, $id)) {
            $this->ajaxReturn(0, L('标签已存在'));
        } else {
            $this->ajaxReturn(1);
        }
    }
}