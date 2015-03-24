<?php
namespace Common\Vendor\Sms;

class Sms {
    protected $_cookies = array();
    protected $header = null;

    static function getInstance($type) {
        $class = 'Sms' . ucfirst(strtolower($type));
        $classFile = dirname(__FILE__) . "/api/{$class}.php";
        if (!file_exists($classFile)) {
            throw new \Exception("Sms API {$type} Not Exist.", 'SMS001');
        }
        require_once $classFile;
        $class = '\Common\Vendor\Sms\api\\' . $class;
        return new $class();
    }

    public function send($receive, $msg) {

    }

    protected function request($url, $data = array(), $post = false, $cookies = array(), $headers = array()) {
        $s = curl_init();
        curl_setopt($s, CURLOPT_TIMEOUT, 30);
        curl_setopt($s, CURLOPT_MAXREDIRS, 4);
        curl_setopt($s, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($s, CURLOPT_FOLLOWLOCATION, 1);
        curl_setopt($s, CURLOPT_HEADER, true);
        curl_setopt($s, CURLOPT_HTTPHEADER, $headers);
        if (isset($headers['User-Agent'])) {
            curl_setopt($s, CURLOPT_USERAGENT, $headers['User-Agent']);
        }
        if (isset($headers['Referer'])) {
            curl_setopt($s, CURLOPT_REFERER, $headers['Referer']);
        }
        $this->_cookies = array_merge($this->_cookies, $cookies);
        foreach ((array) $this->_cookies as $k => $v) {
            $_cookies[] = str_replace('=', '%25', $k) . '=' . str_replace(';', '%3B', $v);
        }
        if (!empty($_cookies)) {
            $_cookiesStr = implode($_cookies, '; ');
            curl_setopt($s, CURLOPT_COOKIE, $_cookiesStr);
        }

        if ($post == true) {
            curl_setopt($s, CURLOPT_POST, true);
            curl_setopt($s, CURLOPT_POSTFIELDS, http_build_query($data));
        } else {
            $urlGet = http_build_query($data);
            $url = strpos($url, '?') !== false ? $url . $urlGet : $url . '?' . $urlGet;
        }
        curl_setopt($s, CURLOPT_URL, $url);
        $html = curl_exec($s);

        // $_html   = explode('\r\n\r\n', $html);
        $headers = substr($html, 0, strpos($html, "\r\n\r\n"));
        $body = ltrim(substr($html, strpos($html, "\r\n\r\n")));
        $_headersTwo = substr($body, 0, strpos($body, "\r\n\r\n"));

        if (strpos($_headersTwo, 'HTTP/1.1 200 OK') !== false) {
            $headers = $_headersTwo;
            $body = ltrim(substr($body, strpos($body, "\r\n\r\n")));
        }
        preg_match_all('/Set-Cookie:(.+)/iU', $headers, $_cookiesMatch);
        foreach ((array) $_cookiesMatch as $_cookieStr) {
            $v2 = trim($_cookieStr);
            $v2 = explode('; ', $v2);
            foreach ($v2 as $key => $value) {
                $cookieName = substr($value, 0, stripos($value, '='));
                if (empty($cookieName)) {
                    continue;
                }
                $cookieValue = substr($value, stripos($value, '=') + 1);
                if (strtolower($cookieName) == 'expires'
                    || strtolower($cookieName) == 'path'
                    || strtolower($cookieValue) == 'deleted'
                    || strtolower($cookieName) == 'domain') {
                    continue;
                }
                if (empty($cookieValue)) {
                    continue;
                }
                $this->_cookies[$cookieName] = $cookieValue;
            }
        }
        return $body;
    }
    protected function resetHeaders() {
        $this->header = $this->defaultHeaders;
    }

    protected function setHeaders($headers = array()) {
        if (empty($this->header)) {
            $this->header = $this->defaultHeaders;
        }
        $this->header = array_merge($this->header, $headers);
        return $this->header;
    }
}