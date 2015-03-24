<?php
namespace Common\Model;
use Think\Model;

class ItemPurchaseModel extends Model {
    public function publish($data) {
        $data['date'] = time();
        $this->create($data);
        $this->startTrans();
        $itemId = $this->add();
        if ($itemId) {
            $itemMod = D('item');
            $item    = $itemMod->where("id={$data['goods_id']}")->find();
            $result  = $itemMod->where("id={$data['goods_id']}")->setField('goods_stock', $item['goods_stock']+$data['number']);
            if ($result) {
                $this->commit();
                return true;
            } else {
                $this->rollback();
                $this->error = L('publish_purchase_failed');
                return false;
            }
        } else {
            $this->error = L('publish_purchase_failed');
            return false;
        }
    }

    public function updateNumber($id, $goodsId, $number) {
        $oldData = $this->where("id={$id}")->find();
        $this->startTrans();
        $this->setField('number', $number);
        $itemMod = D('item');
        $result  = $itemMod->where("id={$data['goods_id']}")->setInc('goods_stock', $number - $oldData['number']);
        if ($result) {
            $this->commit();
            return true;
        } else {
            $this->rollback();
            $this->error = L('modify_purchase_failed');
            return false;
        }
    }
}