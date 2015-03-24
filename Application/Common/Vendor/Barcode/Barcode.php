<?php
namespace Common\Vendor\Barcode;
class Barcode {
    private $cookieUrl    = '';
    private $barcodeUrl   = '';
    private $version      = '3.2.2';
    private $vendor       = 'chrome';
    private $source       = 'package';
    private $wccuid       = '';
    private $header       = null;
    private $cookieFile   = 'cookie.txt';
    private $registerLock = 'reg.lock';
    private $_cookies     = array();

    private $defaultHeaders = array(
        'Host'            => 'e.wochacha.com',
        'Connection'      => 'keep-alive',
        'Content-Length'  => '50',
        'Accept'          => '*/*',
        'Origin'          => 'chrome-extension://amlaplgcogpagfjennioicnpjnljajkc',
        'User-Agent'      => 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.102 Safari/537.36',
        'Content-Type'    => 'application/x-www-form-urlencoded; charset=UTF-8',
        'Accept-Encoding' => 'gzip,deflate',
        'Accept-Language' => 'en,en-US;q=0.8',
    );

    public function _init() {
        $this->cookieFile = dirname(__FILE__) . DIRECTORY_SEPARATOR . $this->cookieFile;
        $regLock          = dirname(__FILE__) . DIRECTORY_SEPARATOR . $this->registerLock;
        if (file_exists($regLock)) {
            $wccuid                   = file_get_contents($regLock);
            $this->_cookies['wccuid'] = $wccuid;
        }
        $this->initCookieUrl();
        $this->syncCookies();
        if (!file_exists($regLock)) {
            $this->register();
        }
    }

    public function getProductByBarcode($barcode) {
        $url     = $this->getBarcodeUrl($barcode);
        $headers = $this->setHeaders();
        $result  = $this->request($url, array(), false, array(), $headers);

        $result  = explode("\r\n\r\n", $result);
        $result  = json_decode($result[1]);
        $title   = '';
        $content = '';
        $price   = '';
        $image   = '';
        foreach ($result->online as $key => $rowObject) {
            $detailUrl = $rowObject->url;
            if (empty($detailUrl)) {
                continue;
            }
            $urlinfo = parse_url($detailUrl);
            parse_str($urlinfo['query'], $queryInfo);
            $_url          = urldecode($queryInfo['url']);
            $detailContent = $this->request($_url, array(), false, array(), $headers);
            switch ($rowObject->sname) {
                case '1号商城':
                case '1号店':
                    preg_match('/id=\"productMainName\"[^>]*>([\s\S]+)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = $titleMatch[1];
                    //取描述
                    preg_match('/pmId:(\d+)/i', $detailContent, $pmId);
                    $pmId = $pmId[1];
                    preg_match('/productId:(\d+)/i', $detailContent, $productId);
                    $productId = $productId[1];
                    preg_match('/merchantId:(\d+)/i', $detailContent, $merchantId);
                    $merchantId = $merchantId[1];
                    preg_match('/isYiHaoDian:(\d+)/i', $detailContent, $isYiHaoDian);
                    $isYiHaoDian = $isYiHaoDian[1];
                    preg_match('/paramSignature:\"([^\"]+)\"/i', $detailContent, $paramSignature);
                    $paramSignature     = urlencode($paramSignature[1]);
                    $_descUrl           = "http://item-home.yhd.com/item/ajax/ajaxProdDescTabView.do?callback=detailProdDesc.prodDescCallback&productID={$productId}&merchantID={$merchantId}&isYihaodian={$isYiHaoDian}&uid={$paramSignature}&pmId={$pmId}";
                    $headers['Referer'] = $detailUrl;
                    $desc               = $this->request($_descUrl, array(), false, array(), $headers);
                    $desc               = explode("\r\n\r\n", $desc);
                    $desc               = $desc[1];
                    $desc               = substr($desc, strpos($desc, '(') + 1);
                    $desc               = rtrim($desc, ';');
                    $desc               = rtrim($desc, ')');
                    // var_dump($desc);
                    $descObj = json_decode($desc);
                    // var_dump($desc);
                    preg_match('/class=\"desbox[^>]+>([\s\S]+)<\/div>\s*<div\s+id=\"rightProdDescNavDiv\"/iU', $descObj->value, $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    // var_dump($content);
                    $content = str_replace('original="', 'src="', $content);
                    $break   = true;
                    break;
                case '京东商城':
                    var_dump($detailContent);
                    var_dump($detailUrl);
                    preg_match('/id=\"name\">\s*<h1>([\s\S]+)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = $titleMatch[1];
                    preg_match('/class=\"detail-content\"[^>]*>([\s\S]+?)<\/div>\s*<\/div>/iU', $detailContent, $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    $break   = true;
                    break;
                case '易迅网':
                    preg_match('/<h1\s+class=\"xname\"\s+itemprop=\"name\">([\s\S]+?)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = $titleMatch[1];
                    preg_match('/<div\s+id=\"detail_info\">([\s\S]+?)<\/div>\s*<\/div>\s*<div\s+class\=\"x_mod_tab_con/iU', $detailContent, $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    $break   = true;
                    break;
                case '新蛋':
                    preg_match('/class=\"goods_title\"\s+id=\"productTitle\">\s*<h1>([\s\S]+?)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = $titleMatch[1];
                    preg_match('/(<div\s+align=\"left\">\s*<table\s+cellspacing=\"0px\"\s+class=\"wm_psTable\"\s+id=\"table\"[\s\S]+)<\/div>\s*<\/div>\s*<div\s+class=\"reviews_history/iU', $detailContent, $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    $break   = true;
                    break;
                case '我买网':
                    $detailContent = mb_convert_encoding($detailContent, 'UTF-8', 'GBK');
                    preg_match('/class=\"pro_tit_top\"[^>]*>([\s\S]+?)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = strip_tags($titleMatch[1]);
                    preg_match('/class=\"content\"[^>]*>([\s\S]+?)<\/div>\s*<\/div>\s*<div\s+class=\"deatil_tab_por_b/iU', $detailContent, $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    $break   = true;
                    break;
                case '亚马逊':
                    preg_match('/id=\"title\"[^>]*?>([\s\S]+?)<\/h1>/iU', $detailContent, $titleMatch);
                    if (!isset($titleMatch[1]) || empty($titleMatch[1])) {
                        continue;
                    }
                    $title = html_entity_decode(trim(strip_tags($titleMatch[1])));
                    preg_match('/var\s*iframeContent\s*=\s*\"([^\"]+)\"/iU', $detailContent, $contentMatchTmp);
                    preg_match('/id="productDescription"[^>]*?>([\s\S]+?)<\/div>\s*<h3\s+class=\"productDescriptionSource/iU', urldecode($contentMatchTmp[1]), $contentMatch);
                    if (!isset($contentMatch[1]) || empty($contentMatch[1])) {
                        continue;
                    }
                    $content = $contentMatch[1];
                    $content = preg_replace('/src=\"[^\"]+\"/iU', '', $content);
                    $content = preg_replace('/src=\'[^\']+\'/iU', '', $content);
                    $content = str_replace('data-original', 'src', $content);
                    $content = str_replace('style="display:none;"', '', $content);
                    $content = str_replace('height="50"', '', $content);
                    $content = str_replace('onload="this.style.display=\'\'"', '', $content);
                    $break   = true;
                    break;
                default:
                    # code...
                    break;
            }
            if ($break == true) {
                $price = $rowObject->price;
                $image = $rowObject->imageURL;
                break;
            }
        }
        return array(
            'title'   => $title,
            'content' => $content,
            'price'   => $price,
            'image'   => $image,
        );
    }

    protected function getBarcodeUrl($barcode) {
        // http://e.wochacha.com/Search/barcodeSearch?barcode=8996001303702&version=3.2.2&vendor=chrome&source=package&wccuid=32481eba-6d16-491e-b673-a7337dee26fb
        $_arr = array(
            'barcode' => $barcode,
            'version' => $this->version,
            'vendor'  => $this->vendor,
            'source'  => $this->source,
            'wccuid'  => $this->wccuid,
        );
        return 'http://e.wochacha.com/Search/barcodeSearch?' . http_build_query($_arr);

    }

    private function request($url, $data = array(), $post = false, $cookies = array(), $headers = array()) {
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
            curl_setopt($s, CURLOPT_POSTFIELDS, $data);
        } else {
            $urlGet = http_build_query($data);
            $url    = strpos($url, '?') !== false ? $url . $urlGet : $url . '?' . $urlGet;
        }
        curl_setopt($s, CURLOPT_URL, $url);
        $html    = curl_exec($s);
        $_html   = explode('\r\n\r\n', $html);
        $headers = $_html[0];
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
        return $html;
    }

    protected function initCookieUrl() {
        $this->cookieUrl = 'http://e.wochacha.com/Search/syncCookies';
    }

    public function register() {
        $url     = $this->getRegisterUrl();
        $headers = $this->setHeaders();
        $result  = $this->request($this->cookieUrl, array(), false, array(), $headers);
        preg_match('/wccuid\":\s*\"([^\"]+)\"/', $result, $wccuidMatch);
        file_put_contents(dirname(__FILE__) . DIRECTORY_SEPARATOR . $this->registerLock, $wccuidMatch[1]);
        $this->_cookies['wccuid'] = $wccuidMatch[1];
    }

    protected function syncCookies() {
        $this->initCookieUrl();
        $headers = $this->setHeaders();
        $data    = array(
            'version' => $this->version,
            'vendor'  => $this->vendor,
            'source'  => $this->source,
            'wccuid'  => $this->wccuid,
        );
        $result = $this->request($this->cookieUrl, $data, true, array(), $headers);
        preg_match('/wccuid\":\s*\"([^\"]+)\"/', $result, $wccuidMatch);
        $this->wccuid = $wccuidMatch[1];
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

    protected function getRegisterUrl() {
        //
        $_arr = array(
            'version' => $this->version,
            'vendor'  => $this->vendor,
            'source'  => $this->source,
            'wccuid'  => $this->wccuid,
            'jsonp'   => 'jQuery18107901775096543133_' . $this->getMicrotime(),
            '_'       => $this->getMicrotime()
        );
        return 'http://e.wochacha.com/Search/register?' . http_build_query($_arr);
    }

    protected function getHistoryUrl() {
        $_arr = array(
            'DirectObject'   => 1,
            'IndirectObject' => '',
            'Action'         => 'track.order',
            'version'        => $this->version,
            'vendor'         => $this->vendor,
            'source'         => $this->source,
            'wccuid'         => $this->null,
        );
        return 'http://e.wochacha.com/Search/log?' . http_build_query($_arr);
    }

    protected function getMicrotime() {
        return (str_replace('.', '', microtime(true)));
    }
}