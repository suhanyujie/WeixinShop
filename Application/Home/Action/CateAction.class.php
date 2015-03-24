<?php
namespace Home\Action;
use Common\Action;

/**
 * 分类控制器
 */
class CateAction extends \Common\Action\frontendAction {
    public function showAllCategories() {
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
        $this->_config_seo();
        $this->assign('categories', $categories);
        $this->display('Cate/index');
    }
    public function showSubCategories() {
        $category = M('item_cate')->where(array('id' => I('get.cid', 0, 'intval')))->find();
        $subCategories = M('item_cate')->where(array('pid' => $category['id']))->order('ordid DESC,id ASC')->select();
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
            $category['url'] = U('Cate/showSubCategories', array('cid' => $category['id']));
        } else {
            $category['url'] = U('Cate/showCategoryProducts', array('cid' => $category['id']));
        }
        $category['subCategories'] = $subCategories;
        $categories[] = $category;
        //SEO
        $this->_config_seo(C('pin_seo_config.cate'), array(
            'cate_name' => $category['name'],
            'seo_title' => $category['seo_title'],
            'seo_keywords' => $category['seo_keys'],
            'seo_description' => $category['seo_desc'],
        ));
        $this->assign('categories', $categories);
        $this->display('Cate/index');
    }

    public function showCategoryProducts() {
        $cid = I('get.cid', 0, 'intval');
        if ($cid == 0) {
            $this->_404();
        }
        $itemCateModel = D('item_cate');
        $cateInfo = $itemCateModel->getCateInfoById($cid);
        if (!isset($cateInfo['id'])) {
            $this->_404();
        }
        $cateRelate = $itemCateModel->relateCache();
        //筛选参数
        $sort = I('get.sort', 'pop', 'trim');
        $minPrice = I('get.min_price', 0, 'intval');
        $maxPrice = I('get.max_price', 0, 'intval');
        //条件
        $where = array();

        $cateRelate[$cid]['sids'][] = $cid;
        $minPrice && $where['price'][] = array('egt', $minPrice);
        $maxPrice && $where['price'][] = array('elt', $maxPrice); //价格

        //商品信息
        $item = D('item');
        $where['status'] = array('eq', 1);
        $where['cate_id'] = array('in', $cateRelate[$cid]['sids']);
        $itemCount = $item->field('count(*) AS c')->where($where)->find();
        $count = $itemCount['c']; //商品总数
        $pageSize = 12; //每页显示个数
        $pager = $this->_pager($count, $pageSize);
        $itemList = $item->field('id,title,img,price')->where($where)->order("ordid DESC,id DESC")->limit($pager->firstRow . ',' . $pageSize)->select();
        $this->assign('itemList', $itemList);
        //总数大于单页数才显示分页
        $count > $page_size && $this->assign('pageBar', $pager->fshow());
        //当前页码
        $p = input('get.p', 'intval', 1);
        $this->assign('p', $p);
        $this->assign('totalPages', $pager->totalPages); //排序
        $this->assign('cateInfo', $cateInfo); //当前分类信息
        $this->assign('cid', $cateInfo['id']); //当前分类信息
        $this->assign('sort', $sort); //排序
        $this->assign('minPrice', $minPrice); //最低价格
        $this->assign('maxPrice', $maxPrice); //最高价格
        //SEO
        $this->_config_seo(C('pin_seo_config.cate'), array(
            'cate_name' => $cateInfo['name'],
            'seo_title' => $cateInfo['seo_title'],
            'seo_keywords' => $cateInfo['seo_keys'],
            'seo_description' => $cateInfo['seo_desc'],
        ));
        if (IS_AJAX) {
            $html = $this->fetch('Cate/listAjax');
            $this->ajaxReturn(1, $html);
            exit();
        }
        $this->display('Cate/list');
    }
}