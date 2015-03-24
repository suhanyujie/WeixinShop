<?php
/**
* 
*/
include_once('DB.php');
$appid=strval($row['appid']);
$secret=strval($row['appsecret']);
$partnerkey=strval($row['partnerkey']);
$signkey=strval($row['signkey']);
$partner=strval($row['partnerid']);
define(APPID , $appid);  //appid
define(APPKEY ,$signkey); //paysign key
define(SIGNTYPE, "sha1"); //method
define(PARTNERKEY,$partnerkey);//通加密串
define(APPSERCERT, $secret);
define(PARTNERID, $partner);
?>