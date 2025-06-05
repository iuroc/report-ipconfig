<?php

$filename = __DIR__ . '/ipconfig_info.txt';
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    if (file_exists($filename)) {
        header('Content-Type: text/plain; charset=gbk');
        echo file_get_contents($filename);
    } else {
        header('Content-Type: text/plain; charset=utf-8');
        http_response_code(404);
        echo "文件不存在";
    }
} elseif ($method === 'POST') {
    // 获取当前时间
    $timestamp = date('[Y-m-d H:i:s]');
    $postBody = file_get_contents('php://input');

    // 拼接内容，格式为 [日期时间] \n\n 原始内容
    $contentToWrite = $timestamp . "\n\n" . $postBody;

    $result = file_put_contents($filename, $contentToWrite);

    if ($result === false) {
        header('Content-Type: text/plain; charset=utf-8');
        http_response_code(500);
        echo "写入文件失败";
    } else {
        header('Content-Type: text/plain; charset=utf-8');
        echo "写入成功";
    }
} else {
    header('Content-Type: text/plain; charset=utf-8');
    http_response_code(405);
    echo "只支持 GET 和 POST 请求";
}
