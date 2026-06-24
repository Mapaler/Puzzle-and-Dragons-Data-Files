@echo off
setlocal enabledelayedexpansion

:: ===== 强制切换到脚本所在目录 =====
cd /d "%~dp0"

:: ===== 检查配置文件是否存在，不存在则从默认模板复制 =====
if not exist config.bat (
    echo 未找到 config.bat，正在从 config_default.bat 复制...
    copy config_default.bat config.bat
    echo 请编辑 config.bat，填写设备 IP 等参数后重新运行本脚本。
    pause
    exit /b 1
)

:: ===== 加载实际配置 =====
call config.bat
if errorlevel 1 (
    echo 错误：无法加载 config.bat，请检查文件格式。
    pause
    exit /b 1
)

:: ===== 检查必要变量 =====
if "%DEVICE_IP%"=="" (
    echo 错误：DEVICE_IP 未在 config.bat 中设置。
    pause
    exit /b 1
)

:: ===== 构建 FTP 连接 URL =====
set FTP_URL=ftp://%FTP_USER%:%FTP_PASS%@%DEVICE_IP%:%FTP_PORT%/
:: 如果用户名密码为空，则去掉 @ 前面的部分
if "%FTP_USER%"=="" if "%FTP_PASS%"=="" (
    set FTP_URL=ftp://%DEVICE_IP%:%FTP_PORT%/
)

:: ===== 执行三次增量同步（方向：从远程下载到本地） =====
echo 开始同步任务1：jp.gungho.pad（全量 mon2）...
%WINSCP_PATH% /command ^
    "open %FTP_URL%" ^
    "synchronize local -filemask=""*"" ""%LOCAL_BASE%\mon2"" ""/data/data/jp.gungho.pad/files/mon2""" ^
    "exit"

echo 开始同步任务2：jp.gungho.padEN（仅 cards_*.bc 和 padv*.wav，存到 cards_EN）...
%WINSCP_PATH% /command ^
    "open %FTP_URL%" ^
    "synchronize local -filemask=""cards_*.bc;padv*.wav"" ""%LOCAL_BASE%\cards_EN"" ""/data/data/jp.gungho.padEN/files/mon2""" ^
    "exit"

echo 开始同步任务3：jp.gungho.padKO（仅 cards_*.bc 和 padv*.wav，存到 cards_KO）...
%WINSCP_PATH% /command ^
    "open %FTP_URL%" ^
    "synchronize local -filemask=""cards_*.bc;padv*.wav"" ""%LOCAL_BASE%\cards_KO"" ""/data/data/jp.gungho.padKO/files/mon2""" ^
    "exit"

echo 所有同步任务完成！
pause