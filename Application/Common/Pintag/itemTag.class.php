<?php
/**
 * 文章模板标签解析
 *
 * @author andery
 */
namespace Common\Pintag;
class itemTag {

    public function cate($options) {
        $options['field'] = isset($options['field']) ? trim($options['field']) : '*';
        $options['cateid'] = isset($options['cateid']) ? intval($options['cateid']) : 0;
        $options['where'] = isset($options['where']) ? trim($options['where']) : '';
        $options['num'] = isset($options['num']) ? intval($options['num']) : 0;
        $options['order'] = isset($options['order']) ? trim($options['order']) : 'ordid';
        if ($options['field'] != '*' || $options['where'] || $options['order'] != 'ordid') {
            $item_cate_mod = M('item_cate');
            $map = array('status' => '1');
            $select = $item_cate_mod->field($options['field']); //字段
            $options['cateid'] && $map['pid'] = $options['cateid'];
            $options['where'] && $map['_string'] = $options['where'];
            $select->where($map); //条件
            $options['num'] && $select->limit($options['num']); //个数
            $select->order($options['order']); //排序
            $data = $select->select();
        } else {
            //分类缓存
            $cate_list = D('item_cate')->cateCache();
            if ($options['cateid'] == 0) {
                $cate_list = $cate_list['p'];
            } else {
                $cate_list = $cate_list['s'][$options['cateid']];
            }
            $options['num'] && $cate_list = array_slice($cate_list, 0, $options['num']);
            $data = $cate_list;
        }
        return $data;
    }

    public function lists($options) {
        $options['field'] = isset($options['field']) ? trim($options['field']) : '*';
        $options['cateid'] = isset($options['cateid']) ? intval($options['cateid']) : 0;
        $options['where'] = isset($options['where']) ? trim($options['where']) : '';
        $options['num'] = isset($options['num']) ? intval($options['num']) : 0;
        $options['order'] = isset($options['order']) ? trim($options['order']) : 'ordid,id DESC';

        $item_mod = M('item');
        $select = $item_mod->field($options['field']);
        $map = array('status' => '1');
        $options['cateid'] && $map['cate_id'] = array('in', D('item_cate')->getChildIds($options['cateid'], TRUE));

        //条件
        $select->where($map);
        $options['num'] && $select->limit($options['num']); //数量
        $select->order($options['order']); //排序
        $data = $select->select();
        return $data;
    }
}