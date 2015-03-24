<?php
/**
 * 后台控制器基类
 *
 * @author andery
 */
namespace Common\Action;
use Think\Action;

class backendAction extends baseAction {
    protected $_name = '';
    protected $menuid = 0;
    public function _initialize() {
        parent::_initialize();
        $this->_name = $this->getActionName();
        $priv_array = array('index', 'add', 'edit', 'delete');
        if (in_array(ACTION_NAME, $priv_array)) {
            $this->check_priv();
        }
        $this->menuid = input('request.menuid', 'trim', 0);
        if ($this->menuid) {
            $sub_menu = D('Menu')->sub_menu($this->menuid, $this->big_menu);
            $selected = '';
            foreach ((array) $sub_menu as $key => $val) {
                $sub_menu[$key]['class'] = '';
                if (MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name'] && strpos(__SELF__, $val['data'])) {
                    $sub_menu[$key]['class'] = $selected = 'on';
                }
            }
            if (empty($selected)) {
                foreach ((array) $sub_menu as $key => $val) {
                    if (MODULE_NAME == $val['module_name'] && ACTION_NAME == $val['action_name']) {
                        $sub_menu[$key]['class'] = 'on';
                        break;
                    }
                }
            }
            $this->assign('sub_menu', (array) $sub_menu);
        }
        $this->assign('menuid', $this->menuid);
    }
    /**
     * 后台分页统一
     */
    protected function _pager($count, $pagesize) {
        $pager = new \Common\ORG\Page($count, $pagesize);
        $pager->rollPage = 5;
        $pager->setConfig('prev', '<');
        $pager->setConfig('theme', '%upPage% %first% %linkPage% %end% %downPage%');
        return $pager;
    }

    /**
     * 列表页面
     */
    public function index() {
        $map = $this->_search();

        $mod = D($this->_name);

        !empty($mod) && $this->_list($mod, $map);

        $this->display();
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
        $pk = $mod->getPk();
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
            $id = input('get.' . $pk, 'intval');
            $info = $mod->find($id);
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

    /**
     * ajax修改单个字段值
     */
    public function ajax_edit() {
        //AJAX修改数据
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $id = input('get.' . $pk, 'intval');
        $field = input('get.field', 'trim');
        $val = input('get.val', 'trim');
        //允许异步修改的字段列表  放模型里面去 TODO
        $mod->where(array($pk => $id))->setField($field, $val);
        $this->ajaxReturn(1);
    }

    /**
     * 删除
     */
    public function delete() {
        $mod = D($this->_name);
        $pk = $mod->getPk();
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

    /**
     * 获取请求参数生成条件数组
     */
    protected function _search() {
        //生成查询条件
        $mod = D($this->_name);
        $map = array();
        foreach ($mod->getDbFields() as $key => $val) {
            if (substr($key, 0, 1) == '_') {
                continue;
            }
            if (input('request.' . $val)) {
                $map[$val] = input('request.' . $val);
            }
        }
        return $map;
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

        if (input('request.sort', 'trim')) {
            $sort = input('request.sort', 'trim');
        } else if (!empty($sort_by)) {
            $sort = $sort_by;
        } else if ($this->sort) {
            $sort = $this->sort;
        } else {
            $sort = $mod_pk;
        }
        if (input('request.order', 'trim')) {
            $order = input('request.order', 'trim');
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
        $this->list_relation && $select->relation(true);
        if ($pagesize) {
            $select->limit($pager->firstRow . ',' . $pager->listRows);
            $page = $pager->show();
            $this->assign('page', $page);
        }
        $list = $select->select();
        $this->assign('list', $list);
        $this->assign('list_table', true);
    }

    public function check_priv() {
        if (MODULE_NAME == 'attachment') {
            return true;
        }
        if ((!isset($_SESSION['admin']) || !$_SESSION['admin']) && !in_array(ACTION_NAME, array('login', 'verify_code'))) {
            $this->redirect('index/login');
        }
        if ($_SESSION['admin']['role_id'] == 1) {
            return true;
        }
        if (in_array(MODULE_NAME, explode(',', 'index'))) {
            return true;
        }
        $menu_mod = M('menu');
        $menu_id = $menu_mod->where(array('module_name' => MODULE_NAME, 'action_name' => ACTION_NAME))->getField('id');
        $priv_mod = D('admin_auth');
        $r = $priv_mod->where(array('menu_id' => $menu_id, 'role_id' => $_SESSION['admin']['role_id']))->count();
        if (!$r) {
            $this->error(L('_VALID_ACCESS_'), U('index/panel'));
        }
    }

    protected function update_config($new_config, $config_file = '') {
        !is_file($config_file) && $config_file = CONF_PATH . 'Home/config.php';
        if (is_writable($config_file)) {
            $config = require $config_file;
            $config = array_merge($config, $new_config);
            file_put_contents($config_file, "<?php \nreturn " . stripslashes(var_export($config, true)) . ";", LOCK_EX);
            @unlink(RUNTIME_FILE);
            return true;
        } else {
            return false;
        }
    }
}