#Windows 8#

##在Windows 8还没被干掉之前##

1. 备份驱动程序（其实不备份也没什么问题）。
2. 控制面板->恢复->创建回复驱动器。点开后，勾选“将恢复分区从电脑复制到恢复驱动器”，准备一张>16G的U盘，然后点“下一步”。这张U盘相当于“Windows 8系统恢复盘”。

##安装Windows 8##

1. 在安装之前，请使用ubuntu 13.04 live cd创建GPT分区表。（预装的Windows 8使用GPT分区表）
2. 使用前边制作的“Windows 8系统恢复盘”来重装系统（实测可用，但是具体步骤不详，我也不知道是怎么把他折腾出来的）。
3. 恢复后放东西的仍旧是两个分区，但是一般C:, D:是连在一起的，删掉D:，C:就可以被扩展了。

