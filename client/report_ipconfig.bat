@echo off
setlocal enabledelayedexpansion

:: 设置目标 URL
set URL=http://ipconfig.example.com

:: 设置临时文件路径
set TEMP_FILE=%TEMP%\temp_ipconfig.txt

:loop
:: 获取 ipconfig 输出并保存到临时文件
ipconfig > "!TEMP_FILE!"

:: 执行 curl 请求，并显示服务器响应内容
curl -s -X POST -H "Content-Type: text/plain" -u username:password --data-binary @"!TEMP_FILE!" %URL%

:: 添加换行
echo.

:: 等待 10 秒
timeout /t 10 /nobreak >nul

goto loop
