# report-ipconfig

> 定时上报 ipconfig 信息并在线查看

## 使用方法

1. 将 `server/index.php` 文件放到 PHP 站点的根目录，为站点设置 Basic Auth 和绑定域名。
2. 修改 `client/report_ipconfig.vbs` 中的域名、用户名和密码。
3. 运行 `shell:startup` 打开目录，将 `client/report_ipconfig.vbs` 或其快捷方式添加到该目录。