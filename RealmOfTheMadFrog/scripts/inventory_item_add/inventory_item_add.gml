/// @description  inventory_item_add(ID, Amount)
/// @param ID
/// @param  Amount
var ID, stack;
ID = argument0;
stack = argument1;

var inventory_empty;
inventory_empty = false
for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
{
    if ds_map_find_value(global.inventory,"ID"+string(i)) = ID{
       var stack_max, stack_value;
       stack_max = ds_map_find_value(global.item_id,"item["+string(ID)+",1]")
       stack_value = ds_map_find_value(global.inventory,"Stack"+string(i))
       if stack_max > stack_value{
          var stack_new;
          stack_new = stack
          ds_map_replace(global.inventory,"Stack"+string(i),min(stack_value+stack_new,stack_max))
          stack = max((stack_value+stack_new)-stack_max,0)
          if stack = 0{
             break;
          }
       }
    }
};

while (stack > 0){
      inventory_empty = false
      for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
      {
         if ds_map_find_value(global.inventory,"slot"+string(i)) = false{
            inventory_empty = true
            break;
         }
      };
    if inventory_empty{
       for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
       {
            if stack = 0{
               break;
            }else{
               var slot_full;
               slot_full = ds_map_find_value(global.inventory,"slot"+string(i))
               if !slot_full{
                  var stack_new;
                  stack_new = stack
                  var item_max;
                  item_max = ds_map_find_value(global.item_id,"item["+string(ID)+",1]")
                  ds_map_replace(global.inventory,"slot"+string(i),true)
                  ds_map_replace(global.inventory,"ID"+string(i),ID)
                  ds_map_replace(global.inventory,"Stack"+string(i),min(stack_new,item_max))
                  stack = max(stack-item_max,0)
                  break;
               }
            }
       }
    }else{
       break;
    }
}

return stack
