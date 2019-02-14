# 智龙迷城日服 Data 数据 / The Data of Puzzle & Dragons Japanese Version

## 项目介绍
安卓版智龙迷城`/data/data/jp.gungho.pad/files/mon2`下的数据。缺少一些第三方合作活动的历史文件。

## 数据提取方法
测试了很多安卓模拟器，目前能够运行日版智龙迷城的，只有[夜神(Nox)安卓模拟器](https://www.bignox.com/)的Android5.1.1。
1. 更新游戏数据
	1. 安装夜神模拟器，并在夜神多开器`MultiPlayerManager.exe`内添加安卓5.1.1系统。
	1. 打开系统后，安装谷歌三件套，然后在设置内关闭模拟器的root。
	1. 在模拟器里安装[智龙迷城](https://play.google.com/store/apps/details?id=jp.gungho.pad)。
	1. 运行智龙迷城，并下载最新游戏数据。
	1. 关闭模拟器。
1. 安装虚拟磁盘挂载工具
	1. 安装[VMware Virtual Disk Development Kit 5.1](https://code.vmware.com/web/sdk/5.1/vddk)，需要使用其中的`vmware-mount.exe`来挂载虚拟磁盘。5.1以后的版本都没有了这个程序，我也没找到其他挂载方法，所以只能用5.1。
	1. 安装[Ext2Fsd](http://www.ext2fsd.com/)，用于在Windows下读取EXT4文件格式磁盘。
	1. 下载[FastCopy](https://github.com/Mapaler/FastCopy-M)，用于快速复制文件，以及解决Windows复制一些文件会出现`0x800700FE`错误的问题。
1. 正式挂载与复制数据
	1. 根据自身情况，修改`variables.txt`内的程序路径。
	1. 运行`mount driver.bat`，挂载虚拟磁盘。
	1. 运行`copy files.bat`，将数据复制到当前目录。
	1. 运行`delete driver.bat`，卸载虚拟磁盘。
	1. 提交更新的数据。
### 备用提取方法
1. 可root手机模拟器在没有root的情况下进入游戏更新数据，启用root后使用ES文件管理器复制数据到电脑共享文件夹。
1. 夜神(Nox)安卓模拟器在没有root的情况下进入游戏更新数据，启用root后使用FolderSync同步数据到共享数据文件夹。
1. DiskGenius(PartitionGuru)**专业版**读取夜神安卓模拟器虚拟磁盘文件(vmdk)并提取。