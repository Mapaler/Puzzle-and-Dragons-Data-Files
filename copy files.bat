@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist config_mount.bat (
    echo 未找到 config_mount.bat，请先运行 mount driver.bat 生成配置。
    pause
    exit /b 1
)

call config_mount.bat
if errorlevel 1 (
    echo 错误：无法加载 config_mount.bat。
    pause
    exit /b 1
)

:: 检查必要变量
if not exist "%FASTCOPY_PATH%" (
    echo 错误：FASTCOPY_PATH 指定的文件不存在。
    pause
    exit /b 1
)
if "%MOUNT_POINT_PATH%"=="" (
    echo 错误：MOUNT_POINT_PATH 未设置。
    pause
    exit /b 1
)

echo 正在复制文件...
title 正在复制文件
"%FASTCOPYPATH%" /cmd=diff /open_window /auto_close %MOUNT_POINT_PATH%\data\jp.gungho.pad\files\mon2 /to=.\
"%FASTCOPYPATH%" /cmd=diff /open_window /auto_close %MOUNT_POINT_PATH%\data\jp.gungho.padEN\files\mon2\cards_*.bc %MOUNT_POINT_PATH%\data\jp.gungho.padEN\files\mon2\padv*.wav /to=.\cards_EN
"%FASTCOPYPATH%" /cmd=diff /open_window /auto_close %MOUNT_POINT_PATH%\data\jp.gungho.padKO\files\mon2\cards_*.bc %MOUNT_POINT_PATH%\data\jp.gungho.padKO\files\mon2\padv*.wav /to=.\cards_KO
echo 文件复制完成
pause