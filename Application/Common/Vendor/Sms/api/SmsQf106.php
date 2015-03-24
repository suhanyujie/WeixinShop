<?php
namespace Common\Vendor\Sms\api;

class SmsQf106 extends \Common\Vendor\Sms\Sms {
    private $userId = 10218;
    private $account = 'maoyan';
    private $password = 'Maoyan2014';
    private $sendUrl = 'http://www.qf106.com/sms.aspx?action=send';

    protected $defaultHeaders = array(
        'Connection' => 'keep-alive',
        'Content-Length' => '50',
        'Accept' => '*/*',
        'User-Agent' => 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.102 Safari/537.36',
        'Content-Type' => 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept-Encoding' => 'gzip,deflate',
        'Accept-Language' => 'en,en-US;q=0.8',
    );

    public function send($receive, $message) {
        if (is_array($receive)) {
            $receive = implode(',', $receive);
        }
        $header = $this->setHeaders();
        $params = array(
            'userid' => $this->userId,
            'account' => $this->account,
            'password' => $this->password,
            'mobile' => $receive,
            'action' => 'send',
            'sendTime' => '',
            'extno' => '',
            'content' => $message,
        );
        $result = $this->request($this->sendUrl, $params, true, array(), $header);

        if ($result) {
            return array('status' => 1);
        } else {
            return array('status' => 0, 'info' => (string) $xml->message);
        }
    }
}