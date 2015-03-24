<?php
namespace Home\Action;
use Common\Action;

class ItemAction extends \Common\Action\frontendAction {

    public function _initialize() {
        parent::_initialize();
        //访问者控制
        if (!$this->visitor->is_login && in_array(ACTION_NAME, array('share_item', 'fetch_item', 'publish_item', 'like', 'unlike', 'delete', 'comment'))) {
            IS_AJAX && $this->ajaxReturn(0, L('login_please'));
            $this->redirect('user/login');
        }
    }

    /**
     * 商品详细页
     */
    public function index() {
        $id = I('get.id', 0, 'intval');
        !$id && $this->_productNotExist();
        $itemMod = M('item');
        $item = $itemMod->where(array('id' => $id, 'status' => 1))->find();
        !$item && $this->_productNotExist();
        // 促销判断
        if ($item['is_sell'] == 1) {
            if ($item['sell_end_time'] <= time()) {
                $update = array(
                    'is_sell' => 0,
                    'sell_end_time' => 0,
                    'sell_start_time' => 0,
                    'sell_sold' => 0,
                    'sell_price' => 0.0,
                );
                $itemMod->where(array('id' => $id))->save($update);
                $item = array_merge($item, $update);
            }
        }
        /**
         * ***品牌
         */
        $brand = M('brandlist')->field('name')->find($item['brand']);
        $item['brand'] = $brand['name'];
        //会员价格
        if ($this->visitor->info) {
            $cate_id = $this->visitor->info['id'];
            $cate = M('item_userprice')->field('user_price')->where(array('cate_id' => $cate_id, 'item_id' => $item['id']))->find();
            if ($cate) {
                $item['price'] = $cate['user_price'];
            }
        }
        //商品相册
        $img_list = M('item_img')->field('url')->where(array('item_id' => $id))->order('ordid')->select();
        //标签
        $item['tag_list'] = unserialize($item['tag_cache']);
        //可能还喜欢
        /*   $item_tag_mod = M('item_tag');
        $db_pre = C('DB_PREFIX');
        $item_tag_table = $db_pre . 'item_tag';
        $maylike_list = array_slice($item['tag_list'], 0, 3, true);
        foreach ($maylike_list as $key => $val) {
        $maylike_list[$key] = array('name' => $val);
        $maylike_list[$key]['list'] = $item_tag_mod->field('i.id,i.img,i.intro,' . $item_tag_table . '.tag_id')->where(array($item_tag_table . '.tag_id' => $key, 'i.id' => array('neq', $id)))->join($db_pre . 'item i ON i.id = ' . $item_tag_table . '.item_id')->order('i.id DESC')->limit(9)->select();
        }
         */
        //第一页评论不使用AJAX利于SEO
        $item_comment_mod = M('order_comment');
        $pagesize = 8;
        $map = array('item_id' => $id);
        $count = $item_comment_mod->where($map)->count('id');
        $pager = $this->_pager($count, $pagesize);
        $pager->path = 'comment_list';
        $pager_bar = $pager->fshow();
        $cmt_list = $item_comment_mod->field('__ORDER_COMMENT__.*,__USER__.mobile')->join('__USER__ ON __USER__.id = __ORDER_COMMENT__.user_id')->where($map)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();

        //$itemMod->where(array('id' => $id))->setInc('hits'); //点击量
        $this->assign('item', $item);

        $this->assign('img_list', $img_list);
        $this->assign('cmt_list', $cmt_list);
        $this->assign('page_bar', $pager_bar);
        $this->_config_seo(C('pin_seo_config.item'), array(
            'item_title' => $item['title'],
            'item_intro' => $item['intro'],
            'item_tag' => implode(' ', (array) $item['tag_list']),
            'seo_title' => $item['seo_title'],
            'seo_keywords' => $item['seo_keys'],
            'seo_description' => $item['seo_desc'],
        ));

        //属性
        $attr_list = M('item_attr')->where(array('item_id' => $id))->select();

        foreach ((array) $attr_list as $k => $v) {
            $attr_list[$k]['name_v'] = explode("|", $v['attr_value']);
        }
        $this->assign('attr_list', $attr_list);
        $this->assign('attr_list_count', count($attr_list));
        // user view log
        if (!empty($this->visitor->info['id'])) {
            $log = array(
                'goods_id' => $id,
                'user_id' => $this->visitor->info['id'],
                'view_time' => time(),
            );
            D('item_view_log')->add($log);
        }
        import('Think.ORG.Cart'); // 导入分页类
        $cart = new \Common\ORG\Cart();
        $num = $cart->getCnt();
        $this->assign('cartnum', $num ? $num : 0);
        $this->display();
    }

    /**
     * 点击去购买
     */
    public function tgo() {
        $url = input('get.to', 'base64_decode');
        redirect($url);
    }

    /**
     * AJAX获取评论列表
     */
    public function comment_list() {
        $id = input('get.id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $itemMod = M('item');
        $item = $itemMod->where(array('id' => $id, 'status' => '1'))->count('id');
        !$item && $this->ajaxReturn(0, L('invalid_item'));
        $item_comment_mod = M('item_comment');
        $pagesize = 8;
        $map = array('item_id' => $id);
        $count = $item_comment_mod->where($map)->count('id');
        $pager = $this->_pager($count, $pagesize);
        $pager->path = 'comment_list';
        $cmt_list = $item_comment_mod->where($map)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
        $this->assign('cmt_list', $cmt_list);
        $data = array();
        $data['list'] = $this->fetch('comment_list');
        $data['page'] = $pager->fshow();
        $this->ajaxReturn(1, '', $data);
    }

    /**
     * 评论一个商品
     */
    public function comment() {
        foreach ($_POST as $key => $val) {
            $_POST[$key] = \Common\ORG\Input::deleteHtmlTags($val);
        }
        $data = array();
        $data['item_id'] = input('post.id', 'intval');
        !$data['item_id'] && $this->ajaxReturn(0, L('invalid_item'));
        $data['info'] = input('post.content', 'trim');
        !$data['info'] && $this->ajaxReturn(0, L('please_input') . L('comment_content'));
        //敏感词处理
        $check_result = D('badword')->check($data['info']);
        switch ($check_result['code']) {
            case 1:    //禁用。直接返回
                $this->ajaxReturn(0, L('has_badword'));
                break;
            case 3:    //需要审核
                $data['status'] = 0;
                break;
        }
        $data['info'] = $check_result['content'];
        //$data['uid'] = $this->visitor->info['id'];
        $data['uname'] = $this->visitor->info['username'];

        //验证商品
        //  $itemMod = M('item');
        //        $item = $itemMod->field('id,uid,uname')->where(array('id' => $data['item_id'], 'status' => '1'))->find();
        //        !$item && $this->ajaxReturn(0, L('invalid_item'));
        //写入评论
        $item_comment_mod = M('item_comment');

        if (false === $item_comment_mod->create($data)) {
            $this->ajaxReturn(0, $item_comment_mod->getError());
        }
        $comment_id = $item_comment_mod->add($datacom);
        if ($comment_id) {
            $this->assign('cmt_list', array(
                array(
                    'uid' => $data['uid'],
                    'uname' => $data['uname'],
                    'info' => $data['info'],
                    'add_time' => time(),
                ),
            ));
            $resp = $this->fetch('comment_list');
            $this->ajaxReturn(1, L('comment_success'), $resp);
        } else {
            $this->ajaxReturn(0, L('comment_failed'));
        }
    }

    //分享商品弹窗
    public function share_item() {
        //支持的网站
        if (false === $site_list = F('item_site_list')) {
            $site_list = D('item_site')->site_cache();
        }
        $this->assign('site_list', $site_list);
        $resp = $this->fetch('dialog:share_item');
        $this->ajaxReturn(1, '', $resp);
    }

    //获取商品信息
    public function fetch_item() {
        $url = input('get.url', 'trim');
        $url == '' && $this->ajaxReturn(0, L('please_input') . L('correct_itemurl'));
        $aid = input('get.aid', 'intval');
        //获取商品信息
        $itemcollect = new itemcollect();
        !$itemcollect->url_parse($url) && $this->ajaxReturn(0, L('please_input') . L('correct_itemurl'));
        if (!$info = $itemcollect->fetch()) {
            $this->ajaxReturn(0, L('fetch_item_failed'));
        }
        $this->assign('item', $info['item']);
        $data = array();
        if ($aid) {
            $this->assign('aid', $aid);
        } else {
            //用户的专辑
            $album_list = M('album')->field('id,title')->where(array('uid' => $this->visitor->info['id']))->select();
            //专辑分类
            if (false === $album_cate_list = F('album_cate_list')) {
                $album_cate_list = D('album_cate')->cate_cache();
            }
            $this->assign('album_cate_list', $album_cate_list);
            $this->assign('album_list', $album_list);
        }
        //专辑分类
        $data['html'] = $this->fetch('dialog:fetch_item');
        $data['item'] = serialize($info['item']);
        $this->ajaxReturn(1, L('fetch_item_success'), $data);
    }

    //发布商品
    public function publish_item() {
        $item = unserialize(input('post.item', 'trim'));
        !$item['key_id'] && $this->ajaxReturn(0, L('publish_item_failed'));
        $album_id = input('post.album_id', 'intval', 0);
        $ac_id = input('post.ac_id', 'intval', 0);
        $item['intro'] = input('post.intro', 'trim');
        $item['info'] = \Common\ORG\Input::deleteHtmlTags($item['info']);
        $item['uid'] = $this->visitor->info['id'];
        $item['uname'] = $this->visitor->info['username'];
        $item['status'] = C('pin_item_check') ? 0 : 1;
        //添加商品
        $itemMod = D('item');
        $result = $itemMod->publish($item, $album_id, $ac_id);
        if ($result) {
            //发布商品钩子
            $tag_arg = array('uid' => $item['uid'], 'uname' => $item['uname'], 'action' => 'pubitem');
            tag('pubitem_end', $tag_arg);
            $this->ajaxReturn(1, L('publish_item_success'));
        } else {
            $this->ajaxReturn(0, $itemMod->getError());
        }
    }

    /**
     * 喜欢一个商品
     * 返回status(todo)
     */
    public function like() {
        $id = input('get.id', 'intval');
        $aid = input('get.aid', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $itemMod = M('item');
        $item = $itemMod->field('id,uid,uname')->where(array('id' => $id, 'status' => '1'))->find();
        !$item && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $uname = $this->visitor->info['username'];
        $item['uid'] == $uid && $this->ajaxReturn(0, L('like_own')); //自己的商品
        $like_mod = M('item_like');
        //是否已经喜欢过
        $is_liked = $like_mod->where(array('item_id' => $item['id'], 'uid' => $uid))->count();
        $is_liked && $this->ajaxReturn(0, L('you_was_liked'));
        if ($like_mod->add(array('item_id' => $item['id'], 'uid' => $uid, 'add_time' => time()))) {
            //增加商品喜欢数
            $itemMod->where(array('id' => $id))->setInc('likes');
            //增加用户被喜欢数
            M('user')->where(array('id' => $item['uid']))->setInc('likes');
            //增加专辑喜欢
            $aid && M('album')->where(array('id' => $aid))->setInc('likes');
            //添加喜欢钩子
            $tag_arg = array('uid' => $uid, 'uname' => $uname, 'action' => 'likeitem');
            tag('likeitem_end', $tag_arg);
            $this->ajaxReturn(1, L('like_success'));
        } else {
            $this->ajaxReturn(0, L('like_failed'));
        }
    }

    /**
     * 删除喜欢
     */
    public function unlike() {
        $id = input('get.id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $like_mod = M('item_like');
        if ($like_mod->where(array('uid' => $uid, 'item_id' => $id))->delete()) {
            //喜欢数不减少~
            $this->ajaxReturn(1, L('unlike_success'));
        } else {
            $this->ajaxReturn(1, L('unlike_failed'));
        }
    }

    /**
     * 删除商品
     */
    public function delete() {
        $id = input('get.id', 'intval');
        $album_id = input('get.album_id', 'intval');
        !$id && $this->ajaxReturn(0, L('invalid_item'));
        $uid = $this->visitor->info['id'];
        $uname = $this->visitor->info['username'];
        if ($album_id) {
            //删除专辑里面的商品
            $result = M('album')->where(array('id' => $album_id, 'uid' => $uid))->count();
            if ($result) {
                M('album_item')->where(array('album_id' => $album_id, 'item_id' => $id))->delete();
                //减少专辑商品数量
                M('album')->where(array('id' => $album_id))->setDec('items');
                //刷新专辑封面
                D('album')->update_cover($album_id);
                $this->ajaxReturn(1, L('del_item_success'));
            } else {
                $this->ajaxReturn(0, L('del_item_failed'));
            }
        } else {
            $result = D('item')->where(array('id' => $id, 'uid' => $uid))->delete();
            //减少用户分享数量
            M('user')->where(array('id' => $uid))->setDec('shares');
            if ($result) {
                //添加删除钩子
                $tag_arg = array('uid' => $uid, 'uname' => $uname, 'action' => 'delitem');
                tag('delitem_end', $tag_arg);
                $this->ajaxReturn(1, L('del_item_success'));
            } else {
                $this->ajaxReturn(0, L('del_item_failed'));
            }
        }
    }

}