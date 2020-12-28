/// @description  inventory_int(slot width, slot height)
/// @param slot width
/// @param  slot height
slot = argument0 //12
slot_h = argument1

global.InventorySlot = slot
global.InventorySlotH = slot_h
global.ItemSelected = 0
global.ItemLastSelect = -1
global.MouseItem = false;
global.MouseIndex = -1
global.MouseOutside = true
global.ChestList = ds_list_create();
global.inventory = ds_map_create();

for (i=0; i<(slot*slot_h); i++)
{
    ds_map_add(global.inventory,"slot"+string(i),false)
    ds_map_add(global.inventory,"ID"+string(i),-1)
    ds_map_add(global.inventory,"Stack"+string(i),-1)
};
