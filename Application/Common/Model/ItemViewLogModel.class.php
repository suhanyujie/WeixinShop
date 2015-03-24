<?php
namespace Common\Model;
use Think\Model;

class ItemViewLogModel extends Model {
    protected $_auto = array(
        array('view_time', 'time', 1, 'function'),
    );
}