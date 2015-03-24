<?php
namespace Common\Vendor\Sms\api;

class SmsWeimi extends \Common\Vendor\Sms\Sms {
    private $userId = YITK2wxSDHfM;
    private $password = 'nm4uwbkb';
    private $sendUrl = 'http://api.weimi.cc/2/sms/send.html';
    const VERIFY_CODE = 'Ei0ZRqnmc1Vf';
    const ORDER_CREATE = 'qguGCKOOFStnull';
    const ORDER_PAID = 'vLZMHRdrUb9q';
    const ORDER_DELIVERY = 'O1OL0dSUkb0f';
    const ORDER_FINISH = 'wWzhg9EBGORL';

    protected $defaultHeaders = array(
        'Connection' => 'keep-alive',
        'Content-Length' => '50',
        'Accept' => '*/*',
        'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.102 Safari/537.36',
        'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept-Encoding' => 'gzip,deflate',
        'Accept-Language' => 'en,en-US;q=0.8',
    );

    public function send($receive, $data) {
        if (is_array($receive)) {
            $receive = implode(',', $receive);
        }
        $header = $this->setHeaders();
        $params = array(
            'uid' => $this->userId,
            'pas' => $this->password,
            'mob' => $receive,
            'cid' => $data['cid'],
            'type' => 'json',
        );
        unset($data['cid']);
        for ($i = 0; $i < count($data); $i++) {
            $params["p" . ($i + 1)] = $data[$i];
        }
        $result = $this->request($this->sendUrl, $params, true, array(), $header);
        $xml = json_decode($result);
        $status = (string) $xml->code;
        if ($status == '0') {
            return array('status' => 1);
        } else {
            //\Think\Log::write('短信验证码发送失败，错误信息：' . (string) $xml->msg);
            $log['result'] = $result;
            $log['$params'] = $params;
            file_put_contents(ROOT_PATH . 'sms.log', var_export($log, true), FILE_APPEND);
            return array('status' => 0, 'info' => (string) $xml->msg);
        }
    }
}