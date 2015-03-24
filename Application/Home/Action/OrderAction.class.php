<?php
namespace Home\Action;
use Common\Action;

class OrderAction extends \Common\Action\userbaseAction {

    public function zhifu() {
        $this->_config_seo();
        $this->display();
    }

    public function cancelOrder()//取消订单
    {
        $orderId = $_GET['orderId'];
        !$orderId && $this->_404();

        $this->assign('orderId', $orderId);
        $this->_config_seo();
        $this->display();
    }
    public function confirmOrder()//确认收货
    {
        $orderId = $_GET['orderId'];
        $status = $_GET['status'];
        !$orderId && $this->_404();
        $item_order = M('item_order');
        $item = M('item');
        $item_orders = $item_order->where("orderId='$orderId' and userId='" . $this->visitor->info['id'] . "' and status=3")->find();
        if (!is_array($item_orders)) {
            $this->error('该订单不存在!');
        }
        $data['status'] = 4; //收到货
        if ($item_order->where("orderId='$orderId' and userId='" . $this->visitor->info['id'] . "'")->save($data)) {
            $order_detail = M('order_detail');
            $order_details = $order_detail->where("orderId='$orderId'")->select();
            foreach ($order_details as $val) {
                $item->where('id=' . $val['itemId'])->setInc('buy_num', $val['quantity']);
            }
            $this->redirect('User/index?status=' . $status);
        } else {
            $this->error('确认收货失败');
        }

    }

    public function closeOrder()//关闭订单
    {

        $orderId = $_POST['orderId'];
        $cancel_reason = $_POST['cancel_reason'];
        !$orderId && $this->_404();
        $item_order = M('item_order');
        $item = M('item');
        $order_detail = M('order_detail');
        $userId = $this->visitor->info['id'];
        $order = $item_order->where("orderId='$orderId' and userId='$userId'")->find();
        if (!is_array($order)) {
            $this->error('该订单不存在');
        } else {
            $data['status'] = 5;
            $data['closemsg'] = $cancel_reason;
            if ($item_order->where("orderId='$orderId'")->save($data))//设置为关闭
            {
//如果选择货到付款
                if ($order['supportmetho'] == 2) {
                    $order_details = $order_detail->where("orderId='$orderId'")->select();
                    foreach ($order_details as $val) {
                        $item->where('id=' . $val['itemId'])->setInc('goods_stock', $val['quantity']);
                    }
                }
                $this->redirect('User/index');
            } else {
                $this->error('关闭订单失败!');
            }
        }

    }

    public function checkOrder()//查看订单
    {
        $orderId = $_GET['orderId'];
        !$orderId && $this->_404();
        $status = $_GET['status'];
        $item_order = M('item_order');
        $userId = $this->visitor->info['id'];
        $order = $item_order->where("orderId='$orderId' and userId='$userId'")->find();
        if (!is_array($order)) {
            $this->error('该订单不存在');
        } else {

            $order_detail = M('order_detail');

            $order_details = $order_detail->where("orderId='" . $order['orderId'] . "'")->select();
            $item_detail = array();
            foreach ($order_details as $key => $val) {
                $items_attr = $val['item_attr']; //商品属性
                $attr_arr = array_filter(explode(";", $items_attr));
                $attr_list = array();
                foreach ($attr_arr as $ke => $va) {
                    $attr_arr2 = array_filter(explode("|", $va));
                    $attr_list[] = array('name' => $attr_arr2[0], 'value' => $attr_arr2[1]);
                }
                $items[$key]['attr'] = $attr_list; //赋值items

                $items[$key] = array('title' => $val['title'], 'img' => $val['img'], 'price' => $val['price'], 'quantity' => $val['quantity'], 'attr' => $attr_list);

                //$order[$key]['items'][]=$items;
                $item_detail[$key] = $items[$key];

            }
        }

        $this->assign('item_detail', $item_detail);
        $this->assign('order', $order);

        $this->_config_seo();
        $this->display();
    }
    /**
     * 结算页面
     * @modified lushuncheng 2015-01-14 所有商品包邮，不需要按快递收费
     **/
    public function jiesuan() {
        if (count($_SESSION['cart']) > 0) {
            $user_address_mod = M('user_address');
            $address_list = $user_address_mod->where(array('uid' => $this->visitor->info['id']))->select();
            $this->assign('address_list', $address_list);
            $items = M('item');
            foreach ($_SESSION['cart'] as $item) {
                //判断是否限购
                //首先判断购物车数量是否超过限购数量
                $isxiangou = $items->field('is_xiangou,xiangou_num')->where('is_xiangou=1')->find($item['id']);
                if (is_array($isxiangou)) {
                    if ($isxiangou['is_xiangou'] == 1) {
                        if ($item['num'] > $isxiangou['xiangou_num']) {
                            $this->error('对不起，购物车含有限购物品，请核对限购数量');
                        }
                        //再次判断用户是否购买过此商品
                        $order_detail = M('order_detail');
                        $order = M('item_order');
                        $item_orderlist = $order_detail->field('orderId')->where("itemId=$item[id]")->select();
                        if ($item_orderlist) {
                            foreach ($item_orderlist as $orderid) {
                                $map['userId'] = $this->visitor->info['id'];
                                $map['orderId'] = $orderid['orderId'];
                                $map['status'] = array('neq', 5); //取消订单判断
                                $you_num = $order->where($map)->count("id");
                                if ($you_num > 0) {
                                    $this->error('对不起，购物车含有限购物品，并且您已经购买过该商品!!');
                                }
                            }
                        }
                    }
                }
            }

            $cart = new \Common\ORG\Cart();
            $sumPrice = $cart->getPrice();
            $this->assign('sumPrice', $sumPrice);

            $this->_config_seo();
            $this->display();
        } else {
            $this->redirect('Shopcart/index');
        }
    }

    public function pay()//出订单
    {
        if (IS_POST && count($_SESSION['cart']) > 0) {
            $cart = new \Common\ORG\Cart();
            $user_address = M('user_address');
            $item_order = M('item_order');
            $order_detail = M('order_detail');
            $item_goods = M('item');
            $this->visitor->info['id']; //用户ID
            $this->visitor->info['username']; //用户账号
            $this->visitor->info['wechatid']; //用户账号

            //生成订单号
            $dingdanhao = date("Y-m-dH-i-s");
            $dingdanhao = str_replace("-", "", $dingdanhao);
            $dingdanhao .= rand(1000, 2000);

            $time = time(); //订单添加时间
            $address_options = input('post.address_options', 'intval'); //地址  0：刚填的地址 大于0历史的地址
            $shipping_id = input('post.shipping_id', 'intval'); //配送方式
            $postscript = input('post.postscript', 'trim'); //卖家留言

            $data['note'] = $postscript;

            $data['freetype'] = 0;
            $data['order_sumPrice'] = $cart->getPrice();
            if ($data['order_sumPrice'] < C('FREE_DELIVERY_AMOUNT')) {
                $data['freeprice'] = C('DELIVERY_FEE');
                $data['order_sumPrice'] += $data['freeprice'];
            }

            $data['orderId'] = $dingdanhao; //订单号
            $data['add_time'] = $time; //添加时间
            $data['goods_sumPrice'] = $cart->getPrice(); //商品总额
            $data['userId'] = $this->visitor->info['id']; //用户ID
            if ($this->visitor->info['username']) {
                $data['userName'] = $this->visitor->info['username']; //用户名
            } else {
                $data['userName'] = $this->visitor->info['wechatid']; //用微信id做用户名
            }
            if ($address_options == 0) {
                $consignee = input('post.consignee', 'trim'); //真实姓名
                $sheng = input('post.sheng', 'trim'); //省
                $shi = input('post.shi', 'trim'); //市
                $qu = input('post.qu', 'trim'); //区
                $address = input('post.address', 'trim'); //详细地址
                $phone_mob = input('post.phone_mob', 'trim'); //电话号码
                $save_address = input('post.save_address', 'trim'); //是否保存地址

                $data['address_name'] = $consignee; //收货人姓名
                $data['mobile'] = $phone_mob; //电话号码
                $data['address'] = $sheng . $shi . $qu . $address; //地址

                if ($save_address)//保存地址
                {
                    $add_address['uid'] = $this->visitor->info['id'];
                    $add_address['consignee'] = $consignee;
                    $add_address['address'] = $address;
                    $add_address['mobile'] = $phone_mob;
                    $add_address['sheng'] = $sheng;
                    $add_address['shi'] = $shi;
                    $add_address['qu'] = $qu;

                    $user_address->data($add_address)->add();
                }

            } else {
                $userId = $this->visitor->info['id'];
                $address = $user_address->where("uid='$userId'")->find($address_options); //取到地址

                $data['address_name'] = $address['consignee']; //收货人姓名
                $data['mobile'] = $address['mobile']; //电话号码
                $data['address'] = $address['sheng'] . $address['shi'] . $address['qu'] . $address['address']; //地址
            }
            if ($orderid = $item_order->data($data)->add())//添加订单成功
            {
                $orders['orderId'] = $dingdanhao;
                foreach ($_SESSION['cart'] as $item) {
                    $orders['itemId'] = $item['id']; //商品ID
                    $orders['title'] = $item['name']; //商品名称
                    $orders['img'] = $item['img']; //商品图片
                    $orders['price'] = $item['price']; //商品价格
                    $orders['quantity'] = $item['num']; //购买数量
                    $orders['item_attr'] = $item['attr']; //商品属性
                    $order_detail->data($orders)->add();
                }

                $cart->clear(); //清空购物车

                $this->assign('orderid', $orderid); //订单ID
                $this->assign('dingdanhao', $dingdanhao); //订单号
                $this->assign('order_sumPrice', $data['order_sumPrice']);
                vendor('Sms.Sms', COMMON_PATH . 'Vendor/');
                $api = \Common\Vendor\Sms\Sms::getInstance(C('SMS_API'));
                $data['cid'] = \Common\Vendor\Sms\Api\SmsWeimi::ORDER_CREATE;
                $data['0'] = $this->visitor->info['mobile'];
                $data['1'] = $dingdanhao;
                $data['2'] = C('ORDER_KEEP_TIME');
                $api->send($mobile, $data);
            } else {
                $this->error('生成订单失败!');
            }
        } else if (isset($_GET['orderId'])) {
            $item_order = M('item_order');
            $orderId = $_GET['orderId']; //订单号
            $userId = $this->visitor->info['id'];
            $orders = $item_order->where("userId='$userId' and orderId='$orderId'")->find();
            if (!is_array($orders)) {
                $this->_404();
            }

            if (empty($orders['supportmetho']) || $orders['supportmetho'] == 4)//是否已有支付方式
            {
                $this->assign('orderid', $orders['id']); //订单ID
                $this->assign('dingdanhao', $orders['orderId']); //订单号
                $this->assign('order_sumPrice', $orders['order_sumPrice']);
            } elseif ($orders['supportmetho'] == 1)//选择支付宝
            {
                $pay = M('pay')->where(array('pay_type' => 'alipay'))->find();
                $alipay = unserialize($pay['config']);
                //$this->assign('alipayview',$pay['status']);
                echo "<script>location.href='api/wapalipay/alipayapi.php?WIDseller_email=" . $alipay['alipayname'] . "&WIDout_trade_no=" . $orderId . "&WIDsubject=" . $orderId . "&WIDtotal_fee=" . $orders['order_sumPrice'] . "'</script>";
            } elseif ($orders['supportmetho'] == 3)//选择微信支付
            {
                //$pay=M('pay')->where(array('pay_type'=>'wxpay'))->find();
                //dump($orders);exit;
                //$wxpay=unserialize($pay['config']);
                $wxconfig = $this->wxconfig();
                $ip = get_client_ip(); //获取ip
                //echo $ip;exit;
                echo "<script>location.href='api/wxpay/jsapicall.php?ip=" . $ip . "&partner=" . $wxconfig['partnerid'] . "&out_trade_no=" . $orderId . "&body=" . $orderId . "&total_fee=" . $orders['order_sumPrice'] . "&notify_url=" . $wxconfig['notify_url'] . "&showwxpaytitle=1'</script>";
            } elseif ($orders['supportmetho'] == 4) {
                //支付宝个人收款主页收款
                $modpayset = M('setting');
                $alipayhome = $modpayset->where("name='alipayhome'")->getField('data');
                echo "<script>location.href='$alipayhome'</script>";exit;
            }
        } else {
            $this->redirect('User/index');
        }
        $alipay = M('pay')->where(array('pay_type' => 'alipay'))->find();
        $this->assign('alipaystatus', $alipay['status']);
        $wxpay = M('pay')->where(array('pay_type' => 'wxpay'))->find();
        $this->assign('wxpaystatus', $wxpay['status']);
        $this->display();
    }

    public function end() {
        if (IS_POST) {
            $payment_id = $_POST['payment_id'];
            $orderid = $_POST['orderid'];
            $dingdanhao = $_POST['dingdanhao'];
            $userId = $this->visitor->info['id'];
            $item_order = M('item_order')->where("userId='$userId' and orderId='$dingdanhao'")->find();

            !$item_order && $this->_404();
            if ($payment_id == 2)//货到付款
            {
                $data['status'] = 2;
                $data['supportmetho'] = 2;
                $data['support_time'] = time();
                $userId = $this->visitor->info['id'];
                if (M('item_order')->where("userId='$userId' and orderId='$dingdanhao'")->data($data)->save()) {
                    $order_details = M('order_detail')->where("orderId='$dingdanhao'")->select();

                    foreach ($order_details as $val) {
                        M('item')->where('id=' . $val['itemId'])->setDec('goods_stock', $val['quantity']);
                    }
                    $this->redirect('User/index');
                } else {
                    $this->error('操作失败!');
                }
            } elseif ($payment_id == 1)//支付宝
            {

                $data['supportmetho'] = 1;
                $userId = $this->visitor->info['id'];
                if (M('item_order')->where("userId='$userId' and orderId='$dingdanhao'")->data($data)->save()) {
                    $pay = M('pay')->where(array('pay_type' => 'alipay'))->find();
                    $alipay = unserialize($pay['config']);

                    echo "<script>location.href='api/wapalipay/alipayapi.php?WIDseller_email=" . $alipay['alipayname'] . "&WIDout_trade_no=" . $dingdanhao . "&WIDsubject=" . $dingdanhao . "&WIDtotal_fee=" . $item_order['order_sumPrice'] . "'</script>";

                } else {
                    $this->error('支付宝操作失败!');
                }

            } elseif ($payment_id == 3)//微信支付
            {
                $data['supportmetho'] = 3;
                $userId = $this->visitor->info['id'];
                if (M('item_order')->where("userId='$userId' and orderId='$dingdanhao'")->data($data)->save()) {

                    //$pay=M('pay')->where(array('pay_type'=>'wxpay'))->find();
                    //$wxpay=unserialize($pay['config']);
                    $wxconfig = $this->wxconfig();
                    //var_dump($wxconfig);
                    $ip = get_client_ip(); //获取ip
                    echo "<script>location.href='api/wxpay/jsapicall.php?ip=" . $ip . "&partner=" . $wxconfig['partnerid'] . "&out_trade_no=" . $dingdanhao . "&body=" . $dingdanhao . "&total_fee=" . $item_order['order_sumPrice'] . "&notify_url=" . $wxconfig['notify_url'] . "&showwxpaytitle=1'</script>";
                } else {
                    //echo M()->getLastSql();exit;
                    $this->error('微信支付失败!');
                }
                /*=======================by lyye 2014-03-29=======================*/
            } else if ($payment_id == 4)//余额支付
            {
                $this->redirect('Order/payYuer', array('orderId' => $dingdanhao));
                /*=======================by lyye 2014-03-29=======================*/
            } elseif ($payment_id == 5)//支付宝个人收款主页收款
            {
                $data['supportmetho'] = 5;
                if (M('item_order')->where('userId="' . $this->visitor->info['id'] . '" and orderId="' . $dingdanhao . '"')->data($data)->save()) {
                    $modpayset = M('setting');
                    $alipayhome = $modpayset->where("name='alipayhome'")->getField('data');
                    echo "<script>location.href='$alipayhome'</script>";exit;
                } else {
                    $this->error('支付类型存储失败!');
                }
            } else {
                $this->error('操作失败!');
            }
        }
    }
    /*=======================by lyye 2014-03-29=======================*/
    public function payYuer() {
        $item_order = M('item_order');
        $orderId = $_GET['orderId']; //订单号
        $userId = $this->visitor->info['id'];
        $orders = $item_order->where("userId='$userId' and orderId='$orderId'")->find();
        if (!is_array($orders)) {
            $this->_404();
        }

        $this->assign('orderid', $orders['id']); //订单ID
        $this->assign('dingdanhao', $orders['orderId']); //订单号
        $this->assign('order_sumPrice', $orders['order_sumPrice']); //订单金额
        //读取会员帐户余额
        $user = M('user');
        $userinfo = $user->where("id='$userId'")->find();
        $this->assign('user_yuer', $userinfo['user_account']);
        if ($orders['order_sumPrice'] > $userinfo['user_account'])//如果订单金额大于帐户余额
        {
            $tsmsg = "提示：您的帐户余额已不足。<a href='javascript:void(0)'>请点击充值</a>";
            $this->assign('tsmsg', $tsmsg);
        }
        $this->display();
    }

    public function payYuerSubmit() {
        $user_info = M('user');
        $user_acclog = M('user_acclog');
        $item_order = M('item_order');

        $orderid = $_POST['orderid'];
        $dingdanhao = $_POST['dingdanhao'];
        $userId = $this->visitor->info['id'];
        $order_info = $item_order->where("userId='$userId' and orderId='$dingdanhao'")->find();
        !$order_info && $this->_404();
        //读取会员帐户余额
        $user = M('user');
        $userinfo = $user->where("id='$userId'")->find();
        if ($order_info['order_sumPrice'] > $userinfo['user_account']) {
            $this->error('对不起，您的余额不足，请充值');
        } else {
            //更新用户帐户
            $user_data['user_account'] = $userinfo['user_account'] - $order_info['order_sumPrice'];
            $user_info->where("id=$userId")->save($user_data);
            //添加帐户记录
            $log_data['userid'] = $userId;
            $log_data['username'] = $userinfo['username'];
            $log_data['fl'] = 1;
            $log_data['jiner'] = $order_info['order_sumPrice'];
            $log_data['addtime'] = time();
            $log_data['info'] = '支付成功！订单号：' . $dingdanhao;
            $log_data['orderid'] = $userId . date("YmdHis", time()) . rand(1, 99);
            $log_data['status'] = '成功';
            $user_acclog->add($log_data);
            //更新订单状态 支付时间
            $order_data['status'] = 2;
            $order_data['support_time'] = time();
            $item_order->where("orderId='$dingdanhao'")->save($order_data);
            $this->success('订单支付成功，请等待发货!!!', U('User/index'));
        }

    }
    /*=======================by lyye 2014-03-29=======================*/

    public function getFree($type) {
        $cart = new \Common\ORG\Cart();
        $money = 0;
        $items = M('item');

        $method = array(1 => 'pingyou', 2 => 'kuaidi', 3 => 'ems');
        //echo $method[$type];exit;
        foreach ($_SESSION['cart'] as $item) {
            $free = $items->field('free,pingyou,kuaidi,ems')->where('free=2')->find($item['id']);
            if (is_array($free)) {
                $money += $free[$method[$type]];

            }
        }
        return $money;
    }

    /**
     *@wxpay config
     * 微信基本配置
     */
    public function wxconfig() {
        $wxpay = M('pay')->where(array('pay_type' => 'wxpay'))->find();
        $wxpayconfig = unserialize($wxpay['config']);
        $wxpobj['appId'] = $wxpayconfig['appid'];
        $wxpobj['appsecret'] = $wxpayconfig['appsecret'];
        $wxpobj['signkey'] = $wxpayconfig['signkey'];
        $wxpobj['partnerid'] = $wxpayconfig['partnerid'];
        $wxpobj['partnerkey'] = $wxpayconfig['partnerkey'];
        $wxpobj['notify_url'] = "http://" . $_SERVER['SERVER_NAME'] . __ROOT__ . "/api/wxpay/notifyurl.php";
        $wxpobj['signType'] = 'SHA1';
        $wxpobj['bank_type'] = 'WX';
        $wxpobj['fee_type'] = '1';
        $wxpobj['spbill_create_ip'] = get_client_ip();
        $wxpobj['input_charset'] = 'UTF-8';
        return $wxpobj;
    }
}