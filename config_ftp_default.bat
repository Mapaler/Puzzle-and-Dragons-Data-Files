@echo off
:: ====================================================================
::  配置模板 - 请根据本机实际情况修改以下变量
::  复制为 config_ftp.bat 后生效，config_ftp.bat 会被 .gitignore 忽略
:: ====================================================================

:: 模拟器的 IP 地址（桥接模式下的局域网 IP）
:: 建议在模拟器内设置静态 IP，或使用路由器 DHCP 保留，确保 IP 固定
set DEVICE_IP=127.0.0.1

:: MiXplorer FTP 服务端口
set FTP_PORT=2121

:: FTP 登录用户名和密码（如果不需要验证，留空即可）
set FTP_USER=
set FTP_PASS=

:: 本地项目根目录（"." 表示脚本所在目录）
set LOCAL_BASE=.

:: WinSCP 可执行文件路径（若已在 PATH 中则直接写 winscp.com）
set WINSCP_PATH=winscp.com
:: 如果未在 PATH，可指定完整路径，例如：
:: set WINSCP_PATH=C:\Program Files (x86)\WinSCP\winscp.com