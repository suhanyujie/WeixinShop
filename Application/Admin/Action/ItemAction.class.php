<?php
namespace Admin\Action;
use Common\Action;

class ItemAction extends \Common\Action\backendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('item');
        $this->_cate_mod = D('item_cate');
        $this->_purchase_mod = D('item_purchase');
        $brandlist = $this->_brand = M('brandlist')->where('status=1')->order('ordid asc,id asc')->select();
        $this->assign('brandlist', $brandlist);
    }

    public function _before_delete() {
        $pk = $this->_mod->getPk();
        $ids = trim(input('request.' . $pk), ',');
        $this->_purchase_mod->where(array('goods_id' => array('IN', explode(',', $ids))))->delete();
    }

    public function _before_index() {
        //显示模式
        $sm = input('get.sm', 'trim');
        $this->assign('sm', $sm);

        //分类信息
        $res = $this->_cate_mod->field('id,name')->select();
        $cate_list = array();
        foreach ($res as $val) {
            $cate_list[$val['id']] = $val['name'];
        }
        $this->assign('cate_list', $cate_list);

        //默认排序
        $this->sort = 'ordid ASC,';
        $this->order = 'add_time DESC';
    }

    protected function _search() {
        $map = array();
        //'status'=>1
        ($time_start = input('request.time_start', 'trim')) && $map['add_time'][] = array('egt', strtotime($time_start));
        ($time_end = input('request.time_end', 'trim')) && $map['add_time'][] = array('elt', strtotime($time_end) + (24 * 60 * 60 - 1));
        ($price_min = input('request.price_min', 'trim')) && $map['price'][] = array('egt', $price_min);
        ($price_max = input('request.price_max', 'trim')) && $map['price'][] = array('elt', $price_max);
        //  ($rates_min = input('request.rates_min', 'trim')) && $map['rates'][] = array('egt', $rates_min);
        // ($rates_max = input('request.rates_max', 'trim')) && $map['rates'][] = array('elt', $rates_max);
        ($uname = input('request.uname', 'trim')) && $map['uname'] = array('like', '%' . $uname . '%');
        $cate_id = input('request.cate_id', 'intval');
        if ($cate_id) {
            $id_arr = $this->_cate_mod->getChildIds($cate_id, true);
            $map['cate_id'] = array('IN', $id_arr);
            $spid = $this->_cate_mod->where(array('id' => $cate_id))->getField('spid');
            if ($spid == 0) {
                $spid = $cate_id;
            } else {
                $spid .= $cate_id;
            }
        }
        if ($_GET['status'] == null) {
            $status = -1;
        } else {
            $status = intval($_GET['status']);
        }
        $status >= 0 && $map['status'] = array('eq', $status);

        if ($_GET['is_xiangou'] == null) {
            $is_xiangou = -1;
        } else {
            $is_xiangou = intval($_GET['is_xiangou']);
        }
        $is_xiangou >= 0 && $map['is_xiangou'] = array('eq', $is_xiangou);

        ($keyword = input('request.keyword', 'trim')) && $map['title'] = array('like', '%' . $keyword . '%');
        $this->assign('search', array(
            'time_start' => $time_start,
            'time_end' => $time_end,
            'price_min' => $price_min,
            'price_max' => $price_max,
            // 'rates_min' => $rates_min,
            //  'rates_max' => $rates_max,
            'uname' => $uname,
            'status' => $status,
            'is_xiangou' => $is_xiangou,
            'selected_ids' => $spid,
            'cate_id' => $cate_id,
            'keyword' => $keyword,
        ));
        return $map;
    }

    public function listPurchase() {
        $itemCount = $this->_purchase_mod->field('count(*) AS c')->find();
        $count = $itemCount['c']; //商品总数
        $pageSize = 40; //每页显示个数
        $pager = $this->_pager($count, $pageSize);
        $itemList = $this->_purchase_mod->field('__ITEM__.title,__item_purchase__.*')->join('__ITEM__ ON __item_purchase__.goods_id = __ITEM__.id ', 'LEFT')->order("id DESC")->limit($pager->firstRow . ',' . $pageSize)->select();
        $this->assign('itemList', $itemList);
        //总数大于单页数才显示分页
        $count > $page_size && $this->assign('pageBar', $pager->fshow());
        //当前页码
        $p = input('get.p', 'intval', 1);
        $this->assign('p', $p);
        $this->display();
    }

    /**
     * 删除
     */
    public function purchaseDelete() {
        $mod = $this->_purchase_mod;
        $pk = $mod->getPk();
        $ids = trim(input('request.' . $pk), ',');
        if ($ids) {
            if (is_string($ids)) {
                $ids = explode(',', $ids);
                foreach ($ids as $key => $id) {
                    $row = $mod->where("`id` = {$id}")->find();
                    $this->_mod->where("`id`={$row['goods_id']}")->setDec('goods_stock', $row['number']);
                }
            }
            if (false !== $mod->delete(implode(',', $ids))) {
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
     * 修改
     */
    public function purchaseEdit() {
        $mod = $this->_purchase_mod;
        $pk = $mod->getPk();
        if (IS_POST) {
            if (false === $data = $mod->create()) {
                IS_AJAX && $this->ajaxReturn(0, $mod->getError());
                $this->error($mod->getError());
            }

            if (false !== $mod->save($data)) {
                $row = $mod->find(I('get.id'));
                if ($row['number'] != $data['number']) {
                    $this->_mod->where("`id`={$row['goods_id']}")->setInc($row['number'] - $data['number']);
                }
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'), '', 'edit');
                $this->success(L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
                $this->error(L('operation_failure'));
            }
        } else {
            $id = input('get.' . $pk, 'intval');
            $info = $mod->field('__ITEM__.title,__item_purchase__.*')->join('__ITEM__ ON __item_purchase__.goods_id = __ITEM__.id ')->where("__item_purchase__.id = {$id}")->find();
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

    public function add() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_mod->create()) {
                $this->error($this->_mod->getError());
            }
            if (!$data['cate_id'] || !trim($data['cate_id'])) {
                $this->error('请选择商品分类');
            }

            // if($_POST['brand']==''){
            //     $this->error('请选择品牌');
            // }
            //库存
            $data['goods_stock'] = 0;

            // $data['price'] = 0.0;
            //条码
            $data['barcode'] = input('post.barcode');
            if ($_POST['barcode'] == '') {
                $this->error('请输入条码');
            }
            //显示数量增量（前台显示数量增量值，显示数量=库存+增量值）
            $data['stockmore'] = input('post.stockmore');
            if ($_POST['stockmore'] == '') {
                $data['stockmore'] = 0;
            } else {
                $data['stockmore'] = intval($data['stockmore']);
            }
            //必须上传图片
            if (empty($_FILES['img']['name'])) {
                $this->error('请上传商品图片');
            }
            if (isset($_POST['news'])) {
                $data['news'] = 1;
            } else {
                $data['news'] = 0;
            }
            if (isset($_POST['tuijian'])) {
                $data['tuijian'] = 1;
            } else {
                $data['tuijian'] = 0;
            }
            /*=======================by lyye 2014-04-08=======================*/
            if (isset($_POST['is_xiangou'])) {
                $data['is_xiangou'] = 1;
            } else {
                $data['is_xiangou'] = 0;
            }
            $data['xiangou_num'] = trim($_POST['xiangou_num']) ? trim($_POST['xiangou_num']) : 1;
            /*=======================by lyye 2014-04-08=======================*/
            if ($_POST['free'] == 1) {
                $data['free'] = 1;
            } else if ($_POST['free'] == 2) {
                $data['free'] = 2;
                $data['pingyou'] = input('post.pingyou');
                $data['kuaidi'] = input('post.kuaidi');
                $data['ems'] = input('post.ems');
            }

            //获取马甲
            /*$auid = input('post.auid', 'intval');
            $auto_user_mod = M('auto_user');
            $user_mod = M('user');
            $unames = $auto_user_mod->where(array('id'=>$auid))->getField('users');
            $unamea = explode(',', $unames);
            $users = $user_mod->field('id,username')->where(array('username'=>array('in', $unamea)))->select();
            !$users && $this->error('请选择发布马甲');
            //发布用户
            $user_rand = array_rand($users);
            $data['uid'] = $users[$user_rand]['id'];
            $data['uname'] = $users[$user_rand]['username'];*/

            //上传图片
            $date_dir = date('ym/d/'); //上传目录
            $item_imgs = array(); //相册
            $result = $this->_upload($_FILES['img'], 'item/' . $date_dir, array(
                'width' => C('pin_item_bimg.width') . ',' . C('pin_item_img.width') . ',' . C('pin_item_simg.width'),
                'height' => C('pin_item_bimg.height') . ',' . C('pin_item_img.height') . ',' . C('pin_item_simg.height'),
                'suffix' => '_b,_m,_s',
                //'remove_origin'=>true
            ));
            if ($result['error']) {
                $this->error($result['info']);
            } else {
                $data['img'] = $date_dir . $result['info'][0]['savename'];
                //保存一份到相册
                $item_imgs[] = array(
                    'url' => $data['img'],
                );
            }
            //上传相册
            $file_imgs = array();
            foreach ($_FILES['imgs']['name'] as $key => $val) {
                if ($val) {
                    $file_imgs['name'][] = $val;
                    $file_imgs['type'][] = $_FILES['imgs']['type'][$key];
                    $file_imgs['tmp_name'][] = $_FILES['imgs']['tmp_name'][$key];
                    $file_imgs['error'][] = $_FILES['imgs']['error'][$key];
                    $file_imgs['size'][] = $_FILES['imgs']['size'][$key];
                }
            }
            if ($file_imgs) {
                $result = $this->_upload($file_imgs, 'item/' . $date_dir, array(
                    'width' => C('pin_item_bimg.width') . ',' . C('pin_item_simg.width'),
                    'height' => C('pin_item_bimg.height') . ',' . C('pin_item_simg.height'),
                    'suffix' => '_b,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    foreach ($result['info'] as $key => $val) {
                        $item_imgs[] = array(
                            'url' => $date_dir . $val['savename'],
                            'order' => $key + 1,
                        );
                    }
                }
            }
            $data['imgs'] = $item_imgs;
            $item_id = $this->_mod->publish($data, 0, 0, true);
            !$item_id && $this->error(L('operation_failure'));
            //会员价格
            $user_price = input('post.user_price', ',');
            if ($user_price) {
                foreach ($user_price['cate_id'] as $key => $val) {
                    if ($val && $user_price['price'][$key] != '-1' && $user_price['price'][$key] != 'null') {
                        $atr['item_id'] = $item_id;
                        $atr['cate_id'] = $val;
                        $atr['user_price'] = $user_price['price'][$key];
                        M('item_userprice')->add($atr);
                    }
                }
            }
            //附加属性
            $attr = input('post.attr', ',');
            if ($attr) {
                foreach ($attr['name'] as $key => $val) {
                    if ($val && $attr['value'][$key]) {
                        $atr['item_id'] = $item_id;
                        $atr['attr_name'] = $val;
                        $atr['attr_value'] = $attr['value'][$key];
                        M('item_attr')->add($atr);
                    }
                }
            }

            $this->success(L('operation_success'));
        } else {
            //来源
            /*  $orig_list = M('item_orig')->where(array('status'=>1))->select();
            $this->assign('orig_list',$orig_list);
            //采集马甲
            $auto_user = M('auto_user')->select();
            $this->assign('auto_user', $auto_user);*/
            //会员组信息
            $cate = M('user_category')->field('id,name')->where(array('status' => 1))->select();
            $this->assign('cate', $cate);
            $this->display();
        }
    }
    public function getProductInfo() {
        $barcode = $_GET['barcode'];
        vendor('Barcode.Barcode', COMMON_PATH . 'Vendor/');
        $barcodeObj = new \Common\Vendor\Barcode\Barcode();
        $barcodeObj->_init();
        $article = $barcodeObj->getProductByBarcode($barcode);
        $article['status'] = 1;
        echo json_encode($article);
        exit;
    }
    public function crawler() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_mod->create()) {
                $this->error($this->_mod->getError());
            }
            if (!$data['cate_id'] || !trim($data['cate_id'])) {
                $this->error('请选择商品分类');
            }

            // if($_POST['brand']==''){
            //     $this->error('请选择品牌');
            // }
            //库存
            $data['goods_stock'] = 0;

            // $data['price'] = 0.0;
            //条码
            $data['barcode'] = input('post.barcode');
            if ($_POST['barcode'] == '') {
                $this->error('请输入条码');
            }
            //显示数量增量（前台显示数量增量值，显示数量=库存+增量值）
            $data['stockmore'] = input('post.stockmore');
            if ($_POST['stockmore'] == '') {
                $data['stockmore'] = 0;
            } else {
                $data['stockmore'] = intval($data['stockmore']);
            }
            //必须上传图片
            if (empty($_FILES['img']['name']) && empty($_POST['remote_image'])) {
                $this->error('请上传商品图片');
            }
            if (isset($_POST['news'])) {
                $data['news'] = 1;
            } else {
                $data['news'] = 0;
            }
            if (isset($_POST['tuijian'])) {
                $data['tuijian'] = 1;
            } else {
                $data['tuijian'] = 0;
            }
            /*=======================by lyye 2014-04-08=======================*/
            if (isset($_POST['is_xiangou'])) {
                $data['is_xiangou'] = 1;
            } else {
                $data['is_xiangou'] = 0;
            }
            $data['xiangou_num'] = trim($_POST['xiangou_num']) ? trim($_POST['xiangou_num']) : 1;
            /*=======================by lyye 2014-04-08=======================*/
            if ($_POST['free'] == 1) {
                $data['free'] = 1;
            } else if ($_POST['free'] == 2) {
                $data['free'] = 2;
                $data['pingyou'] = input('post.pingyou');
                $data['kuaidi'] = input('post.kuaidi');
                $data['ems'] = input('post.ems');
            }

            //获取马甲
            /*$auid = input('post.auid', 'intval');
            $auto_user_mod = M('auto_user');
            $user_mod = M('user');
            $unames = $auto_user_mod->where(array('id'=>$auid))->getField('users');
            $unamea = explode(',', $unames);
            $users = $user_mod->field('id,username')->where(array('username'=>array('in', $unamea)))->select();
            !$users && $this->error('请选择发布马甲');
            //发布用户
            $user_rand = array_rand($users);
            $data['uid'] = $users[$user_rand]['id'];
            $data['uname'] = $users[$user_rand]['username'];*/

            //上传图片
            $date_dir = date('ym/d/'); //上传目录
            $item_imgs = array(); //相册
            if (!empty($_POST['remote_image'])) {
                $result = $this->_uploadRemote($_POST['remote_image'], 'item/' . $date_dir, array(
                    'width' => C('pin_item_bimg.width') . ',' . C('pin_item_img.width') . ',' . C('pin_item_simg.width'),
                    'height' => C('pin_item_bimg.height') . ',' . C('pin_item_img.height') . ',' . C('pin_item_simg.height'),
                    'suffix' => '_b,_m,_s',
                    //'remove_origin'=>true
                ));
                if ($result['error']) {
                    $this->error($result['error']);
                } else {
                    $data['img'] = $date_dir . $result['savename'];
                    //保存一份到相册
                    $item_imgs[] = array(
                        'url' => $data['img'],
                    );
                }
            }

            if (!empty($_FILES['img']['name'])) {
                $result = $this->_upload($_FILES['img'], 'item/' . $date_dir, array(
                    'width' => C('pin_item_bimg.width') . ',' . C('pin_item_img.width') . ',' . C('pin_item_simg.width'),
                    'height' => C('pin_item_bimg.height') . ',' . C('pin_item_img.height') . ',' . C('pin_item_simg.height'),
                    'suffix' => '_b,_m,_s',
                    //'remove_origin'=>true
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    $data['img'] = $date_dir . $result['info'][0]['savename'];
                    //保存一份到相册
                    $item_imgs[] = array(
                        'url' => $data['img'],
                    );
                }
            }

            //下载远程图片
            preg_match_all('/<img[^\>]+>/i', $data['info'], $matches);
            if ($matches) {
                foreach ($matches[0] as $key => $value) {
                    preg_match('/src=[\'\"]{0,1}([^\'\"]+)[\'\"]{0,1}/', $value, $src);
                    if (strpos($src[1], 'http') !== false) {
                        $result = $this->_uploadRemote($src[1], 'item/' . $date_dir, array(
                            'width' => C('pin_item_bimg.width') . ',' . C('pin_item_simg.width'),
                            'height' => C('pin_item_bimg.height') . ',' . C('pin_item_simg.height'),
                            'suffix' => '_b,_s',
                        ));
                        if ($result['error']) {
                            $this->error($result['error']);
                        } else {
                            $item_imgs[] = array(
                                'url' => $date_dir . $result['savename'],
                                'order' => $key + 1,
                            );
                            $cf = '/' . C('pin_attach_path') . 'item/' . $date_dir . $result['savename'];
                            $data['info'] = str_ireplace($value, "<img src=\"{$cf}\" />", $data['info']);
                        }
                    }
                }
            }
            $data['imgs'] = $item_imgs;
            $item_id = $this->_mod->publish($data, 0, 0, true);
            !$item_id && $this->error(L('operation_failure'));
            //会员价格
            $user_price = input('post.user_price', ',');
            if ($user_price) {
                foreach ($user_price['cate_id'] as $key => $val) {
                    if ($val && $user_price['price'][$key] != '-1' && $user_price['price'][$key] != 'null') {
                        $atr['item_id'] = $item_id;
                        $atr['cate_id'] = $val;
                        $atr['user_price'] = $user_price['price'][$key];
                        M('item_userprice')->add($atr);
                    }
                }
            }
            //附加属性
            $attr = input('post.attr', ',');
            if ($attr) {
                foreach ($attr['name'] as $key => $val) {
                    if ($val && $attr['value'][$key]) {
                        $atr['item_id'] = $item_id;
                        $atr['attr_name'] = $val;
                        $atr['attr_value'] = $attr['value'][$key];
                        M('item_attr')->add($atr);
                    }
                }
            }

            $this->success(L('operation_success'));
        } else {
            //来源
            /*  $orig_list = M('item_orig')->where(array('status'=>1))->select();
            $this->assign('orig_list',$orig_list);
            //采集马甲
            $auto_user = M('auto_user')->select();
            $this->assign('auto_user', $auto_user);*/
            //会员组信息
            $cate = M('user_category')->field('id,name')->where(array('status' => 1))->select();
            $this->assign('cate', $cate);
            $this->display();
        }
    }
    /**
     * 采购商品入库
     */
    public function purchase() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_purchase_mod->create()) {
                $this->error($this->_purchase_mod->getError());
            }
            if ($_POST['goods_id'] == '') {
                $this->error('商品条形码识别错误，请先录入商品基本信息！');
            }
            if ($_POST['price'] == '') {
                $this->error('商品进货价格错误！');
            }
            if ($_POST['number'] == '') {
                $this->error('请输入正确的进货数量！');
            }
            $this->_purchase_mod->publish($data);
            $this->success(L('operation_success'));
        } else {
            $this->display();
        }
    }

    public function edit() {
        if (IS_POST) {
            //获取数据
            if (false === $data = $this->_mod->create()) {
                $this->error($this->_mod->getError());
            }
            if (!$data['cate_id'] || !trim($data['cate_id'])) {
                $this->error('请选择商品分类');
            }

            //条码
            $data['barcode'] = input('post.barcode');
            if ($_POST['barcode'] == '') {
                $this->error('请输入条码');
            }
            //显示数量增量（前台显示数量增量值，显示数量=库存+增量值）
            $data['stockmore'] = input('post.stockmore');
            if ($_POST['stockmore'] == '') {
                $data['stockmore'] = 0;
            } else {
                $data['stockmore'] = intval($data['stockmore']);
            }

            // if($_POST['brand']==''){

            //     $this->error('请选择品牌');
            // }
            //库存
            // if($_POST['goods_stock']<=0){

            //     $this->error('库存不能低于1');
            // }
            if ($_POST['free'] == 1) {
                $data['free'] = 1;
                $data['pingyou'] = 0;
                $data['kuaidi'] = 0;
                $data['ems'] = 0;
            } else if ($_POST['free'] == 2) {
                $data['free'] = 2;
                $data['pingyou'] = input('post.pingyou');
                $data['kuaidi'] = input('post.kuaidi');
                $data['ems'] = input('post.ems');
            }
            //sell
            $data['sell_price'] = I('post.sell_price', 0.0, 'floatval');
            $data['sell_limit_total'] = I('post.sell_limit_total', 0, 'intval');
            $data['sell_limit_person'] = I('post.sell_limit_person', 0, 'intval');
            $data['sell_start_time'] = I('post.sell_start_time');
            $data['sell_end_time'] = I('post.sell_end_time', 0);
            if (empty($data['sell_start_time'])) {
                $data['sell_start_time'] = time();
            } else {
                $data['sell_start_time'] = strtotime($data['sell_start_time']);
            }
            if (!empty($data['sell_end_time'])) {
                $data['sell_end_time'] = strtotime($data['sell_end_time']);
            }

            $item_id = $data['id'];
            $date_dir = date('ym/d/'); //上传目录
            $item_imgs = array(); //相册
            //修改图片
            if (!empty($_FILES['img']['name'])) {
                $result = $this->_upload($_FILES['img'], 'item/' . $date_dir, array(
                    'width' => C('pin_item_bimg.width') . ',' . C('pin_item_img.width') . ',' . C('pin_item_simg.width'),
                    'height' => C('pin_item_bimg.height') . ',' . C('pin_item_img.height') . ',' . C('pin_item_simg.height'),
                    'suffix' => '_b,_m,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    $data['img'] = $date_dir . $result['info'][0]['savename'];
                    //保存一份到相册
                    $item_imgs[] = array(
                        'item_id' => $item_id,
                        'url' => $data['img'],
                    );
                }
            }

            if (isset($_POST['news'])) {
                $data['news'] = 1;
            } else {
                $data['news'] = 0;
            }
            if (isset($_POST['tuijian'])) {
                $data['tuijian'] = 1;
            } else {
                $data['tuijian'] = 0;
            }
            /*=======================by lyye 2014-04-08=======================*/
            if (isset($_POST['is_xiangou'])) {
                $data['is_xiangou'] = 1;
            } else {
                $data['is_xiangou'] = 0;
            }
            $data['xiangou_num'] = trim($_POST['xiangou_num']) ? trim($_POST['xiangou_num']) : 1;
            /*=======================by lyye 2014-04-08=======================*/
            //上传相册
            $file_imgs = array();
            foreach ($_FILES['imgs']['name'] as $key => $val) {
                if ($val) {
                    $file_imgs['name'][] = $val;
                    $file_imgs['type'][] = $_FILES['imgs']['type'][$key];
                    $file_imgs['tmp_name'][] = $_FILES['imgs']['tmp_name'][$key];
                    $file_imgs['error'][] = $_FILES['imgs']['error'][$key];
                    $file_imgs['size'][] = $_FILES['imgs']['size'][$key];
                }
            }
            if ($file_imgs) {
                $result = $this->_upload($file_imgs, 'item/' . $date_dir, array(
                    'width' => C('pin_item_bimg.width') . ',' . C('pin_item_simg.width'),
                    'height' => C('pin_item_bimg.height') . ',' . C('pin_item_simg.height'),
                    'suffix' => '_b,_s',
                ));
                if ($result['error']) {
                    $this->error($result['info']);
                } else {
                    foreach ($result['info'] as $key => $val) {
                        $item_imgs[] = array(
                            'item_id' => $item_id,
                            'url' => $date_dir . $val['savename'],
                            'order' => $key + 1,
                        );
                    }
                }
            }
            //标签
            $tags = input('post.tags', 'trim');
            if (!isset($tags) || empty($tags)) {
                $tag_list = D('tag')->get_tags_by_title($data['intro']);
            } else {
                $tag_list = explode(' ', $tags);
            }
            if ($tag_list) {
                $item_tag_arr = $tag_cache = array();
                $tag_mod = M('tag');
                foreach ($tag_list as $_tag_name) {
                    $tag_id = $tag_mod->where(array('name' => $_tag_name))->getField('id');
                    !$tag_id && $tag_id = $tag_mod->add(array('name' => $_tag_name)); //标签入库
                    $item_tag_arr[] = array('item_id' => $item_id, 'tag_id' => $tag_id);
                    $tag_cache[$tag_id] = $_tag_name;
                }
                if ($item_tag_arr) {
                    $item_tag = M('item_tag');
                    //清除关系
                    $item_tag->where(array('item_id' => $item_id))->delete();
                    //商品标签关联
                    $item_tag->addAll($item_tag_arr);
                    $data['tag_cache'] = serialize($tag_cache);
                }
            }

            //更新商品
            $this->_mod->where(array('id' => $item_id))->save($data);
            //更新图片和相册
            $item_imgs && M('item_img')->addAll($item_imgs);
            //会员价格
            $user_price = input('post.user_price', ',');
            //dump($user_price);exit;
            if ($user_price) {
                foreach ($user_price['cate_id'] as $key => $val) {
                    if ($val && $user_price['price'][$key] != '-1') {
                        $atr['user_price'] = $user_price['price'][$key];
                        $result = count(M('item_userprice')->where(array('item_id' => $item_id, 'cate_id' => $val))->find());
                        if ($result == 0) {
                            $atr['item_id'] = $item_id;
                            $atr['cate_id'] = $val;
                            M('item_userprice')->add($atr);
                        } else {
                            M('item_userprice')->where(array('item_id' => $item_id, 'cate_id' => $val))->save($atr);
                        }
                    }
                }
            }
            //附加属性
            $attr = input('post.attr', ',');
            if ($attr) {
                foreach ($attr['name'] as $key => $val) {
                    if ($val && $attr['value'][$key]) {
                        $atr['item_id'] = $item_id;
                        $atr['attr_name'] = $val;
                        $atr['attr_value'] = $attr['value'][$key];
                        M('item_attr')->add($atr);
                    }
                }
            }
            $this->success(L('operation_success'));
        } else {
            $id = input('get.id', 'intval');
            $item = $this->_mod->where(array('id' => $id))->find();
            //分类
            $spid = $this->_cate_mod->where(array('id' => $item['cate_id']))->getField('spid');
            if ($spid == 0) {
                $spid = $item['cate_id'];
            } else {
                $spid .= $item['cate_id'];
            }
            $this->assign('selected_ids', $spid); //分类选中
            $tag_cache = unserialize($item['tag_cache']);
            $item['tags'] = implode(' ', $tag_cache);
            $this->assign('info', $item);

            //相册
            $img_list = M('item_img')->where(array('item_id' => $id))->select();
            $this->assign('img_list', $img_list);
            //属性
            $attr_list = M('item_attr')->where(array('item_id' => $id))->select();
            $this->assign('attr_list', $attr_list);
            //会员组
            $cate = M('user_category')->field('id,name')->where(array('status' => 1))->select();
            foreach ($cate as $key => $value) {
                //会员价格
                $userprice = M('item_userprice')->where(array('item_id' => $id, 'cate_id' => $value['id']))->find();
                if ($userprice) {
//判断赋值
                    $price = $userprice['user_price'];
                } else {
                    $price = '-1';
                }
                $cate[$key]['user_price'] = $price;
            }
            $this->assign('cate', $cate);
            $this->display();
        }
    }

    function delete_album() {
        $album_mod = M('item_img');
        $album_id = input('get.album_id', 'intval');
        $album_img = $album_mod->where('id=' . $album_id)->getField('url');
        if ($album_img) {
            $ext = array_pop(explode('.', $album_img));
            $album_min_img = C('pin_attach_path') . 'item/' . str_replace('.' . $ext, '_s.' . $ext, $album_img);
            is_file($album_min_img) && @unlink($album_min_img);
            $album_img = C('pin_attach_path') . 'item/' . $album_img;
            is_file($album_img) && @unlink($album_img);
            $album_mod->delete($album_id);
        }
        echo '1';
        exit;
    }

    function delete_attr() {
        $attr_mod = M('item_attr');
        $attr_id = input('get.attr_id', 'intval');
        $attr_mod->delete($attr_id);
        echo '1';
        exit;
    }

    /**
     * 商品审核
     */
    public function check() {
        //分类信息
        $res = $this->_cate_mod->field('id,name')->select();
        $cate_list = array();
        foreach ($res as $val) {
            $cate_list[$val['id']] = $val['name'];
        }
        $this->assign('cate_list', $cate_list);
        //商品信息
        //$map = $this->_search();
        $map = array();
        $map['status'] = 0;
        ($time_start = input('request.time_start', 'trim')) && $map['add_time'][] = array('egt', strtotime($time_start));
        ($time_end = input('request.time_end', 'trim')) && $map['add_time'][] = array('elt', strtotime($time_end) + (24 * 60 * 60 - 1));
        $cate_id = input('request.cate_id', 'intval');
        if ($cate_id) {
            $id_arr = $this->_cate_mod->getChildIds($cate_id, true);
            $map['cate_id'] = array('IN', $id_arr);
            $spid = $this->_cate_mod->where(array('id' => $cate_id))->getField('spid');
            if ($spid == 0) {
                $spid = $cate_id;
            } else {
                $spid .= $cate_id;
            }
        }
        ($keyword = input('request.keyword', 'trim')) && $map['title'] = array('like', '%' . $keyword . '%');
        $this->assign('search', array(
            'time_start' => $time_start,
            'time_end' => $time_end,
            'selected_ids' => $spid,
            'cate_id' => $cate_id,
            'keyword' => $keyword,
        ));
        //分页
        $count = $this->_mod->where($map)->count('id');
        $pager = new \Common\ORG\Page($count, 20);
        $select = $this->_mod->field('id,title,img,tag_cache,cate_id,uid,uname')->where($map)->order('id DESC');
        $select->limit($pager->firstRow . ',' . $pager->listRows);
        $page = $pager->show();
        $this->assign("page", $page);
        $list = $select->select();
        foreach ($list as $key => $val) {
            $tag_list = unserialize($val['tag_cache']);
            $val['tags'] = implode(' ', $tag_list);
            $list[$key] = $val;
        }
        $this->assign('list', $list);
        $this->assign('list_table', true);
        $this->display();
    }

    /**
     * 审核操作
     */
    public function do_check() {
        $mod = D($this->_name);
        $pk = $mod->getPk();
        $ids = trim(input('request.' . $pk), ',');
        $datas['id'] = array('in', $ids);
        $datas['status'] = 1;
        if ($datas) {
            if (false !== $mod->save($datas)) {
                IS_AJAX && $this->ajaxReturn(1, L('operation_success'));
            } else {
                IS_AJAX && $this->ajaxReturn(0, L('operation_failure'));
            }
        } else {
            IS_AJAX && $this->ajaxReturn(0, L('illegal_parameters'));
        }

    }

    /**
     * ajax获取标签
     */
    public function ajax_gettags() {
        $title = input('get.title', 'trim');
        $tag_list = D('tag')->get_tags_by_title($title);
        $tags = implode(' ', $tag_list);
        $this->ajaxReturn(1, L('operation_success'), $tags);
    }

    public function ajax_goodinfo() {
        $barcode = input('get.barcode', 'trim');
        $goodsId = $this->_mod->where("barcode={$barcode}")->getField('id');
        $this->ajaxReturn(1, L('operation_success'), $goodsId);
    }

    public function delete_search() {
        $items_mod = D('item');
        $items_cate_mod = D('item_cate');
        $items_likes_mod = D('item_like');
        $items_pics_mod = D('item_img');
        $items_tags_mod = D('item_tag');
        $items_comments_mod = D('item_comment');

        if (isset($_REQUEST['dosubmit'])) {
            if ($_REQUEST['isok'] == "1") {
                //搜索
                $where = '1=1';
                $keyword = trim($_POST['keyword']);
                $cate_id = trim($_POST['cate_id']);
                $cate_id = trim($_POST['cate_id']);
                $time_start = trim($_POST['time_start']);
                $time_end = trim($_POST['time_end']);
                $status = trim($_POST['status']);
                $min_price = trim($_POST['min_price']);
                $max_price = trim($_POST['max_price']);
                $min_rates = trim($_POST['min_rates']);
                $max_rates = trim($_POST['max_rates']);

                if ($keyword != '') {
                    $where .= " AND title LIKE '%" . $keyword . "%'";
                }
                if ($cate_id != '' && $cate_id != 0) {
                    $where .= " AND cate_id=" . $cate_id;
                }
                if ($time_start != '') {
                    $time_start_int = strtotime($time_start);
                    $where .= " AND add_time>='" . $time_start_int . "'";
                }
                if ($time_end != '') {
                    $time_end_int = strtotime($time_end);
                    $where .= " AND add_time<='" . $time_end_int . "'";
                }
                if ($status != '') {
                    $where .= " AND status=" . $status;
                }
                if ($min_price != '') {
                    $where .= " AND price>=" . $min_price;
                }
                if ($max_price != '') {
                    $where .= " AND price<=" . $max_price;
                }
                if ($min_rates != '') {
                    $where .= " AND rates>=" . $min_rates;
                }
                if ($max_rates != '') {
                    $where .= " AND rates<=" . $max_rates;
                }
                $ids_list = $items_mod->where($where)->select();
                $ids = "";
                foreach ($ids_list as $val) {
                    $ids .= $val['id'] . ",";
                }
                if ($ids != "") {
                    $ids = substr($ids, 0, -1);
                    $items_likes_mod->where("item_id in(" . $ids . ")")->delete();
                    $items_pics_mod->where("item_id in(" . $ids . ")")->delete();
                    $items_tags_mod->where("item_id in(" . $ids . ")")->delete();
                    $items_comments_mod->where("item_id in(" . $ids . ")")->delete();
                    M('album_item')->where("item_id in(" . $ids . ")")->delete();
                    M('item_attr')->where("item_id in(" . $ids . ")")->delete();

                }
                $items_mod->where($where)->delete();

                //更新商品分类的数量
                $items_nums = $items_mod->field('cate_id,count(id) as items')->group('cate_id')->select();
                foreach ($items_nums as $val) {
                    $items_cate_mod->save(array('id' => $val['cate_id'], 'items' => $val['items']));
                    M('album')->save(array('cate_id' => $val['cate_id'], 'items' => $val['items']));
                }

                $this->success('删除成功', U('item/delete_search'));
            } else {
                $this->success('确认是否要删除？', U('item/delete_search'));
            }
        } else {
            $res = $this->_cate_mod->field('id,name')->select();

            $cate_list = array();
            foreach ($res as $val) {
                $cate_list[$val['id']] = $val['name'];
            }
            //$this->assign('cate_list', $cate_list);
            $this->display();
        }
    }
}