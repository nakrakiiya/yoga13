#Ubuntu 13.04 AMD64#

Ubuntu 12.04虽然也能安装，但是触摸板识别会有误（这个问题升级到13.04使用的3.9内核结果也是一样）。

##基本系统安装##

启动方式选择uefi。安装Ubuntu 13.04，清空整个硬盘，不要使用lvm。安装过程中启用网络（使用内核能直接识别的外置wifi网卡，直到内置网卡能用为止）。

##使用新内核##
更新内核到起码3.9，使用这个项目：
 * https://github.com/GM-Script-Writer-62850/Ubuntu-Mainline-Kernel-Updater

##网卡、蓝牙##

1. 安装unrar，也许还需要安装能够编译内核驱动的东西。
1. 解压缩内置wifi网卡驱动 **RTL8723AS-VAU+linux+driver.zip** 。据说其中一个是蓝牙驱动（蓝牙安装后其实要后面启用亮度调整以后才能使用（准确说，是才有界面出来），但不知道怎么用）。据说这两个驱动可能会集成到3.10内核里面。
1. 解压缩后，先去掉路径中的空格。
1. 修改文件 **rtl8723A_WiFi_linux_v4.1.3_6044.20121224/include/osdep_service.h** ，将其中带有“ **daemonize** ”字样的那一行注释掉。
1. 编译 **rtl8723A_WiFi_linux_v4.1.3_6044.20121224** 并安装。 
```sh
make
sudo make install
```

1. 编译安装另一个压缩包（rar）。
```sh
sudo make                 # 这样子就可以了
```

##亮度调节##

1. 找到 **/etc/default/grub** 文件里的这一行： ```GRUB_CMDLINE_LINUX=""``` 。将其修改为：
```ini
GRUB_CMDLINE_LINUX="acpi_backlight=vendor"
```

1. 更新grub。
```
sudo update-grub
```

1. 将下面一行添加到 **/etc/modprobe.d/blacklist.conf** 里面。（据说，是因为有两个不同的屏幕亮度控制设备，所以调节的是别的设备的亮度。所以要将另一个控制设备（也许控制的是什么DVI Output一类的东西）拉黑名单（这可能导致某些设备不能用））
```
blacklist ideapad_laptop
```

1. 重启电脑。

手动调节亮度，可以用：
```sh
echo 2000 | sudo tee /sys/class/backlight/intel_backlight/brightness
```

##Intel HD Graphics 4000##

据说这个集成显卡的驱动程序已经在内核里面了。不过，Intel网站提供了对应的更新（不更新也看不出有什么不同呀！）。

1. 到[这里](https://01.org/linuxgraphics/downloads)下载 **Intel(R) Linux* Graphics Installer** 并安装。
1. 执行对应的安装程序。
```
/usr/bin/intel-linux-graphics-installer
```

1. 重启电脑。

##一些杂七杂八的软件包##

```
kubuntu-full
kubuntu-restricted-* ubuntu-restricted-*
gnome
libgtk-3-dev ia32-libs git-all mono-devel mono-complete bison flex build-essential autotools-dev libffi-dev libevent-dev
```

开机画面：```plymouth-theme-*```

##参考链接##
* http://askubuntu.com/questions/286516/how-do-i-get-the-brightness-control-working-on-a-lenovo-yoga-13
* http://ubuntuforums.org/showthread.php?t=1911972&page=11
* http://forum.ubuntu.org.cn/viewtopic.php?f=126&t=398644

