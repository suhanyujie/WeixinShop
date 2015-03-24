<?php
//header("content-type:text/html;charset=utf-8");
$arr  = require ("../../Application/Common/Conf/db.php");
$conn = mysql_connect($arr['DB_HOST'], $arr['DB_USER'], $arr['DB_PWD']) or die("连接数据库失败!");
mysql_select_db($arr['DB_NAME'], $conn);
mysql_query("set names utf8");

$sql    = "select * from " . $arr['DB_PREFIX'] . "pay WHERE ( `pay_type` = 'wxpay' )";
$result = mysql_query($sql, $conn);
$row2   = mysql_fetch_array($result);
$row    = unserialize($row2['config']);
?>