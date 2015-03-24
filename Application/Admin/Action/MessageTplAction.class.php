<?php
namespace Admin\Action;
use Common\Action;

class MessageTplAction extends \Common\Action\backendAction {
    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('message_tpl');
    }

    protected function _search() {
        $type        = input('get.type', 'trim');
        $map         = array();
        $map['type'] = $type;
        if ($keyword = input('request.keyword', 'trim')) {
            $map['_string'] = "name like '%" . $keyword . "%' OR alias like '%" . $keyword . "%'";
        }
        $this->assign('search', array(
            'keyword' => $keyword,
        ));
        return $map;
    }
}