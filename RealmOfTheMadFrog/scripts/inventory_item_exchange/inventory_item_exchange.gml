/// @description  inventory_item_exchange(slot_id1, slot_id2)
/// @param slot_id1
/// @param  slot_id2
var slot_id1, slot_id2;
slot_id1 = argument0;
slot_id2 = argument1;

maxStack1 = item_id_read(inventory_read("ID",slot_id1), 1);
maxStack2 = item_id_read(inventory_read("ID",slot_id2), 1)

if (inventory_read("ID",slot_id1) == inventory_read("ID",slot_id2) && (maxStack1 != inventory_read("Stack", slot_id1) && maxStack2 != inventory_read("Stack", slot_id2)) ){
    while(true){
        if (inventory_read("Stack", slot_id2) < maxStack2){
        
            inventory_write("Stack",slot_id2,inventory_read("Stack",slot_id2) + 1)
            inventory_item_delete(slot_id1, 1);
            //show_message(inventory_read("Stack",slot_id1));
            if (inventory_read("Stack",slot_id1)== -1){
                
                break;
            }
        }else{
            break;
        }
        
        
    }    
    return true;
}else{

if inventory_read("slot",slot_id1) = true{
   var temp_id1, temp_stack1, temp_slot1, temp_id2, temp_stack2, temp_slot2;
   temp_id1 = inventory_read("ID",slot_id1)
   temp_stack1 = inventory_read("Stack",slot_id1)
   temp_slot1 = inventory_read("slot",slot_id1)
   temp_id2 = inventory_read("ID",slot_id2)
   temp_stack2 = inventory_read("Stack",slot_id2)
   temp_slot2 = inventory_read("slot",slot_id2)
   inventory_write("ID",slot_id1,temp_id2)
   inventory_write("Stack",slot_id1,temp_stack2)
   inventory_write("slot",slot_id1,temp_slot2)
   inventory_write("ID",slot_id2,temp_id1);
   inventory_write("Stack",slot_id2,temp_stack1)
   inventory_write("slot",slot_id2,temp_slot1)
   return true
}else{
   return false
}
}
