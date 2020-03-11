# 智龙迷城日服 Data 数据 / The Data of Puzzle & Dragons Japanese Version

## 项目介绍
安卓版智龙迷城`/data/data/jp.gungho.pad/files/mon2`下的数据。(缺少一些第三方合作活动的历史文件。)  
以及英文版和韩文版的cards数据。

## 最快速的数据提取方法
经测试，可运行日版智龙迷城的安卓模拟器，有如下软件。  
Tested Android simulator which can run the P&D Japanese version, there are the following software.

| 名称<br>Name | 软件版本<br>Software Version | 安卓版本<br>Android Version | 游戏版本<br>Game Version |
| --- | --- | --- | --- |
|[夜神模拟器](https://www.yeshen.com/)<br>[NoxPlayer](https://www.bignox.com/)| 6.6.0.5 | 5.1.1 | 18.2.1 |
|[逍遥安卓](http://www.xyaz.cn/)<br>[MEmu Play](https://www.memuplay.com)| 7.1.3 | 5.1.1 | 18.2.1 |

以夜神模拟器为例  
Take the Nox as example.
1. 更新游戏数据
	1. 安装夜神模拟器，并在夜神多开器（文件名`MultiPlayerManager.exe`）内添加安卓5.1.1系统。
	1. 打开系统后，安装谷歌三件套，然后在设置内关闭模拟器的root。
	1. 在模拟器里安装[智龙迷城](https://play.google.com/store/apps/details?id=jp.gungho.pad)。
	1. 运行智龙迷城，并下载最新游戏数据。
	1. 关闭模拟器。
1. 安装虚拟磁盘挂载工具
	1. 安装[VMware Virtual Disk Development Kit 5.1](https://my.vmware.com/group/vmware/details?downloadGroup=VSP510-VDDK-514&productId=285)（文件名：`VMware-vix-disklib-5.1.4-2248791.i386.exe`），需要使用其中的`vmware-mount.exe`来挂载虚拟磁盘。5.1以后的版本都没有了这个程序。  
	其他下载镜像：https://olympic.instructure.com/courses/1408048/files/76249050
		* 也可以安装 VMware workstation 后手动挂载。
		* 还可以手动使用免费的[OSFMount](https://www.osforensics.com/tools/mount-disk-images.html)进行挂载。
	1. 安装[Ext2Fsd](http://www.ext2fsd.com/)，用于在Windows下读取EXT4文件格式磁盘，不然挂载的分区无法显示内容。
	1. 下载[FastCopy](https://github.com/Mapaler/FastCopy-M)，用于快速复制文件，以及解决Windows复制一些文件会出现`0x800700FE`错误的问题。
1. 正式挂载与复制数据
	1. 根据自身情况，修改`variables.txt`内的程序路径。
	1. 运行`mount driver.bat`，自动挂载虚拟磁盘。
	1. 运行`copy files.bat`，将数据复制到当前目录。
	1. 运行`delete driver.bat`，卸载虚拟磁盘。
	1. 提交更新的数据。
### 备用提取方法
1. 可 root 手机使用 Magis Hide 直接进入游戏更新数据，使用 [**MiXplorer**](https://mixplorer.com/) 文件管理器，编辑 FTP 服务器，修改默认路径为`/data/data/`，并开启服务器。电脑上使用 **Beyond Compare** 文件夹同步功能，从 FTP 同步数据到电脑文件夹。（记得修改自定义选项为有差异的就从手机覆盖本地）
1. 可 root 手机模拟器在没有 root 的情况下进入游戏更新数据，启用 root 后使用 **ES文件管理器** 复制数据到电脑共享文件夹。
1. 夜神(Nox)安卓模拟器在没有 root 的情况下进入游戏更新数据，启用 root 后使用 **FolderSync** 同步数据到共享数据文件夹。
1. **DiskGenius(PartitionGuru)专业版** 读取夜神安卓模拟器虚拟磁盘文件(vmdk)并提取。