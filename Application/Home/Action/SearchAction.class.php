<?php
/**
 * 独立搜索页面
 */
namespace Home\Action;
use Common\Action;

class SearchAction extends \Common\Action\frontendAction {

    public function index() {
        $q = input('get.q', 'trim');
        $t = input('get.type', 'trim', 'item');
        $action = '_search_' . $t;
        $this->$action($q);
        $this->assign('q', $q);
        $this->assign('type', $t);
        $this->display($t);
    }

    public function recommend() {
        //商品
        $sort = input('get.sort', 'trim', 'pop');
        //条件
        $where = array();
        //排序：潮流(pop)，最热(hot)，最新(new)
        switch ($sort) {
            case 'pop':
                $order = 'likes DESC';
                break;
            case 'hot':
                $order = 'hits DESC';
                break;
            case 'new':
                $order = 'id DESC';
                break;
        }
        $where = array('tuijian' => 1, 'status' => '1');
        $item = M('item');
        $count = $item->where($where)->count(); //商品总数

        $page_size = 12; //每页显示个数
        $pager = $this->_pager($count, $page_size);
        $item_list = $item->field('id,title,img,price')->where($where)->order('ordid asc,id desc')->limit($pager->firstRow . ',' . $page_size)->select();

        $this->assign('item_list', $item_list);
        //当前页码
        $p = input('get.p', 'intval', 1);
        $this->assign('p', $p);
        //当前页面总数大于单次加载数才会执行动态加载
        if (($count - ($p - 1) * $page_size) > $spage_size) {
            $this->assign('show_load', 1);
        }
        //总数大于单页数才显示分页
        $count > $page_size && $this->assign('page_bar', $pager->fshow());
        //最后一页分页处理
        if ((count($item_list) + $page_size * ($p - 1)) == $count) {
            $this->assign('show_page', 1);
        }

        $this->assign('sort', $sort); //排序
        //SEO
        $this->_config_seo(array(
            'title' => '推荐产品' . '-' . C('pin_site_name'),
        ));
        $this->display();
    }

    /**
     * 搜宝贝
     */
    private function _search_item($q) {
        //筛选参数
        $sort = I('get.sort', 'pop', 'trim');
        if ($q) {
            $where = array('status' => '1');
            $where['title'] = array('like', '%' . $q . '%');

            $item = M('item');
            $itemCount = $item->field('count(*) AS c')->where($where)->find();
            $count = $itemCount['c']; //商品总数
            $pageSize = 12; //每页显示个数
            $pager = $this->_pager($count, $pageSize);
            $itemList = $item->field('id,title,img,price')->where($where)->order("ordid DESC,id DESC")->limit($pager->firstRow . ',' . $pageSize)->select();
            //总数大于单页数才显示分页
            $count > $page_size && $this->assign('pageBar', $pager->fshow());
            //当前页码
            $p = input('get.p', 'intval', 1);
            $this->assign('p', $p);
            $this->assign('totalPages', $pager->totalPages); //总页数
            $this->assign('empty', '<span style="margin-top:20px;">抱歉，没有找到有"' . $q . '"的搜索结果!</span>');
            $this->assign('item_list', $itemList);

            if (IS_AJAX) {
                $html = $this->fetch('Cate/listAjax');
                $this->ajaxReturn(1, $html);
                exit();
            }
        }
        $this->assign('sort', $sort);
        $this->_config_seo(array(
            'title' => sprintf(L('search_item_title'), $q) . '-' . C('pin_site_name'),
        ));
    }
    /**
     * 搜用户
     */
    private function _search_user($q) {
        if ($q) {
            $user_mod = M('user');
            $where = array('status' => '1');
            $where['username'] = array('like', '%' . $q . '%');
            $count = $user_mod->where($where)->count('id');
            $pager = $this->_pager($count, $pagesize);
            $user_list = $user_mod->field('id,username,province,city,fans,tags,intro')->where($where)->order('id DESC')->limit($pager->firstRow . ',' . $pager->listRows)->select();
            $this->assign('count', $count);
            $this->assign('user_list', $user_list);
            $this->assign('page_bar', $pager->fshow());
        }
        $this->_config_seo(array(
            'title' => sprintf(L('search_user_title'), $q) . '-' . C('pin_site_name'),
        ));
    }

}