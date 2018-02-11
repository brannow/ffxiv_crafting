#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Benjamin - Plany

 Script Function:
	Final Fantasy XIV - A Realm Reborn [Crafting Bot]

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#Include <WinAPI.au3>
#include "mainWindow.au3"
#include "startCrafting.au3"

HotKeySet ("{insert}","_abortCrafting")

Opt("SendKeyDownDelay", 231)

global $active = 0
global $loopCount = 0
global $maxLoopCount = 0

$gameHandle = WinGetHandle("[TITLE:FINAL FANTASY XIV: A Realm Reborn; CLASS:FFXIVGAME]")

While 1
   
   
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $Button1 
			_initCrafting()
		case $Button2 
			_abortCrafting()
		 case $Button3 
			_addDataToList()
		 case $Button6 
			 moveCurrentListItemUp()
		 case $Button7 
			 moveCurrentListItemDown()
		 case $Button4 
			 deleteCurrentListItem()
		 case $Button5 
			 deleteAllListItems()
	EndSwitch
	
	if $active > 0 then
	
		startCrafting()
		
	endif
	
WEnd

func _abortCrafting()


	if $gameHandle then
		
		 $active = 0
		
		 setCountLeft( 0 )
		 disableStopButton()
		 enableDurationInput()
		 enableStartButton()
		 enableAddButton()
		 enableRemoveSelectedButton()
		 enableRemoveAllButton()
		 enableListItemUpButton()
		 enableListItemDownButton()
	else
		 MsgBox(0, "Error", "Game not found" )
	endif

endFunc

func _initCrafting()

	if $gameHandle then

		$loopCount = 0
		$maxLoopCount = Int( getDuration() )
		
		disableDurationInput()
		disableStartButton()
		enableStopButton()
		disableAddButton()
		disableRemoveSelectedButton()
		disableRemoveAllButton()
		disableListItemUpButton()
	    disableListItemDownButton()
	
		WinActivate($gameHandle)
		sleep(100)
		$active = 1
	else
		MsgBox(0, "Error", "Game not found" )
	endif
	
endFunc

func __pressKey( $key )
   
   local $newDelay = Random(180, 320, 1)
	Opt("SendKeyDownDelay", $newDelay)
   
    ConsoleWrite($key & " - " &  $active  & " [delay:" & $newDelay & "]" & @CRLF)
	ControlSend($gameHandle, "", $gameHandle, "{" & $key & "}")
	
endFunc

func _addDataToList()

   local $_key, $_dur
   $_key = getAddListKey()
   $_dur = getAddListDuration()
   
   
   
   if StringLen($_key) > 0 And StringLen($_dur) > 0 then
	  addListItem($_key, $_dur)
	  setAddListKey("")
	  _WinAPI_SetFocus(GUICtrlGetHandle($Input3))
   endif

endFunc