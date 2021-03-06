<?php
namespace Admin\Action;
use Common\Action;

class DeliveryAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('delivery');
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_delivery'),
            'iframe' => U('delivery/add'),
            'id'     => 'add',
            'width'  => '400',
            'height' => '130',
        );
        $this->assign('big_menu', $big_menu);

        //默认排序
        $this->sort  = 'ordid';
        $this->order = 'ASC';
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
        if (D('delivery')->name_exists($name, $id)) {
            $this->ajaxReturn(0, L('该分类名称已存在'));
        } else {
            $this->ajaxReturn(1);
        }
    }

    public function deletebrand() {

        $mod = D($this->_name);

        $pk  = $mod->getPk();
        $ids = trim(input('request.' . $pk), ',');

        if ($ids) {

            if (false !== $mod->delete($ids)) {
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'));
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            IS_AJAX && $this->ajaxReturn(0, L('illegal_parameters'));
            $this->error(L('illegal_parameters'));
        }
    }

}