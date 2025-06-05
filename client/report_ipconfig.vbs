Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")
Set env = shell.Environment("Process")
tempFile = env("TEMP") & "\temp_ipconfig.txt"

url = "http://ipconfig.example.com"
username = "username"
password = "password"

Do
    ' 保存 ipconfig 到临时文件
    shell.Run "cmd /c ipconfig > """ & tempFile & """", 0, True

    ' 使用 curl 发送请求
    command = "curl -s -X POST -H ""Content-Type: text/plain"" -u " & username & ":" & password & " --data-binary @" & Chr(34) & tempFile & Chr(34) & " " & url
    shell.Run "cmd /c " & command, 0, True

    WScript.Sleep 10000  ' 等待 10 秒（单位：毫秒）
Loop
