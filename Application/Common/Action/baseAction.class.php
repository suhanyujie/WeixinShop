<?php
/**
 * 控制器基类
 *
 * @author andery
 */
namespace Common\Action;
use Think\Action;

class baseAction extends Action {
    protected function _initialize() {
        //消除所有的magic_quotes_gpc转义
        \Common\ORG\Input::noGPC();
        //初始化网站配置
        if (false === $setting = F('setting')) {
            $setting = D('setting')->setting_cache();
        }
        C($setting);
        //发送邮件
        $this->assign('async_sendmail', session('async_sendmail'));
    }

    public function _empty() {
        $this->_404();
    }

    public function ueditor() {
        $data = new \Org\Util\Ueditor();
        echo $data->output();
    }

    protected function _404($url = '') {
        if ($url) {
            redirect($url);
        } else {
            send_http_status(404);
            $this->display('Public/404');
            exit;
        }
    }
    protected function _productNotExist($url = '') {
        if ($url) {
            redirect($url);
        } else {
            send_http_status(404);
            $this->display('Public/productNotExist');
            exit;
        }
    }

    protected function getActionName() {
        return CONTROLLER_NAME;
    }

    /**
     * 添加邮件到队列
     */
    protected function _mail_queue($to, $subject, $body, $priority = 1) {
        $to_emails = is_array($to) ? $to : array($to);
        $mails = array();
        $time = time();
        foreach ($to_emails as $_email) {
            $mails[] = array(
                'mail_to' => $_email,
                'mail_subject' => $subject,
                'mail_body' => $body,
                'priority' => $priority,
                'add_time' => $time,
                'lock_expiry' => $time,
            );
        }
        M('mail_queue')->addAll($mails);

        //异步发送邮件
        $this->send_mail(false);
    }

    /**
     * 发送邮件
     */
    public function send_mail($is_sync = true) {
        if (!$is_sync) {
            //异步
            session('async_sendmail', true);
            return true;
        } else {
            //同步
            session('async_sendmail', null);
            return D('mail_queue')->send();
        }
    }

    /**
     * 上传文件默认规则定义
     */
    protected function _upload_init($upload) {
        $allow_max = C('pin_attr_allow_size'); //读取配置
        $allow_exts = explode(',', C('pin_attr_allow_exts')); //读取配置
        $allow_max && $upload->maxSize = $allow_max * 1024; //文件大小限制
        $allow_exts && $upload->allowExts = $allow_exts; //文件类型限制
        $upload->saveRule = 'uniqid';
        return $upload;
    }

    /**
     * 上传文件
     */
    protected function _upload($file, $dir = '', $thumb = array(), $save_rule = 'uniqid') {
        $upload = new \Common\ORG\UploadFile();
        if ($dir) {
            $upload_path = C('pin_attach_path') . $dir . '/';
            $upload->savePath = $upload_path;
        }
        if (!is_dir($upload->savePath)) {
            // 尝试创建目录
            $c = 0;
            while (!mkdir($upload->savePath, 0777, true) && $c < 10) {
                $c++;
            }
            if (!is_dir($upload->savePath)) {
                return array('error' => 1, 'info' => '上传目录' . $upload->savePath . '不存在');
            }
        }
        if ($thumb) {
            $upload->thumb = true;
            $upload->thumbMaxWidth = $thumb['width'];
            $upload->thumbMaxHeight = $thumb['height'];
            $upload->thumbPrefix = '';
            $upload->thumbSuffix = isset($thumb['suffix']) ? $thumb['suffix'] : '_thumb';
            $upload->thumbExt = isset($thumb['ext']) ? $thumb['ext'] : '';
            $upload->thumbRemoveOrigin = isset($thumb['remove_origin']) ? true : false;
        }
        //自定义上传规则
        $upload = $this->_upload_init($upload);
        if ($save_rule != 'uniqid') {
            $upload->saveRule = $save_rule;
        }

        if ($result = $upload->uploadOne($file)) {
            return array('error' => 0, 'info' => $result);
        } else {
            return array('error' => 1, 'info' => $upload->getErrorMsg());
        }
    }

    protected function _uploadRemote($remote, $dir, $thumb) {
        $content = \Common\ORG\Http::fsockopenDownload($remote);
        $savePath = PIN_DATA_ROOT . C('pin_attach_path') . $dir;
        // 检查上传目录
        if (!is_dir($savePath)) {
            // 尝试创建目录
            $c = 0;
            while (!mkdir($savePath, 0777, true) && $c < 10) {
                $c++;
            }
            if (!is_dir($savePath)) {
                return array('error' => '上传目录' . $savePath . '不存在');
            }
        } else {
            if (!is_writeable($savePath)) {
                return array('error' => '上传目录' . $savePath . '不可写');
            }
        }
        if (empty($content)) {
            return array('error' => '无法下载远程文件');
        }
        $fname = uniqid();
        $tf = rtrim(sys_get_temp_dir(), '/') . '/' . $fname;
        file_put_contents($tf, $content);
        switch (exif_imagetype($tf)) {
            case IMAGETYPE_GIF:
                rename($tf, $savePath . $fname . '.gif');
                $fname .= '.gif';
                $fext = '.gif';
                break;
            case IMAGETYPE_JPEG:
                rename($tf, $savePath . $fname . '.jpg');
                $fname .= '.jpg';
                $fext = '.jpg';
                break;
            case IMAGETYPE_PNG:
                rename($tf, $savePath . $fname . '.png');
                $fname .= '.png';
                $fext = '.png';
                break;
            case IMAGETYPE_BMP:
                rename($tf, $savePath . $fname . '.bmp');
                $fname .= '.bmp';
                $fext = '.bmp';
                break;
            default:
                rename($tf, $savePath . $fname);
                $fext = '';
                break;
        }
        $filename = $savePath . $fname;
        import('ORG.Util.Image');
        $thumbWidth = explode(',', $thumb['width']);
        $thumbHeight = explode(',', $thumb['height']);
        $thumbPrefix = explode(',', '');
        $thumbSuffix = explode(',', $thumb['suffix']);
        $thumbPath = $savePath;
        $thumbExt = $fext; //自定义缩略图扩展名
        for ($i = 0, $len = count($thumbWidth);
            $i < $len;
            $i++) {
            $prefix = isset($thumbPrefix[$i]) ? $thumbPrefix[$i] : $thumbPrefix[0];
            $suffix = isset($thumbSuffix[$i]) ? $thumbSuffix[$i] : $thumbSuffix[0];
            $thumbname = $prefix . basename($filename, $fext) . $suffix;
            \Common\ORG\Image::thumb($filename, $thumbPath . $thumbname . $thumbExt, '', $thumbWidth[$i], $thumbHeight[$i], true);
        }
        return array('savename' => $fname);
    }

    /**
     * AJAX返回数据标准
     *
     * @param int $status
     * @param string $msg
     * @param mixed $data
     * @param string $dialog
     */
    protected function ajaxReturn($status = 1, $msg = '', $data = '', $dialog = '') {
        if (is_array($status)) {
            parent::ajaxReturn($status);
            return;
        }
        parent::ajaxReturn(array(
            'status' => $status,
            'info' => $msg,
            'data' => $data,
            'dialog' => $dialog,
        ));
    }
}