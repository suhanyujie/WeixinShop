<?php
namespace Common\Model;
use Think\Model;

class ScoreLogModel extends Model {
    protected $_auto = array(array('add_time', 'time', 1, 'function'));
}