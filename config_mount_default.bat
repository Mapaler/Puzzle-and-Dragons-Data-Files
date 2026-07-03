@echo off
:: ====================================================================
::  挂载/卸载/复制 配置模板 - 请根据本机实际情况修改以下变量
::  复制为 config_mount.bat 后生效，config_mount.bat 会被 .gitignore 忽略
:: ====================================================================

:: FastCopy 可执行文件路径（若已在 PATH 中则直接写 FastCopy.exe）
set FASTCOPY_PATH=FastCopy.exe
:: 如果未在 PATH，可指定完整路径，例如：
:: set WINSCP_PATH=C:\Users\Mapaler\FastCopy\FastCopy.exe

:: Windows 下挂载点位置，比如挂载到 P 分区就写 P:
set MOUNT_POINT_PATH=P:

:: vmware-mount.exe 可执行文件路径（若已在 PATH 中则直接写 vmware-mount.exe）
set VMWARE_MOUNT_PATH=vmware-mount.exe
:: 如果未在 PATH，可指定完整路径，例如：
:: set WINSCP_PATH=C:\Program Files (x86)\VMware\VMware Virtual Disk Development Kit\bin\vmware-mount.exe

:: 使用 vmdk 格式虚拟磁盘模拟器的磁盘路径
set VMDK_PATH=disk2.vmdk

:: 该 vmdk 内需要挂载的分区序号，不同模拟器不一样
set VMDK_PARTITION_INDEX=2