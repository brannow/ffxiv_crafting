#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         Benjamin - Plany

 Script Function:
	Final Fantasy XIV - A Realm Reborn [Crafting Bot]

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#Include <GuiListView.au3>

_GUICtrlListView_SetItemCount($ListView1, 100)

func addListItem($key, $duration)
   _GUICtrlListView_AddItem($ListView1, $key)
   local $count = _GUICtrlListView_GetItemCount($ListView1)
   _GUICtrlListView_AddSubItem($ListView1, $count-1, $duration, 1)
endFunc

func currentItemIndexSelected()
   local $index = _GUICtrlListView_GetSelectedIndices($ListView1)
   if $index then
	  return int($index)
   endif
   return -1
endfunc

func moveCurrentListItemUp()
    local $index = currentItemIndexSelected()
    local $item = _GUICtrlListView_GetItemTextArray($ListView1, $index)
    local $count = _GUICtrlListView_GetItemCount($ListView1)
	if $index > 0 then
	   
	   local $newIndex = $index - 1
	   deleteCurrentListItem()
	   _GUICtrlListView_InsertItem($ListView1, $item[1], $newIndex)

	   For $i = 2 To UBound($item) -1
			_GUICtrlListView_AddSubItem($ListView1, $newIndex, $item[$i], $i-1)
	   Next
	   
	   _GUICtrlListView_SetItemSelected($ListView1, $newIndex, 1, 1)
	   
	   
    endif	   
 endfunc
 
func listCount()
	return _GUICtrlListView_GetItemCount($ListView1)
endFunc

func nativeItemAtIndex($index)
   
   if $index < listCount() And $index >= 0 Then
	  
	  local $item = _GUICtrlListView_GetItemTextArray($ListView1, $index)
	  Local  $nativeItem[2]
	  
	  $nativeItem[0] = $item[1]
	  $nativeItem[1] = $item[2]
	  
	  return $nativeItem
	  
   endif
   
endfunc

func moveCurrentListItemDown()
   
   local $index = currentItemIndexSelected()
   local $item = _GUICtrlListView_GetItemTextArray($ListView1, $index)
   local $count = listCount()
   
	if $index >= 0 And $index < ($count - 1) then
	   
	   local $newIndex = $index + 1
	   deleteCurrentListItem()
	   _GUICtrlListView_InsertItem($ListView1, $item[1], $newIndex)

	   For $i = 2 To UBound($item) -1
			_GUICtrlListView_AddSubItem($ListView1, $newIndex, $item[$i], $i-1)
	   Next
	   
	   _GUICtrlListView_SetItemSelected($ListView1, $newIndex, 1, 1)
	   
    endif	
endfunc
 
 
func deleteCurrentListItem()
   _GUICtrlListView_DeleteItemsSelected(GUICtrlGetHandle($ListView1))
endfunc

func deleteAllListItems()
   _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($ListView1))
endfunc