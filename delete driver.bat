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
if not exist "%VMWARE_MOUNT_PATH%" (
    echo 错误：VMWARE_MOUNT_PATH 指定的文件不存在。
    pause
    exit /b 1
)
if "%MOUNT_POINT_PATH%"=="" (
    echo 错误：MOUNT_POINT_PATH 未设置。
    pause
    exit /b 1
)

echo 正在卸载虚拟分区 %MOUNT_POINT_PATH% ...
title 正在卸载虚拟分区
"%VMWARE_MOUNT_PATH%" /d %MOUNT_POINT_PATH% /f

if errorlevel 1 (
    echo 卸载失败，可能该盘符未挂载或已被占用。
    pause
    exit /b 1
)

echo 虚拟分区卸载完成。
pause