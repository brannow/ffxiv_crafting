#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Benjamin - Plany

 Script Function:
	Final Fantasy XIV - A Realm Reborn [Crafting Bot]

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include "processCrafting.au3"

Dim const $_defaultActionKeyCode = "NUMPAD0"


func startCrafting()

	setCountLeft( $maxLoopCount - $loopCount )
	$loopCount = $loopCount + 1
	if $loopCount > $maxLoopCount then
		_abortCrafting()
		return
	endIf
	
	if $active > 0 then
	
		_selectDefaultCrafting()
		sleep(Random(500, 1500, 1))
		processCrafting()
		
	endif
	
	
	
endfunc

func _selectDefaultCrafting()

	_pressActionKey(Random(1000, 1600, 1))
	_pressActionKey(Random(1000, 1600, 1))
	_pressActionKey(Random(1000, 1600, 1))
	_pressActionKey(Random(500, 800, 1))
	
endfunc


func _pressActionKey($delay)

	if $active < 1 then
		return 0
	endif
	
	dim $intDelay = Int($delay)

	__pressKey($_defaultActionKeyCode)
	
	if $intDelay > 0 then
		sleep($intDelay)
	endif
	
endFunc
