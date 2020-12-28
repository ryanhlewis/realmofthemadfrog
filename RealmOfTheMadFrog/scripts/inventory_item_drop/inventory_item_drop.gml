/// @description  inventory_item_drop(SlotID,Amount,x,y,objdrop)
/// @param SlotID
/// @param Amount
/// @param x
/// @param y
/// @param objdrop
var slot_id, amount, _x, _y, objdrop;
slot_id = argument0;
amount = argument1;
_x = argument2;
_y = argument3;
objdrop = argument4;
inst = noone
if inventory_read("slot",slot_id) = true{
   if amount >= 0{
      var item_amount;
      item_amount = inventory_read("Stack",slot_id)
      item_amount = max(item_amount-amount,0)
      if item_amount < amount{
         amount = item_amount+1
      }
      repeat(amount){
         inst = instance_create(_x,_y,objdrop);
         with(inst) ID = inventory_read("ID",slot_id)
      }
      if item_amount = 0{
         inventory_item_clear(slot_id);
      }else{
         inventory_write("Stack",slot_id,item_amount)
      }
   }else{
      var item_amount;
      item_amount = inventory_read("Stack",slot_id)
      inst = instance_create(_x,_y,objdrop)
      repeat(item_amount){
         with(inst) ID = inventory_read("ID",slot_id)
      }
      inventory_item_clear(inventory_select());
   }
}
return inst;
