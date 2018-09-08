#NoTrayIcon
#NoEnv
#SingleInstance off

SAPI := ComObjCreate("SynCtrl.SynAPICtrl.1")
SDev := ComObjCreate("SynCtrl.SynDeviceCtrl.3")

SAPI.Initialize()
SAPI.Activate()

/*
first parameter is ConnectionType, 0 = Any Connection
second parameter is DeviceType, 2 = TouchPad Device
third parameter is QueryHandle, - 1 = automatically select the first device that meet criteria
*/
DeviceHandle := SAPI.FindDevice(0,2,-1)

SDev.Select(DeviceHandle)
SDev.Activate()

; 268435825 stands for "enable/disable" option
; 1: disable;0: enable
DisableFlag := SDev.GetLongProperty(268435825)

if(DisableFlag = 1)
{
	;enable it
	SDev.SetLongProperty(268435825, 0)
	OnScreenDisplay(0, 1500)
}
else
{
	;disable it
	SDev.SetLongProperty(268435825, 1)
	OnScreenDisplay(1, 1500)
}
	
ObjRelease(SAPI)
ObjRelease(SDev)

ExitApp


; Display Image Which Stands for Touchpad Disabled Status on screen.
OnScreenDisplay(DisableStatus, time=1500)
{
	image_name := ""
	if (DisableStatus = 1)
	{
		image_name = %A_ScriptDir%\touchpad-disable.png
	}
	else
	{
		image_name = %A_ScriptDir%\touchpad-enable.png
	}
	
	ypos := A_ScreenHeight * 0.8
	; Create a borderless SplashImage window
	SplashImage, %image_name%, b y%ypos%,,,WinTitle_touchpad_toggle
	; Make the window a little bit transparent.
	;Winset, TransColor, White 250, WinTitle_touchpad_toggle 
	Sleep, %time%
	SplashImage, Off
	return
}