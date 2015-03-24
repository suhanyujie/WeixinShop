<?php
namespace Common\Model;
use Think\Model;

class ItemCateModel extends Model {
    /**
     * 生成spid
     *
     * @param int $pid 父级ID
     */
    public function get_spid($pid) {
        if (!$pid) {
            return 0;
        }
        $pspid = $this->where(array('id' => $pid))->getField('spid');
        if ($pspid) {
            $spid = $pspid . $pid . '|';
        } else {
            $spid = $pid . '|';
        }
        return $spid;
    }

    /**
     * 获取分类下面的所有子分类的ID集合
     *
     * @param int $id
     * @param bool $with_self
     * @return array $array
     */
    public function getChildIds($id, $with_self = false) {
        $spid = $this->where(array('id' => $id))->getField('spid');
        $spid = $spid ? $spid .= $id . '|' : $id . '|';
        $id_arr = $this->field('id')->where(array('spid' => array('like', $spid . '%')))->select();
        $array = array();
        foreach ($id_arr as $val) {
            $array[] = $val['id'];
        }
        $with_self && $array[] = $id;
        return $array;
    }

    /**
     * 获取和分类关联的标签ID集合
     */
    public function get_tag_ids($cate_id) {
        $res = M('item_cate_tag')->field('tag_id')->where(array('cate_id' => $cate_id))->select();
        $ids = array();
        foreach ($res as $tag) {
            $ids[] = $tag['tag_id'];
        }
        return $ids;
    }

    /**
     * 根据ID获取分类名称
     */
    public function get_name($id) {
        //分类数据
        if (false === $cate_data = F('cate_data')) {
            $cate_data = $this->cateDataCache();
        }
        return $cate_data[$id]['name'];
    }

    /**
     * 获取标签分类紧接上级实体分类
     */
    public function get_pentity_id($id) {
        $pentity_id = 0;
        if (false === $cate_data = F('cate_data')) {
            $cate_data = $this->cateDataCache();
        }
        $spid = array_reverse(explode('|', trim($cate_data[$id]['spid'], '|')));
        foreach ($spid as $val) {
            if ($cate_data[$val]['type'] == 0) {
                $pentity_id = $val;
                break;
            }
        }
        return $pentity_id;
    }

    /**
     * 读取写入缓存(有层级的分类数据)
     */
    public function cateCache() {
        $cateList = S('item_cate_model_cate_list');
        if (empty($cateList)) {
            $cateData = $this->field('id,pid,name,img,fcolor,type')->where('status=1')->order('ordid')->select();
            foreach ($cateData as $val) {
                if ($val['pid'] == '0') {
                    $cateList['p'][$val['id']] = $val;
                } else {
                    $cateList['s'][$val['pid']][$val['id']] = $val;
                }
            }
            S('item_cate_model_cate_list', $cateList);
        }

        return $cateList;
    }

    /**
     * 读取写入缓存(无层级分类列表)
     */
    public function cateDataCache() {
        $cateData = S('item_cate_model_cate_data');
        if (empty($cateData)) {
            $result = $this->field('id,pid,spid,name,img,fcolor,type,seo_title,seo_keys,seo_desc')->where('status=1')->order('ordid')->select();
            foreach ($result as $val) {
                $cateData[$val['id']] = $val;
            }
            S('item_cate_model_cate_data', $cateData);
        }
        return $cateData;
    }

    public function getCateInfoById($cid) {
        $cateData = $this->cateDataCache();
        if (isset($cateData[$cid])) {
            return $cateData[$cid];
        }

        return $this->field('id,pid,spid,name,img,fcolor,type,seo_title,seo_keys,seo_desc')->where('`status`=1 AND `id` = ' . $cid)->find();
    }

    /**
     * 分类关系读取写入缓存
     */
    public function relateCache() {

        $cateRelate = S('item_cate_model_relate_cache');
        if (empty($cateRelate)) {
            $cateData = $this->field('id,pid,spid')->where('status=1')->order('ordid')->select();
            foreach ($cateData as $val) {
                $cateRelate[$val['id']]['sids'] = $this->getChildIds($val['id']);//子孙
                if ($val['pid'] == '0') {
                    $cateRelate[$val['id']]['tid'] = $val['id'];//祖先
                } else {
                    $cateRelate[$val['id']]['tid'] = array_shift(explode('|', $val['spid']));//祖先
                }
            }
            S('item_cate_model_relate_cache', $cateRelate);
        }

        return $cateRelate;
    }

    /**
     * 检测分类是否存在
     *
     * @param string $name
     * @param int $pid
     * @param int $id
     * @return bool
     */
    public function name_exists($name, $pid, $id = 0) {
        $where = "name='" . $name . "' AND pid='" . $pid . "' AND id<>'" . $id . "'";
        $result = $this->where($where)->count('id');
        if ($result) {
            return true;
        } else {
            return false;
        }
    }

    public function indexCateList() {
        //分类
        if (false === $indexCateList = S('item_cate_model_index_cate_list')) {
            //分类关系
            $cateRelate = $this->relateCache();
            //分类缓存
            $cateData = $this->cateDataCache();
            //推荐到首页的大类
            $indexCateList = $this->field('id,name,img')->where(array('pid' => '0', 'is_index' => '1', 'status' => '1'))->order('ordid')->select();
            foreach ($indexCateList as $key => $val) {
                //推荐到首页的子类
                $where = array('status' => '1', 'is_index' => '1', 'spid' => array('like', $val['id'] . '|%'));
                $indexCateList[$key]['index_sub'] = $this->field('id,name,img')->where($where)->order('ordid desc')->select();
                //普通子类
                $indexCateList[$key]['sub'] = array();
                foreach ($cateRelate[$val['id']]['sids'] as $sid) {
                    if ($cateData[$sid]['type'] == '0' && $cateData[$sid]['pid'] != $val['id']) {
                        $indexCateList[$key]['sub'][] = $cateData[$sid];
                    }
                    if (count($indexCateList[$key]['sub']) >= 6) {
                        break;
                    }
                }
            }
            S('item_cate_model_index_cate_list', $indexCateList);
        }
        return $indexCateList;
    }

    /**
     * 更新则删除缓存
     */
    protected function _before_write(&$data) {
        S('item_cate_model_cate_data', NULL);
        S('item_cate_model_cate_list', NULL);
        S('item_cate_model_relate_cache', NULL);
        S('item_cate_model_index_cate_list', NUll);
    }

    /**
     * 删除也删除缓存
     */
    protected function _after_delete($data, $options) {
        S('item_cate_model_cate_data', NULL);
        S('item_cate_model_cate_list', NULL);
        S('item_cate_model_relate_cache', NULL);
        S('item_cate_model_index_cate_list', NUll);
    }
}