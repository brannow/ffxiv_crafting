#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Benjamin - Plany

 Script Function:
	Final Fantasy XIV - A Realm Reborn [Crafting Bot]

#ce ----------------------------------------------------------------------------

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=C:\Users\Plany\Desktop\craftbot\mainForm.kxf
$Form1_1 = GUICreate("#REPLACEME#", 296, 412, 198, 172)
$Button1 = GUICtrlCreateButton("Start", 56, 360, 75, 25)
$Input1 = GUICtrlCreateInput("", 88, 8, 169, 21)
$Label1 = GUICtrlCreateLabel("Amount", 48, 8, 40, 17)
$Button2 = GUICtrlCreateButton("Stop", 168, 360, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label2 = GUICtrlCreateLabel("To Abort press: insert (einfg)", 80, 392, 136, 17)
$Label3 = GUICtrlCreateLabel("0", 96, 32, 10, 17)
$Label4 = GUICtrlCreateLabel("Left:", 56, 32, 25, 17)
$Group1 = GUICtrlCreateGroup("instructions", 8, 56, 281, 297)
$Input2 = GUICtrlCreateInput("2800", 183, 80, 41, 21)
$Button3 = GUICtrlCreateButton("+", 256, 80, 27, 25)
$Button4 = GUICtrlCreateButton("remove Selected", 120, 320, 91, 25)
$Button5 = GUICtrlCreateButton("remove All", 208, 320, 75, 25)
$Input3 = GUICtrlCreateInput("", 66, 80, 41, 21)
$Label5 = GUICtrlCreateLabel("Press Key", 16, 82, 51, 17)
$Label6 = GUICtrlCreateLabel("and then wait", 113, 82, 68, 17)
$ListView1 = GUICtrlCreateListView("Key|Duration", 16, 104, 266, 214)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 80)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 150)
$Button6 = GUICtrlCreateButton("up", 16, 320, 35, 25)
$Button7 = GUICtrlCreateButton("down", 48, 320, 35, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label7 = GUICtrlCreateLabel("ms", 225, 83, 17, 15)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

#include "listManager.au3"

generateName()

func generateName()
   
   Local $__pre, $__post

   For $i = 1 To 5 
	  $__post &= Chr(Random(97, 122, 1))
	  $__pre &= Chr(Random(97, 122, 1))
   next

   WinSetTitle("#REPLACEME#", "", $__pre&"[Seizou]"&$__post)
endFunc

func getDuration()
	return GUICtrlRead($Input1)
endFunc

func getAddListKey()
	return GUICtrlRead($Input3)
endFunc

func getAddListDuration()
	return GUICtrlRead($Input2)
endFunc

func setAddListKey($data)
	return GUICtrlSetData($Input3, $data)
endFunc

func setAddListDuration($data)
	return GUICtrlSetData($Input2, $data)
endFunc

func setCountLeft($newDuration)
	 GUICtrlSetData($Label3, $newDuration)
endFunc

func set($newDuration)
	 GUICtrlSetData($Input1, $newDuration)
endFunc

func enableStartButton()
	_enableElement($Button1)
endFunc

func disableStartButton()
	_disableElement($Button1)
endFunc

func enableStopButton()
	_enableElement($Button2)
endFunc

func disableStopButton()
	_disableElement($Button2)
endFunc

func enableDurationInput()
	_enableElement($Input1)
endFunc

func disableDurationInput()
	_disableElement($Input1)
endFunc

func enableKeyInput()
	_enableElement($Input2)
endFunc

func disableKeyInput()
	_disableElement($Input2)
endFunc

func enableDelayInput()
	_enableElement($Input2)
endFunc

func disablDelayInput()
	_disableElement($Input2)
endFunc


func enableAddButton()
	_enableElement($Button3)
endFunc

func disableAddButton()
	_disableElement($Button3)
endFunc

func enableRemoveSelectedButton()
	_enableElement($Button4)
endFunc

func disableRemoveSelectedButton()
	_disableElement($Button4)
endFunc

func enableRemoveAllButton()
	_enableElement($Button5)
endFunc

func disableRemoveAllButton()
	_disableElement($Button5)
endFunc

func enableListItemUpButton()
	_enableElement($Button6)
endFunc

func disableListItemUpButton()
	_disableElement($Button6)
endFunc

func enableListItemDownButton()
	_enableElement($Button7)
endFunc

func disableListItemDownButton()
	_disableElement($Button7)
endFunc


func _enableElement($buttonID)
	GUICtrlSetState ( $buttonID, $GUI_ENABLE )
endFunc

func _disableElement($buttonID)
	GUICtrlSetState ( $buttonID, $GUI_DISABLE )
endFunc