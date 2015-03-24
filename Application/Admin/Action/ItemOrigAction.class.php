<?php
namespace Admin\Action;
use Common\Action;

class ItemOrigAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('item_orig');
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_item_orig'),
            'iframe' => U('item_orig/add'),
            'id'     => 'add',
            'width'  => '500',
            'height' => '140',
        );
        $this->assign('big_menu', $big_menu);
        //默认排序
        $this->sort  = 'ordid';
        $this->order = 'ASC';
    }

    public function ajax_upload_img() {
        //上传图片
        if (!empty($_FILES['img']['name'])) {
            $result = $this->_upload($_FILES['img'], 'item_orig', array('width' => '16', 'height' => '16'));
            if ($result['error']) {
                $this->ajaxReturn(0, $result['info']);
            } else {
                $ext         = array_pop(explode('.', $result['info'][0]['savename']));
                $data['img'] = str_replace('.' . $ext, '_thumb.' . $ext, $result['info'][0]['savename']);
                $this->ajaxReturn(1, L('operation_success'), $data['img']);
            }
        } else {
            $this->ajaxReturn(0, L('illegal_parameters'));
        }
    }

    public function ajax_check_name() {
        $name = input('get.name', 'trim');
        $id   = input('get.id', 'intval');
        if (D('flink_cate')->name_exists($name, $id)) {
            $this->ajaxReturn(0, L('该商品来源已存在！'));
        } else {
            $this->ajaxReturn(1);
        }
    }
}