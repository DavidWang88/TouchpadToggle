# TouchpadToggle

[![License](https://img.shields.io/badge/license-GPL--3.0-green.svg)](https://github.com/DavidWang88/TouchpadToggle/blob/master/LICENSE) 
[![GitHub All Releases](https://img.shields.io/github/downloads/atom/atom/total.svg)](https://github.com/DavidWang88/TouchpadToggle)
 [![Supporting](https://img.shields.io/badge/Thinkpad-T470s%2FT570%2FX1--Carbon-green.svg)](https://github.com/DavidWang88/TouchpadToggle)

—— Touchpad Toggle utility for Thinkpad(T470s/T570/X1 Carbon etc.)

Thinkpad 触摸板开关小工具，特别针对 T470s/T570/X1 Carbon 等型号。

## 为什么会有这个小工具？

Thinkpad 的某些型号的笔记本（如 [T470s](https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-t-series/ThinkPad-T470s/p/22TP2TT470S)、[T570](https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-t-series/ThinkPad-T570/p/22TP2TT5700)、[X1 Carbon](https://www.lenovo.com/us/en/laptops/thinkpad/thinkpad-x/ThinkPad-X1-Carbon-5th-Gen/p/22TP2TXX15G) 等）的触摸板无便捷的开关，无法通过常规Fn组合快捷键来实现启用/禁用触摸板。

虽然 Synaptics 触摸板在 Win10 控制面板里有相应的设置选项（见下图），`触摸板->开/关` 选项，但毕竟操作不便。另外，其还提供有 `连接鼠标时让触摸板保持打开状态` 选项，若该选项取消勾选，当连接了有线鼠标后，会自动禁用掉触摸板，当断开有线鼠标后，会自动启用触摸板，但对于无线鼠标来说，只要插入有效的外部适配器（不管无线鼠标是否已经配对正常工作），系统就会认为已连接外部鼠标，在使用上也有些不便。

![Windows 控制面板中的“触摸板”设置界面](https://github.com/DavidWang88/TouchpadToggle/raw/master/ScreenCapture/TouchpadSettingInControlPanel.png)

就我个人需求来说，工作时用无线鼠标多一点（且无线适配器几乎一直在 USB 口插着），如果打字时开启了触摸板，则手腕很容易触碰到触摸板而引起光标漂移。休闲时可能会用笔记本触摸板更多一些，鼠标基本不用。如果想要方便地启用/禁用触摸板，在现有的情况下不好实现。

## 为什么选用 AutoHotKey 脚本来实现？

先说一下 Synaptics 触摸板的开发接口现状，Synaptics 算是做触摸板的老牌厂商了，除了早期有 1.0 版的 SDK 文档在个别网站尚有流传之外，官网目前已经找不到开发文档了。所幸在 [个别地方](https://autohotkey.com/board/topic/65849-controlling-synaptics-touchpad-using-com-api/) 可以找到当年关于如何通过编程控制触摸板的讨论。

遗憾的是，如果按照以上地址贴出的脚本对其控制并没有效果，一番摸索尝试后，最终还是找到了解决方案，只需对核心控制源码稍加改动即可。

选用 AutoHotKey 一方面是因为我对其很熟悉，另外这个功能本身就很简单，核心代码没几行就可以实现了，使用 VB、C# 等太麻烦了。

## 如何设置和使用这个小工具？

1. 确保系统安装有 [Lenovo Vantage](https://vantage.lenovo.com/) 这款软件。

2. 到 [这里](https://github.com/DavidWang88/TouchpadToggle/releases) 下载 `TouchpadToggle_VX.X.zip` 文件并解压（无需安装）。 

3. 打开 Lenovo Vantage，转到 `硬件设置` -> `输入`，见下图：

![Fn按键设置](https://github.com/DavidWang88/TouchpadToggle/raw/master/ScreenCapture/FnKeySetting.jpg) 

转到 `键盘` -> `用户自定义键` 设置，见下图：

![用户自定义键设置](https://github.com/DavidWang88/TouchpadToggle/raw/master/ScreenCapture/F12Setting.jpg)

右侧选择 `打开应用程序或文件` -> `添加文件`，浏览到前面已解压目录下的 `TouchpadToggle.exe`，确定即可。

4. 以后只需按下 `Fn+F12` 组合键即可调用 TouchpadToggle 进行触摸板开关自动切换了，同时会显示切换到的状态（小工具会在执行切换完成后自动退出，绿色又环保 ^_^）。

![切换指示](https://github.com/DavidWang88/TouchpadToggle/raw/master/ScreenCapture/OnScreenDisplay.jpg)

## 已知问题

1. 系统锁定后重新登录，小工具之前禁用的触摸板会自己恢复启用状态，目前暂无解决办法。