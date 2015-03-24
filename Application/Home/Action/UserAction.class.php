<?php
namespace Home\Action;
use Common\Action;

class UserAction extends \Common\Action\userbaseAction {

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('User');
        $user = D('User')->where(array('id' => $this->visitor->info['id']))->find();
        $this->assign('visitor', $user);
    }
    /**
     * 检测手机号是否已经注册
     */
    public function ajaxCheckMobile() {
        $mobile = I('post.mobile');
        if (is_numeric($mobile) == false) {
            echo json_encode(array('status' => -1));
            exit;
        }
        $user = $this->_mod->field('id')->where("`mobile`={$mobile}")->find();
        if (!empty($user) && !empty($user['id'])) {
            echo json_encode(array('status' => 1));
            exit;
        } else {
            echo json_encode(array('status' => 0));
        }
    }
    protected function _isWeixin() {
        if (strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false) {
            return true;
        }
        return false;
    }
    /**
     * ajax登录
     */
    public function ajaxlogin() {

        $mobile = I('post.mobile');
        if (is_numeric($mobile) == false) {
            echo json_encode(array('status' => -1));
            exit;
        }
        $user = $this->_mod->field('id,password')->where("`mobile`={$mobile}")->find();
        if (!empty($user) && !empty($user['id'])) {
            //连接用户中心
            $passport = $this->_user_server();
            $password = I('post.password', '', 'trim');
            $uid = $passport->auth($mobile, $password);
            if (!$uid) {
                IS_AJAX && $this->ajaxReturn(0, $passport->get_error());
                $this->error($passport->get_error());
            }
            //登陆
            $this->visitor->login($uid);
            //登陆完成钩子
            $tag_arg = array('uid' => $uid, 'uname' => $mobile, 'action' => 'login');
            tag('login_end', $tag_arg);
            //同步登陆
            $synlogin = $passport->synlogin($uid);
            if (IS_AJAX) {
                $this->ajaxReturn(1, L('login_successe') . $synlogin);
            } else {
                //跳转到登陆前页面（执行同步操作）
                $ret_url = input('post.ret_url', 'trim');
                if (empty($ret_url)) {
                    $this->success(L('login_successe') . $synlogin, U('User/index'));
                } else {
                    $this->success(L('login_successe') . $synlogin, $ret_url);
                }
            }
            exit;
        } else {
            $sms = I('post.sms', '', 'trim');
            if ($sms != input('session.sms_reg_' . $mobile)) {
                $this->error(L('invalid_sms_code'));
            }
            $username = $mobile;
            $email = '';
            $password = input('post.password', 'trim');
            $repassword = input('post.password_confirm', 'trim');

            if ($password != $repassword) {
                $this->error(L('inconsistent_password')); //确认密码
            }
            $gender = 0;
            //用户禁止
            $ipban_mod = D('ipban');
            $ipban_mod->clear(); //清除过期数据
            $is_ban = $ipban_mod->where("(type='name' AND name='" . $username . "') OR (type='email' AND name='" . $email . "')")->count();

            $is_ban && $this->error(L('register_ban'));

            //连接用户中心
            $passport = $this->_user_server();
            //注册
            $uid = $passport->register($username, $password, $email, $gender);

            !$uid && $this->error($passport->get_error());
            //保存手机号
            $userModel = M('User');
            $userModel->where("`id`={$uid}")->save(array('mobile' => $mobile, 'mobile_valid' => 1));
            //注册完成钩子
            $tag_arg = array('uid' => $uid, 'uname' => $username, 'action' => 'register');
            tag('register_end', $tag_arg);
            //登陆
            $this->visitor->login($uid);
            //登陆完成钩子
            $tag_arg = array('uid' => $uid, 'uname' => $username, 'action' => 'login');
            tag('login_end', $tag_arg);
            //同步登陆
            $synlogin = $passport->synlogin($uid);
            //跳转到登陆前页面（执行同步操作）
            $ret_url = input('post.ret_url', 'trim');
            if (empty($ret_url)) {
                $this->success(L('register_successe') . $synlogin, U('User/index'));
            } else {
                $this->success(L('register_successe') . $synlogin, $ret_url);
            }
        }
    }
    /**
     * 忘记密码修改密码
     */
    public function forgotPassword() {
        if (!empty($this->visitor->info['id'])) {
            $this->redirect(U('User/account'));
        }
        if (IS_POST) {
            $mobile = I('post.mobile');
            $sms = I('post.sms', '', 'trim');
            if ($sms != input('session.sms_reg_' . $mobile)) {
                $this->error(L('invalid_sms_code'));
            }
            $password = input('post.password', 'trim');
            $repassword = input('post.password_confirm', 'trim');

            if ($password != $repassword) {
                $this->error(L('inconsistent_password')); //确认密码
            }

            $passlen = strlen($password);
            if ($passlen < 6 || $passlen > 20) {
                $this->error(L('password_length_error'));
            }
            //连接用户中心
            $passport = $this->_user_server();
            $user = M('User')->field('id')->where('mobile=' . $mobile)->find();
            $result = $passport->edit($user['id'], NULL, array('password' => $password), true);
            if ($result) {
                $msg = array('status' => 1, 'info' => L('forgot_password_success'));
            } else {
                $msg = array('status' => 0, 'info' => $passport->get_error());
            }
            $this->ajaxReturn($msg);
        } else {
            $this->display();
        }
    }

    /**
     * 用户登陆和注册
     */
    public function login() {
        $this->visitor->is_login && $this->redirect('User/index');
        if (IS_POST) {
            $username = input('post.mobile', 'trim');
            $password = input('post.password', 'trim');
            $remember = input('post.remember');
            if (empty($username)) {
                IS_AJAX && $this->ajaxReturn(0, L('please_input') . L('password'));
                $this->error(L('please_input') . L('username'));
            }
            if (empty($username)) {
                IS_AJAX && $this->ajaxReturn(0, L('please_input') . L('password'));
                $this->error(L('please_input') . L('password'));
            }
            //连接用户中心
            $passport = $this->_user_server();
            $uid = $passport->auth($username, $password);
            if (!$uid) {
                IS_AJAX && $this->ajaxReturn(0, $passport->get_error());
                $this->error($passport->get_error());
            }
            //登陆
            $this->visitor->login($uid, $remember);
            //登陆完成钩子
            $tag_arg = array('uid' => $uid, 'uname' => $username, 'action' => 'login');
            tag('login_end', $tag_arg);
            //同步登陆
            $synlogin = $passport->synlogin($uid);
            if (IS_AJAX) {
                $this->ajaxReturn(1, L('login_successe') . $synlogin);
            } else {
                //跳转到登陆前页面（执行同步操作）
                $ret_url = input('post.ret_url', 'trim');
                $this->success(L('login_successe') . $synlogin, U('User/index'));
            }
        } else {
            /* 同步退出外部系统 */
            if (isset($_GET['synlogout']) && !empty($_GET['synlogout'])) {
                $passport = $this->_user_server();
                $synlogout = $passport->synlogout();
            }
            if (IS_AJAX) {
                $resp = $this->fetch('dialog:login');
                $this->ajaxReturn(1, '', $resp);
            } else {
                //来路
                $ret_url = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : __APP__;
                $this->assign('ret_url', $ret_url);
                $this->assign('synlogout', $synlogout);
                $this->assign('isWeixin', $this->_isWeixin());
                $this->_config_seo();
                $this->display();
            }
        }
    }
    /**
     * 添加收货地址
     */
    public function addaddress() {
        if (IS_POST) {
            $user_address = M('user_address');

            $consignee = input('post.consignee', 'trim');
            $sheng = input('post.sheng', 'trim');
            $shi = input('post.shi', 'trim');
            $qu = input('post.qu', 'trim');
            $address = input('post.address', 'trim');
            $phone_mob = input('post.phone_mob', 'trim');

            $data['uid'] = $this->visitor->info['id'];
            $data['consignee'] = $consignee;
            $data['sheng'] = $sheng;
            $data['shi'] = $shi;
            $data['qu'] = $qu;
            $data['address'] = $address;
            $data['mobile'] = $phone_mob;

            if ($user_address->data($data)->add() !== false) {
                $this->redirect('User/address');
            }

        }
        $this->display();
    }

    /**
     * 用户退出
     */
    public function logout() {
        $this->visitor->logout();
        //同步退出
        $passport = $this->_user_server();
        $synlogout = $passport->synlogout();
        //跳转到退出前页面（执行同步操作）
        $this->success(L('logout_successe') . $synlogout, U('Index/index'));
    }

    /**
     * 用户绑定(暂未用)
     */
    public function binding() {
        $user_bind_info = object_to_array(cookie('user_bind_info'));
        $this->assign('user_bind_info', $user_bind_info);
        $this->_config_seo();
        $this->display();
    }
    /**
     * 微信授权登录回来后验证手机号
     */
    public function verifyMobile() {
        if (IS_POST) {
            $sms = input('post.sms', 'trim');
            $uid = input('post.uid', 'trim');
            $mobile = input('post.mobile', 'trim');
            if ($sms != input('session.sms_reg_' . $mobile)) {
                $this->error(L('invalid_sms_code'));
            }
            // 判断并合并用户
            $user = M('user');
            $mobileUser = $user->field('id')->where("`mobile`={$mobile}")->find();
            if (!empty($mobileUser) && !empty($mobileUser['id'])) {
                $wxUser = $user->field('wechatid,nickname,province,city,gender')->where("`id`={$uid}")->find();
                $wxUser['mobile_valid'] = 1;
                $user->where("`id`={$mobileUser['id']}")->save($wxUser);
                //登陆
                $this->visitor->login($mobileUser['id']);
                // 移除微信账号
                $user->where("`id`={$uid}")->delete();
            } else {
                $user->where("`id`={$uid}")->save(array('username' => $mobile, 'mobile' => $mobile, 'mobile_valid' => 1));
                //登陆
                $this->visitor->login($uid);
            }

            $this->redirect('User/index');
            exit;
        } else {
            //关闭注册
            // if (!C('pin_reg_status')) {
            //     $this->error(C('pin_reg_closed_reason'));
            // }
            $this->_config_seo();
            $this->display();
        }
    }

    /**
     * 用户订单
     */
    public function index() {
        $userinfo = input('session.user_info');
        if ($userinfo['mobile_valid'] != 1) {
            redirect(U('User/verifyMobile'));
            exit;
        }

        $item_order = M('item_order');
        $order_detail = M('order_detail');
        if (!isset($_GET['status'])) {
            $status = 2;
        } else {
            $status = $_GET['status'];
        }

        $item_orders = $item_order->order('id desc')->where('status=' . $status . ' and userId=' . $this->visitor->info['id'])->select();
        foreach ((array) $item_orders as $key => $val) {
            $order_details = $order_detail->where("orderId='" . $val['orderId'] . "'")->select();
            foreach ($order_details as $k => $val) {
                $items_attr = $val['item_attr']; //商品属性
                $attr_arr = array_filter(explode(';', $items_attr));
                $attr_list = array();
                foreach ($attr_arr as $ke => $va) {
                    $attr_arr2 = array_filter(explode('|', $va));
                    $attr_list[] = array('name' => $attr_arr2[0], 'value' => $attr_arr2[1]);
                }
                $items['attr'] = $attr_list; //赋值items
                $items = array('title' => $val['title'], 'img' => $val['img'], 'price' => $val['price'], 'quantity' => $val['quantity'], 'itemId' => $val['itemId'], 'attr' => $items['attr']);
                $item_orders[$key]['item'][] = $items;
            }
        }
        $this->assign('item_orders', $item_orders);
        $this->assign('status', $status);
        $this->_config_seo();
        $this->display();
    }

    /**
     * 修改密码
     */
    public function password() {
        if (IS_POST) {
            $oldpassword = input('post.oldpassword', 'trim');
            $password = input('post.password', 'trim');
            $repassword = input('post.repassword', 'trim');
            !$password && $this->error(L('no_new_password'));
            $password != $repassword && $this->error(L('inconsistent_password'));
            $passlen = strlen($password);
            if ($passlen < 6 || $passlen > 20) {
                $this->error('password_length_error');
            }
            //连接用户中心
            $passport = $this->_user_server();
            $result = $passport->edit($this->visitor->info['id'], $oldpassword, array('password' => $password));
            if ($result) {
                $msg = array('status' => 1, 'info' => L('edit_password_success'));
            } else {
                $msg = array('status' => 0, 'info' => $passport->get_error());
            }
            $this->assign('msg', $msg);
        }
        $this->_config_seo();
        $this->display();
    }
    /**
     * 待评论订单商品列表
     **/
    public function commentOrdersList() {
        $orderDetail = M('item_order');
        $uid = $this->visitor->info['id'];
        $map['userId'] = $uid;
        $map['is_comment'] = 0;
        $map['status'] = 4;
        $map['add_time'] = array('gt', strtotime('-1 MONTH'));

        $notCommentProductList = $orderDetail->field('__ORDER_DETAIL__.*')->join('__ORDER_DETAIL__ ON __ORDER_DETAIL__.orderId = __ITEM_ORDER__.orderId', 'LEFT')->where($map)->select();
        $this->assign('items', $notCommentProductList);
        $this->display();
    }
    /**
     * 评论订单商品
     **/
    public function commentOrder() {
        if (IS_POST) {
            $data['order_id'] = I('post.order_id', 0, 'intval');
            $data['user_id'] = intval($this->visitor->info['id']);
            $data['item_id'] = I('post.item_id', 0, 'intval');
            $data['info'] = I('post.info');
            $data['add_time'] = time();
            $result = M('order_comment')->add($data);
            if ($result) {
                M('order_detail')->where('orderId=' . $data['order_id'])->save(array('is_comment' => 1));
                $this->success('评价成功！', U('User/commentOrdersList'));
            } else {
                $this->error('评价失败！请重试。');
            }
        } else {
            $this->assign('orderId', I('get.orderId'));
            $this->assign('itemId', I('get.itemId'));
            $this->display();
        }
    }

    /**
     * 编辑地址
     **/
    public function editAddress() {
        $user_address_mod = M('user_address');
        $id = input('get.id', 'intval');
        $info = $user_address_mod->find($id);

        $this->assign('info', $info);
        $this->display();
    }

    /**
     * 收货地址管理
     */
    public function address() {
        $user_address_mod = M('user_address');
        $id = input('get.id', 'intval');
        $type = input('get.type', 'trim', 'edit');
        if ($id) {
            if ($type == 'del') {
                $user_address_mod->where(array('id' => $id, 'uid' => $this->visitor->info['id']))->delete();
                $msg = array('status' => 1, 'info' => L('delete_success'));
                $this->assign('msg', $msg);
            } else {
                $info = $user_address_mod->find($id);
                $this->assign('info', $info);
            }
        }
        if (IS_POST) {
            $consignee = input('post.consignee', 'trim');
            $address = input('post.address', 'trim');
            //   $zip = input('post.zip', 'trim');
            $mobile = input('post.phone_mob', 'trim');
            $sheng = input('post.sheng', 'trim');
            $shi = input('post.shi', 'trim');
            $qu = input('post.qu', 'trim');
            $id = input('post.id', 'intval');
            if ($id) {
                $result = $user_address_mod->where(array('id' => $id, 'uid' => $this->visitor->info['id']))->save(array(
                    'consignee' => $consignee,
                    'address' => $address,
                    // 'zip' => $zip,
                    'mobile' => $mobile,
                    'sheng' => $sheng,
                    'shi' => $shi,
                    'qu' => $qu,
                ));
                if ($result) {
                    $msg = array('status' => 1, 'info' => L('edit_success'));
                } else {
                    $msg = array('status' => 0, 'info' => L('edit_failed'));
                }
            } else {
                $result = $user_address_mod->add(array(
                    'uid' => $this->visitor->info['id'],
                    'consignee' => $consignee,
                    'address' => $address,
                    'zip' => $zip,
                    'mobile' => $mobile,
                ));
                if ($result) {
                    $msg = array('status' => 1, 'info' => L('add_address_success'));
                } else {
                    $msg = array('status' => 0, 'info' => L('add_address_failed'));
                }
            }
            $this->assign('msg', $msg);
        }

        $address_list = $user_address_mod->where(array('uid' => $this->visitor->info['id']))->select();
        $this->assign('address_list', $address_list);
        $this->_config_seo();
        $this->display();
    }
    /**
     * 检测会员是否存在
     */
    public function check_name($name) {
        $id = input('get.id', 'intval');
        if ($this->_mod->name_exists($name, $id)) {
            $this->ajaxReturn(0, '该会员已经存在');
        } else {
            $this->ajaxReturn();
        }
    }
    /**
     * 检测用户
     */
    public function ajax_check() {
        $type = input('get.type', 'trim', 'email');
        $user_mod = D('user');
        switch ($type) {
            case 'email':
                $email = input('get.J_email', 'trim');
                $user_mod->email_exists($email) ? $this->ajaxReturn(0) : $this->ajaxReturn(1);
                break;

            case 'username':
                $username = input('get.J_username', 'trim');
                $user_mod->name_exists($username) ? $this->ajaxReturn(0) : $this->ajaxReturn(1);
                break;
        }
    }
    /**
     * ajax发送验证码（注册，找回密码）
     **/
    public function ajaxSendSmsVerifyCode() {
        $mobile = input('get.mobile', 'trim');
        if (!preg_match('/1\d{10}/', $mobile) || preg_match('/[^0-9]/', $mobile)) {
            echo json_encode(array('status' => 0, 'info' => L('invalid_mobile')));
            exit;
        }
        $code = '';
        $vc = M('verifycode');
        $date = date('Ymd');
        $codeRow = $vc->field('code, times')->where(array('code_type' => array('eq', '1'), 'mobile' => array('eq', $mobile), 'date' => array('eq', $date)))->find();
        if ($codeRow) {
            if ($codeRow['times'] == 10) {
                echo json_encode(array('status' => 0, 'info' => L('verify_times_out')));
                exit;
            }
            $code = mt_rand(111111, 999999);
            $vc->where(array('code_type' => array('eq', '1'), 'mobile' => array('eq', $mobile), 'date' => array('eq', $date)))->save(array('times' => $codeRow['times'] + 1, 'code' => $code));
        }
        if (empty($code)) {
            $code = mt_rand(111111, 999999);
            $vc->add(array('mobile' => $mobile, 'code_type' => '1', 'date' => $date, 'code' => $code, 'times' => 1));
        }

        session('sms_reg_' . $mobile, $code);
        vendor('Sms.Sms', COMMON_PATH . 'Vendor/');
        $api = \Common\Vendor\Sms\Sms::getInstance(C('SMS_API'));
        $data['cid'] = \Common\Vendor\Sms\Api\SmsWeimi::VERIFY_CODE;
        $data['0'] = $code;
        $data['1'] = C('SMS_VERIFY_CODE_TIME');
        echo json_encode($api->send($mobile, $data));
        exit;
    }
    /*
     * 帐户中心
     */
    public function account() {
        $userid = $this->visitor->info['id'];
        $user = M('user');
        $user_info = $user->where("id='$userid'")->find();
        !$user_info && $this->_404();
        $this->assign('userinfo', $user_info);
        $this->display();
    }

    public function followProduct() {
        $userId = $this->visitor->info['id'];
        if (IS_POST) {
            $itemId = I('post.item_id', 0, 'intval');
            $model = M('item_follow');
            $map = array();
            $map['uid'] = array('eq', $userId);
            $map['item_id'] = array('eq', $itemId);
            $item = $model->where($map)->find();
            if ($item) {
                $this->error('你已经关注过该产品');
                retrun;
            }
            $data['uid'] = $userId;
            $data['item_id'] = $itemId;
            $data['add_time'] = time();
            $result = $model->add($data);
            if ($result) {
                $this->success('关注产品成功！');
            } else {
                $this->error('关注产品失败！');
            }
        } else {
            //列表
            $model = M('item_follow');
            $lists = $model->field('item.id,item.img,item.title,item.price')->join('__ITEM__ AS item ON item.id = __ITEM_FOLLOW__.item_id', 'LEFT')->where('uid=' . $userId)->select();
            $this->assign('lists', $lists);
            $this->display();
        }
    }

    // /**
    //  * 修改用户名（未用，暂定不允许修改）
    //  */
    // public function username() {
    //     $id = $this->visitor->info['id'];
    //     $user_mod = D('user');

    //     if (IS_POST) {
    //         $info = $user_mod->find($id);
    //         $editid = input('post.editid', 'trim');
    //         $date['nickname'] = input('post.nickname', 'trim');
    //         $date['tel'] = input('post.tel', 'trim');

    //         /*if($editid==1){
    //         //echo $editid;
    //         $username = input('post.username','trim');

    //         if($this->_mod->name_exists($username, intval($id))){
    //         //echo "1";exit;
    //         $this->error('用户名已存在');exit;
    //         }else{
    //         $date['username']=$username;
    //         //$date['password'] = input('post.password','trim');
    //         $date['isedit']=$editid;
    //         }
    //         }
    //         if ($editid==2) {
    //         //echo $editid;
    //         $wechatid = input('post.wechatid','trim');
    //         $where = "wechatid='" . $wechatid . "' AND id<>'" . $id . "'";
    //         $result = $this->where($where)->count('id');
    //         if ($result) {
    //         $this->error('微信id已被绑定，请确认是否填写正确！');exit;
    //         } else {
    //         $date['wechatid']=$wechatid;
    //         $date['isedit']=$editid;
    //         }
    //         }*/
    //         switch ($editid) {
    //             case 1:
    //                 $username = input('post.username', 'trim');

    //                 if ($this->_mod->name_exists($username, intval($id))) {
    //                     //echo "1";exit;
    //                     $this->error('用户名已存在');exit;
    //                 } else {
    //                     $date['username'] = $username;
    //                     //$date['password'] = input('post.password','trim');
    //                     $date['isedit'] = $editid;
    //                 }
    //                 break;
    //             case 2:
    //                 $wechatid = input('post.wechatid', 'trim');
    //                 $where = "wechatid='" . $wechatid . "' AND id<>'" . $id . "'";
    //                 $result = $this->_mod->where($where)->count('id');
    //                 if ($result) {
    //                     $this->error('微信id已被绑定，请确认是否填写正确！');exit;
    //                 } else {
    //                     $date['wechatid'] = $wechatid;
    //                     $date['isedit'] = $editid;
    //                 }
    //                 break;
    //             default:
    //                 $date['password'] = input('post.password', 'trim');
    //                 break;
    //         }

    //         echo $date;
    //         $result = $user_mod->where(array('id' => $id))->save($date);

    //         if ($result) {
    //             $this->success('修改成功', U('User/index'));
    //         } else {
    //             $this->error('失败');
    //         }
    //     } else {
    //         $info = $user_mod->find($id);
    //         $this->assign('info', $info);
    //         $this->_config_seo();
    //         $this->display();}
    // }

    // /**
    //  * 关注其他用户（暂时不开发）
    //  */
    // public function follow() {
    //     $uid = input('get.uid', 'intval');
    //     !$uid && $this->ajaxReturn(0, L('follow_invalid_user'));
    //     $uid == $this->visitor->info['id'] && $this->ajaxReturn(0, L('follow_self_not_allow'));
    //     $user_mod = M('user');
    //     if (!$user_mod->where(array('id' => $uid))->count('id')) {
    //         $this->ajaxReturn(0, L('follow_invalid_user'));
    //     }
    //     $user_follow_mod = M('user_follow');
    //     //已经关注？
    //     $is_follow = $user_follow_mod->where(array('uid' => $this->visitor->info['id'], 'follow_uid' => $uid))->count();
    //     $is_follow && $this->ajaxReturn(0, L('user_is_followed'));
    //     //关注动作
    //     $return = 1;
    //     //他是否已经关注我
    //     $map = array('uid' => $uid, 'follow_uid' => $this->visitor->info['id']);
    //     $isfollow_me = $user_follow_mod->where($map)->count();
    //     $data = array('uid' => $this->visitor->info['id'], 'follow_uid' => $uid, 'add_time' => time());
    //     if ($isfollow_me) {
    //         $data['mutually'] = 1; //互相关注
    //         $user_follow_mod->where($map)->setField('mutually', 1); //更新他关注我的记录为互相关注
    //         $return = 2;
    //     }
    //     $result = $user_follow_mod->add($data);
    //     !$result && $this->ajaxReturn(0, L('follow_user_failed'));
    //     //增加我的关注人数
    //     $user_mod->where(array('id' => $this->visitor->info['id']))->setInc('follows');
    //     //增加Ta的粉丝人数
    //     $user_mod->where(array('id' => $uid))->setInc('fans');
    //     //提醒被关注的人
    //     D('user_msgtip')->add_tip($uid, 1);
    //     //把他的微薄推送给我
    //     //TODO...是否有必要？
    //     $this->ajaxReturn(1, L('follow_user_success'), $return);
    // }

    // /**
    //  * 取消关注用户（暂不开发）
    //  */
    // public function unfollow() {
    //     $uid = input('get.uid', 'intval');
    //     !$uid && $this->ajaxReturn(0, L('unfollow_invalid_user'));
    //     $user_follow_mod = M('user_follow');
    //     if ($user_follow_mod->where(array('uid' => $this->visitor->info['id'], 'follow_uid' => $uid))->delete()) {
    //         $user_mod = M('user');
    //         //他是否已经关注我
    //         $map = array('uid' => $uid, 'follow_uid' => $this->visitor->info['id']);
    //         $isfollow_me = $user_follow_mod->where($map)->count();
    //         if ($isfollow_me) {
    //             $user_follow_mod->where($map)->setField('mutually', 0); //更新他关注我的记录为互相关注
    //         }
    //         //减少我的关注人数
    //         $user_mod->where(array('id' => $this->visitor->info['id']))->setDec('follows');
    //         //减少Ta的粉丝人数
    //         $user_mod->where(array('id' => $uid))->setDec('fans');
    //         //删除我微薄中Ta的内容
    //         M('topic_index')->where(array('author_id' => $uid, 'uid' => $this->visitor->info['id']))->delete();
    //         $this->ajaxReturn(1, L('unfollow_user_success'));
    //     } else {
    //         $this->ajaxReturn(0, L('unfollow_user_failed'));
    //     }
    // }

    // /**
    //  * 移除粉丝（暂不开发）
    //  */
    // public function delfans() {
    //     $uid = input('get.uid', 'intval');
    //     !$uid && $this->ajaxReturn(0, L('delete_invalid_fans'));
    //     $user_follow_mod = M('user_follow');
    //     if ($user_follow_mod->where(array('follow_uid' => $this->visitor->info['id'], 'uid' => $uid))->delete()) {
    //         $user_mod = M('user');
    //         //减少我的粉丝人数
    //         $user_mod->where(array('id' => $this->visitor->info['id']))->setDec('fans');
    //         //减少Ta的关注人数
    //         M('user')->where(array('id' => $uid))->setDec('follows');
    //         //删除Ta微薄中我的内容
    //         M('topic_index')->where(array('author_id' => $this->visitor->info['id'], 'uid' => $uid))->delete();
    //         $this->ajaxReturn(1, L('delete_fans_success'));
    //     } else {
    //         $this->ajaxReturn(0, L('delete_fans_failed'));
    //     }
    // }

    // /**
    //  * 充值账户金额（暂不开发账户余额功能）
    //  **/
    // public function chongzhi() {
    //     $this->display();
    // }
    // /**
    //  * 账户余额充值（暂不开发）
    //  **/
    // public function chongzhi_do() {
    //     $jiner = input('post.jiner', 'trim');
    //     if (empty($jiner) || !is_numeric($jiner)) {
    //         $this->error('请输入充值金额');
    //     }
    //     $pay = M('pay')->where(array('pay_type' => 'alipay'))->find();
    //     $alipay = unserialize($pay['config']);
    //     //添加充值记录
    //     $user_acclog = M('user_acclog');
    //     $userid = $this->visitor->info['id'];
    //     $user = M('user');
    //     $userinfo = $user->where("id='$userid'")->find();
    //     $orderId = $userid . date('YmdHis', time()) . rand(1, 99);
    //     $log_data['userid'] = $userid;
    //     $log_data['username'] = $userinfo['username'];
    //     $log_data['fl'] = 2;
    //     $log_data['jiner'] = sprintf('%01.2f', $jiner);
    //     $log_data['addtime'] = time();
    //     $log_data['info'] = '支付宝充值';
    //     $log_data['orderid'] = $orderId;
    //     $log_data['status'] = '处理中';
    //     $user_acclog->add($log_data);
    //     echo '<script type="text/javascript">location.href="api/chongzhipay/alipayapi.php?WIDseller_email=' . $alipay['alipayname'] . '&WIDout_trade_no=' . $orderId . '&WIDsubject=' . $orderId . '&WIDtotal_fee=' . $jiner . '";</script>';
    // }

    // /**
    //  * 帐号绑定（未用）
    //  */
    // public function bind() {
    //     //获取已经绑定列表
    //     $bind_list = M('user_bind')->field('type')->where(array('uid' => $this->visitor->info['id']))->select();
    //     $binds = array();
    //     if ($bind_list) {
    //         foreach ($bind_list as $val) {
    //             $binds[] = $val['type'];
    //         }
    //     }

    //     //获取网站支持列表
    //     $oauth_list = $this->oauth_list;
    //     foreach ($oauth_list as $type => $_oauth) {
    //         $oauth_list[$type]['isbind'] = '0';
    //         if (in_array($type, $binds)) {
    //             $oauth_list[$type]['isbind'] = '1';
    //         }
    //     }
    //     $this->assign('oauth_list', $oauth_list);
    //     $this->_config_seo();
    //     $this->display();
    // }

    // /**
    //  * 个人空间banner背景设置（未用）
    //  */
    // public function custom() {
    //     $cover = $this->visitor->get('cover');
    //     $this->assign('cover', $cover);
    //     $this->_config_seo();
    //     $this->display();
    // }

    // /**
    //  * 取消封面（未用）
    //  */
    // public function cancle_cover() {
    //     $result = M('user')->where(array('id' => $this->visitor->info['id']))->setField('cover', '');
    //     !$result && $this->ajaxReturn(0, L('illegal_parameters'));
    //     $this->ajaxReturn(1, L('edit_success'));
    // }

    // /**
    //  * 上传封面图片（未用）
    //  */
    // public function upload_cover() {
    //     if (!empty($_FILES['cover']['name'])) {
    //         $data_dir = date('ym/d');
    //         $file_name = md5($this->visitor->info['id']);
    //         $result = $this->_upload($_FILES['cover'], 'cover/' . $data_dir, array('width' => '900', 'height' => '330', 'remove_origin' => true), $file_name);
    //         if ($result['error']) {
    //             $this->ajaxReturn(0, $result['info']);
    //         } else {
    //             $ext = array_pop(explode('.', $result['info'][0]['savename']));
    //             $cover = $data_dir . '/' . $file_name . '_thumb.' . $ext;
    //             $data = '<img src="./data/upload/cover/' . $data_dir . '/' . $file_name . '_thumb.' . $ext . '?' . time() . '">';
    //             //更新数据
    //             M('user')->where(array('id' => $this->visitor->info['id']))->setField('cover', $cover);
    //             $this->ajaxReturn(1, L('upload_success'), $data);
    //         }
    //     } else {
    //         $this->ajaxReturn(0, L('illegal_parameters'));
    //     }
    // }
    // /**
    //  * 第三方头像保存（暂未开发）
    //  */
    // private function _save_avatar($uid, $img) {
    //     //获取后台头像规格设置
    //     $avatar_size = explode(',', C('pin_avatar_size'));
    //     //会员头像保存文件夹
    //     $avatar_dir = C('pin_attach_path') . 'avatar/' . avatar_dir($uid);
    //     !is_dir($avatar_dir) && mkdir($avatar_dir, 0777, true);
    //     //生成缩略图
    //     $img = C('pin_attach_path') . 'avatar/temp/' . $img;
    //     foreach ($avatar_size as $size) {
    //         \Common\ORG\Image::thumb($img, $avatar_dir . md5($uid) . '_' . $size . '.jpg', '', $size, $size, true);
    //     }
    //     @unlink($img);
    // }

    // /**
    //  * 修改头像（暂未开发）
    //  */
    // public function upload_avatar() {

    //     if (!empty($_FILES['avatar']['name'])) {
    //         //会员头像规格
    //         $avatar_size = explode(',', C('pin_avatar_size'));
    //         //回去会员头像保存文件夹
    //         $uid = abs(intval($this->visitor->info['id']));
    //         $suid = sprintf('%09d', $uid);
    //         $dir1 = substr($suid, 0, 3);
    //         $dir2 = substr($suid, 3, 2);
    //         $dir3 = substr($suid, 5, 2);
    //         $avatar_dir = $dir1 . '/' . $dir2 . '/' . $dir3 . '/';
    //         //上传头像
    //         $suffix = '';
    //         foreach ($avatar_size as $size) {
    //             $suffix .= '_' . $size . ',';
    //         }
    //         $result = $this->_upload($_FILES['avatar'], 'avatar/' . $avatar_dir, array(
    //             'width' => C('pin_avatar_size'),
    //             'height' => C('pin_avatar_size'),
    //             'remove_origin' => true,
    //             'suffix' => trim($suffix, ','),
    //             'ext' => 'jpg',
    //         ), md5($uid));
    //         if ($result['error']) {
    //             $this->ajaxReturn(0, $result['info']);
    //         } else {
    //             $data = __ROOT__ . '/data/upload/avatar/' . $avatar_dir . md5($uid) . '_' . $size . '.jpg?' . time();
    //             $this->ajaxReturn(1, L('upload_success'), $data);
    //         }
    //     } else {
    //         $this->ajaxReturn(0, L('illegal_parameters'));
    //     }
    // }

    // /**
    //  * 用户消息提示（暂未开发）
    //  */
    // public function msgtip() {
    //     $result = D('user_msgtip')->get_list($this->visitor->info['id']);
    //     $this->ajaxReturn(1, '', $result);
    // }
}