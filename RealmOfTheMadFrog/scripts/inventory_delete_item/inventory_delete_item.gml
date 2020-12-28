/// @description inventory_delete_item(Item ID, Amount);
/// @param Item ID
/// @param  Amount

var itemID = argument0;
var amount = argument1;

var SlotID = -1;

repeat(amount){
    for(i=0; i<global.InventorySlot*global.InventorySlotH; i++){
        if (itemID == inventory_read("ID", i)){
            SlotID = i;            
            break;
        }
    }
    inventory_item_delete(SlotID, 1);
}
