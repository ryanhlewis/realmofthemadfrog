/// @description  inventory_item_use(SlotID)
/// @param SlotID
var slot_id;
slot_id = argument0;
if inventory_read("slot",slot_id) = true{
   var item_id_va;
   item_id_va = item_id_read(inventory_read("ID",slot_id),3)
   if item_id_va = true{
      script_execute(asset_get_index(item_id_read(inventory_read("ID",slot_id),4)))
      var item_amount;
      item_amount = inventory_read("Stack",slot_id)
      item_amount = max(item_amount-1,0)
      if item_amount = 0{
         inventory_write("slot",slot_id,false)
         inventory_write("ID",slot_id,-1)
         inventory_write("Stack",slot_id,-1)
      }else{
         inventory_write("Stack",slot_id,item_amount)
      }
      return true;
   }else{
      return false;
   }
}
