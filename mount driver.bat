@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist config_mount.bat (
    echo 未找到 config_mount.bat，正在从 config_mount_default.bat 复制...
    copy config_mount_default.bat config_mount.bat
    echo 请编辑 config_mount.bat，填写必要参数后重新运行本脚本。
    pause
    exit /b 1
)

call config_mount.bat
if errorlevel 1 (
    echo 错误：无法加载 config_mount.bat，请检查文件格式。
    pause
    exit /b 1
)

:: 检查必要变量
if not exist "%VMWARE_MOUNT_PATH%" (
    echo 错误：VMWARE_MOUNT_PATH 指定的文件不存在，请检查路径。
    pause
    exit /b 1
)
if "%VMDK_PATH%"=="" (
    echo 错误：VMDK_PATH 未设置。
    pause
    exit /b 1
)
if "%VMDK_PARTITION_INDEX%"=="" (
    echo 错误：VMDK_PARTITION_INDEX 未设置。
    pause
    exit /b 1
)
if "%MOUNT_POINT_PATH%"=="" (
    echo 错误：MOUNT_POINT_PATH 未设置。
    pause
    exit /b 1
)

echo 正在挂载虚拟分区（分区号 %VMDK_PARTITION_INDEX% 到盘符 %MOUNT_POINT_PATH%）...
title 正在挂载虚拟分区
"%VMWARE_MOUNT_PATH%" %MOUNT_POINT_PATH% "%VMDK_PATH%" /v:%VMDK_PARTITION_INDEX%

if errorlevel 1 (
    echo 挂载失败，请检查参数或权限（可能需要管理员权限）。
    pause
    exit /b 1
)

echo 虚拟分区挂载完成。
pause