<?php
namespace Home\Action;
use Common\Action;

class IndexAction extends \Common\Action\frontendAction {

    public function index() {
        /*****首页广告***/
        $ad = M('ad');
        $ads = $ad->field('url,content,desc')->where('board_id=1 and status=1')->order('ordid asc')->select();
        $this->assign('ad', $ads);
        /*****首页广告end******/

        /****最新商品*****/
        $wherenews = array('news' => 1);
        $news = $this->getItem($wherenews, 6);
        /****最新商品 END*****/

        /****推荐商品*****/
        $wherenews = array('tuijian' => 1);
        $tuijian = $this->getItem($wherenews, 4);

        /****限量抢购*****/
        $wherenews = array('is_xiangou' => 1);
        $xiangou = $this->getItem($wherenews, 4);

        /****搜索商品*****/
        if (IS_POST) {
            $key = input('post.Keyword');
            $this->redirect(U('Index/index'), array('keyword' => $key));
        }
        $where = array();
        if (isset($_GET['keyword'])) {
            $where['title|intro'] = array('like', "%" . $_GET['keyword'] . "%");
            $this->assign('isSearch', 1);
        }
        $search = $this->getItem($where);
        /****搜索商品 END*****/

        $categories = M('item_cate')->where(array('pid' => 0))->order('ordid DESC,id ASC')->select();
        foreach ($categories as $key => $val) {
            $subCategories = M('item_cate')->where(array('pid' => $val['id']))->order('ordid DESC,id ASC')->select();
            foreach ($subCategories as $keySub => $subCategory) {
                $subCategory['subCategories'] = M('item_cate')->where(array('pid' => $subCategory['id']))->order('ordid DESC,id ASC')->select();
                if (count($subCategory['subCategories']) > 0) {
                    $subCategory['url'] = U('Cate/showSubCategories', array('cid' => $subCategory['id']));
                } else {
                    $subCategory['url'] = U('Cate/showCategoryProducts', array('cid' => $subCategory['id']));
                }
                $subCategories[$keySub] = $subCategory;
            }
            if (count($subCategories) > 0) {
                $val['url'] = U('Cate/showSubCategories', array('cid' => $val['id']));
            } else {
                $val['url'] = U('Cate/showCategoryProducts', array('cid' => $val['id']));
            }
            $val['subCategories'] = $subCategories;
            $categories[$key] = $val;
        }
        //SEO
        $this->assign('categories', $categories);

        $this->assign('news', $news);
        $this->assign('tuijian', $tuijian);
        $this->assign('xiangou', $xiangou);
        $this->assign('search', $search);
        $this->_config_seo();
        $this->display();
    }
    public function getItem($where = array(), $limit = 0) {
        $where_init = array('status' => '1');
        $where = array_merge($where_init, $where);
        if (empty($limit)) {
            return $item = M('item')->where($where)->order('ordid DESC')->select();
        } else {
            return $item = M('item')->where($where)->order('ordid DESC')->limit($limit)->select();
        }
    }

    public function ajaxLogin() {

        $user_name = $_POST['user_name'];
        $password = $_POST['password'];

        $user = M('user');
        $users = $user->where("username='" . $user_name . "' and password='" . md5($password) . "'")->find();
        if (is_array($users) && $users['password'] == md5($password)) {
            $data = array('status' => 1);
            $_SESSION['user_info'] = $users;
        } else {
            $data = array('status' => 0);
        }

        echo json_encode($data);
        exit;
    }
    public function ajaxRegister() {
        $username = $_POST['user_name'];
        $user = M('user');
        $count = $user->where("username='" . $username . "'")->find();
        if (is_array($count)) {
            echo 'false';
            // echo json_encode(array('user_nameData'=>true));
        } else {
            echo 'true';
            //echo json_encode(array('user_nameData'=>true));
        }

    }

}