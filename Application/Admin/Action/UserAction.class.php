<?php
/**
 * 用户信息管理
 */
namespace Admin\Action;
use Common\Action;

class UserAction extends \Common\Action\backendAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('user');
    }

    protected function _search() {
        $map = array();
        if ($keyword = input('request.keyword', 'trim')) {
            $map['_string'] = "username like '%" . $keyword . "%' OR email like '%" . $keyword . "%'";
        }
        $this->assign('search', array(
            'keyword' => $keyword,
        ));
        return $map;
    }

    public function _before_index() {
        $big_menu = array(
            'title'  => L('add_user'),
            'iframe' => U('user/add'),
            'id'     => 'add',
            'width'  => '500',
            'height' => '330',
        );
        $this->assign('big_menu', $big_menu);
    }

    public function _before_insert($data) {
        if (($data['password'] != '') && (trim($data['password']) != '')) {
            $data['password'] = $data['password'];
        } else {
            unset($data['password']);
        }
        $birthday = input('post.birthday', 'trim');
        if ($birthday) {
            $birthday       = explode('-', $birthday);
            $data['byear']  = $birthday[0];
            $data['bmonth'] = $birthday[1];
            $data['bday']   = $birthday[2];
        }
        return $data;
    }

    public function _after_insert($id) {
        $img = input('post.img', 'trim');
        $this->user_thumb($id, $img);
    }

    public function _before_update($data) {
        if (($data['password'] != '') && (trim($data['password']) != '')) {
            $data['password'] = md5($data['password']);
        } else {
            unset($data['password']);
        }
        $birthday = input('post.birthday', 'trim');
        if ($birthday) {
            $birthday       = explode('-', $birthday);
            $data['byear']  = $birthday[0];
            $data['bmonth'] = $birthday[1];
            $data['bday']   = $birthday[2];
        }
        return $data;
    }

    public function _after_update($id) {
        $img = input('post.img', 'trim');
        if ($img) {
            $this->user_thumb($id, $img);
        }
    }

    public function user_thumb($id, $img) {
        $img_path = avatar_dir($id);
        //会员头像规格
        $avatar_size = explode(',', C('pin_avatar_size'));
        $paths       = C('pin_attach_path');

        foreach ($avatar_size as $size) {
            if ($paths . 'avatar/' . $img_path . '/' . md5($id) . '_' . $size . '.jpg') {
                @unlink($paths . 'avatar/' . $img_path . '/' . md5($id) . '_' . $size . '.jpg');
            }
            !is_dir($paths . 'avatar/' . $img_path) && mkdir($paths . 'avatar/' . $img_path, 0777, true);
            \Common\ORG\Image::thumb($paths . 'avatar/temp/' . $img, $paths . 'avatar/' . $img_path . '/' . md5($id) . '_' . $size . '.jpg', '', $size, $size, true);
        }

        @unlink($paths . 'avatar/temp/' . $img);
    }

    /**
     * 添加
     */
    public function add() {
        $mod = D($this->_name);
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            if (method_exists($this, '_before_insert')) {
                $data = $this->_before_insert($data);
            }
            if ($mod->add($data)) {
                if (method_exists($this, '_after_insert')) {
                    $id = $mod->getLastInsID();
                    $this->_after_insert($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'add');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $this->assign('open_validator', true);
            $cate = M('user_category')->field('id,name')->where(array('status' => 1))->select();
            $this->assign('cate', $cate);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {

                $this->display();
            }
        }
    }

    /**
     * 修改
     */
    public function edit() {
        $mod = D($this->_name);
        $pk  = $mod->getPk();
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }
            if (method_exists($this, '_before_update')) {
                $data = $this->_before_update($data);
            }
            if (false !== $mod->save($data)) {
                if (method_exists($this, '_after_update')) {
                    $id = $data['id'];
                    $this->_after_update($id);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'edit');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $id           = input('get.' . $pk, 'intval');
            $info         = $mod->find($id);
            $cate         = M('user_category')->field('id,name')->where(array('status' => 1))->select();
            $info['cate'] = $cate;

            $this->assign('info', $info);
            $this->assign('open_validator', true);
            if (IS_AJAX) {
                $response = $this->fetch();
                $this->ajaxReturn(1, '', $response);
            } else {
                $this->display();
            }
        }
    }

    public function add_users() {
        if (IS_POST) {
            $users    = input('post.username', 'trim');
            $users    = explode(',', $users);
            $password = input('post.password', 'trim');
            $gender   = input('post.gender', 'intavl');
            $reg_time = time();
            $data     = array();
            foreach ($users as $val) {
                $data['password'] = $password;
                $data['gender']   = $gender;
                $data['reg_time'] = $reg_time;
                if ($gender == 3) {
                    $data['gender'] = rand(0, 1);
                }
                $data['username'] = $val;
                $this->_mod->create($data);
                $this->_mod->add();
            }
            $this->success(L('operation_success'));
        } else {
            $this->display();
        }
    }

    public function ajax_upload_imgs() {
        //上传图片
        if (!empty($_FILES['img']['name'])) {
            $result = $this->_upload($_FILES['img'], 'avatar/temp/');
            if ($result['error']) {
                $this->error($result['info']);
            } else {
                $data['img'] = $result['info'][0]['savename'];
                $this->ajaxReturn(1, L('operation_success'), $data['img']);
            }

        } else {
            $this->ajaxReturn(0, L('illegal_parameters'));
        }
    }
    /*
     *会员组管理会员
     */
    public function cateindex() {
        $uid = input('get.uid', 'trim');
        $map = array('uid' => $uid);
        $mod = $this->_mod;
        !empty($mod) && $this->_list($mod, $map);
        $this->display();
    }

    /**
     * 列表处理
     *
     * @param obj $model  实例化后的模型
     * @param array $map  条件数据
     * @param string $sort_by  排序字段
     * @param string $order_by  排序方法
     * @param string $field_list 显示字段
     * @param intval $pagesize 每页数据行数
     */
    protected function _list($model, $map = array(), $sort_by = '', $order_by = '', $field_list = '*', $pagesize = 20) {

        //排序
        $mod_pk = $model->getPk();

        if (input("request.sort", 'trim')) {
            $sort = input("request.sort", 'trim');
        } else if (!empty($sort_by)) {
            $sort = $sort_by;
        } else if ($this->sort) {
            $sort = $this->sort;
        } else {
            $sort = $mod_pk;
        }
        if (input("request.order", 'trim')) {
            $order = input("request.order", 'trim');
        } else if (!empty($order_by)) {
            $order = $order_by;
        } else if ($this->order) {
            $order = $this->order;
        } else {
            $order = 'DESC';
        }

        //如果需要分页
        if ($pagesize) {
            $count = $model->where($map)->count($mod_pk);
            $pager = new \Common\ORG\Page($count, $pagesize);
        }
        $select = $model->field($field_list)->where($map)->order($sort . ' ' . $order);
        // echo M()->getLastSql();
        $this->list_relation && $select->relation(true);
        if ($pagesize) {
            $select->limit($pager->firstRow . ',' . $pager->listRows);
            $page = $pager->show();
            $this->assign("page", $page);
        }
        $list = $select->select();
        foreach ($list as $key => $value) {
            $catename       = M('user_category')->field('name')->where(array('id' => $value['uid']))->find();
            $value['cname'] = $catename['name'];
            $list[$key]     = $value;//重复值list
        }
        //dump($list);
        $this->assign('list', $list);
        $this->assign('list_table', true);
    }
    /**
     * ajax检测会员是否存在
     */
    public function ajax_check_name() {
        $name = input('get.username', 'trim');
        $id   = input('get.id', 'intval');
        if ($this->_mod->name_exists($name, $id)) {
            $this->ajaxReturn(0, '该会员已经存在');
        } else {
            $this->ajaxReturn();
        }
    }

    /**
     * ajax检测邮箱是否存在
     */
    public function ajax_check_email() {
        $name = input('get.email', 'trim');
        $id   = input('get.id', 'intval');
        if ($this->_mod->email_exists($name, $id)) {
            $this->ajaxReturn(0, '该邮箱已经存在');
        } else {
            $this->ajaxReturn();
        }
    }

}