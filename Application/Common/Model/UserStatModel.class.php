<?php
namespace Common\Model;
use Think\Model;

class UserStatModel extends Model {
    protected $_auto = array(array('last_time', 'time', 3, 'function'));
}