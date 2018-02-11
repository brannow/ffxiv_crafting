#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Benjamin - Plany

 Script Function:
	Final Fantasy XIV - A Realm Reborn [Crafting Bot]

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

func processCrafting()
	
	
   if listCount() > 0 Then
	  
	  local $count = listCount()
	  
	  For $i = 0 To $count -1
		 local $item = nativeItemAtIndex($i)
		 _pressCraftngKey($item[0], $item[1])
	  Next
	  
	  
   Else
	  _abortCrafting()
   EndIf
	
	if $active > 0 then
		sleep(Random(1000, 2000, 1))
	endif
	
endFunc


func _pressCraftngKey( $key, $delay )

	if $active < 1 then
		return 0
	endif

	local $intDelay = Int($delay) + Random(1, 120, 1)

	__pressKey($key)
	
	if $intDelay > 0 then
		sleep($intDelay)
	endif
	
endFunc