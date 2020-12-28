/// @description  inventory_sort(typ, reserve)
/// @param typ
/// @param  reserve
/// Typ -> 0 = 123; 1 = ABC; 2 = biggest Stack
/// Reserve Sorting -> false; true
var typ, reserve;
typ = argument0
reserve = argument1
var temp_id, temp_stack, temp_slot, j;
j = 0
if typ = 0{
    for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
    {
        for (j=0; j<i; j+=1)
        {
         if inventory_read("ID",j) = -1 { inventory_write("ID",j,ds_map_size(global.item_id)+1) } 
         if inventory_read("ID",j+1) = -1 { inventory_write("ID",j+1,ds_map_size(global.item_id)+1) } 
         var id1, id2;
         if reserve{
            id1 = inventory_read("ID",j+1)
            id2 = inventory_read("ID",j)
         }else{
            id1 = inventory_read("ID",j)
            id2 = inventory_read("ID",j+1)
         }
            if id1 > id2{
               temp_id = inventory_read("ID",j)
               temp_stack = inventory_read("Stack",j)
               temp_slot = inventory_read("slot",j)
               inventory_write("ID",j,inventory_read("ID",j+1))
               inventory_write("Stack",j,inventory_read("Stack",j+1))
               inventory_write("slot",j,inventory_read("slot",j+1))
               inventory_write("ID",j+1,temp_id)
               inventory_write("Stack",j+1,temp_stack)
               inventory_write("slot",j+1,temp_slot)
           };
         if inventory_read("ID",j) = ds_map_size(global.item_id)+1 { inventory_write("ID",j,-1) } 
         if inventory_read("ID",j+1) = ds_map_size(global.item_id)+1 { inventory_write("ID",j+1,-1) } 
        };  
    };
}else if typ = 1{
    var string_value1, string_value2;
    string_value1 = 0
    string_value2 = 0
    for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
    {
        for (j=0; j<(global.InventorySlot*global.InventorySlotH)-1; j+=1)
        {
         if inventory_read("ID",j) = -1 { inventory_write("ID",j,ds_map_size(global.item_id)+1) } 
         if inventory_read("ID",j+1) = -1 { inventory_write("ID",j+1,ds_map_size(global.item_id)+1) } 
         var id1, id2;
         if reserve{
            id1 = inventory_read("ID",j+1)
            id2 = inventory_read("ID",j)
         }else{
            id1 = inventory_read("ID",j)
            id2 = inventory_read("ID",j+1)
         }
         string_value1 = ord(string_upper(string_copy(item_id_read(id1,0),0,1)))
         string_value2 = ord(string_upper(string_copy(item_id_read(id2,0),0,1)))
            if string_value1 > string_value2{
               temp_id = inventory_read("ID",j)
               temp_stack = inventory_read("Stack",j)
               temp_slot = inventory_read("slot",j)
               inventory_write("ID",j,inventory_read("ID",j+1))
               inventory_write("Stack",j,inventory_read("Stack",j+1))
               inventory_write("slot",j,inventory_read("slot",j+1))
               inventory_write("ID",j+1,temp_id)
               inventory_write("Stack",j+1,temp_stack)
               inventory_write("slot",j+1,temp_slot)
           };
         if inventory_read("ID",j) = ds_map_size(global.item_id)+1 { inventory_write("ID",j,-1) } 
         if inventory_read("ID",j+1) = ds_map_size(global.item_id)+1 { inventory_write("ID",j+1,-1) } 
        };  
    };
}else if typ = 2{
    for (i=0; i<(global.InventorySlot*global.InventorySlotH); i+=1)
    {
        for (j=0; j<(global.InventorySlot*global.InventorySlotH); j+=1)
        {
         if inventory_read("ID",j) = -1 { inventory_write("ID",j,ds_map_size(global.item_id)+1) } 
         if inventory_read("ID",j+1) = -1 { inventory_write("ID",j+1,ds_map_size(global.item_id)+1) } 
         var stack1, stack2;
         if reserve{
            stack1 = inventory_read("Stack",j+1)
            stack2 = inventory_read("Stack",j)
         }else{
            stack1 = inventory_read("Stack",j)
            stack2 = inventory_read("Stack",j+1)
         }
            if stack1 < stack2{
               temp_id = inventory_read("ID",j)
               temp_stack = inventory_read("Stack",j)
               temp_slot = inventory_read("slot",j)
               inventory_write("ID",j,inventory_read("ID",j+1))
               inventory_write("Stack",j,inventory_read("Stack",j+1))
               inventory_write("slot",j,inventory_read("slot",j+1))
               inventory_write("ID",j+1,temp_id)
               inventory_write("Stack",j+1,temp_stack)
               inventory_write("slot",j+1,temp_slot)
           };
         if inventory_read("ID",j) = ds_map_size(global.item_id)+1 { inventory_write("ID",j,-1) } 
         if inventory_read("ID",j+1) = ds_map_size(global.item_id)+1 { inventory_write("ID",j+1,-1) } 
        };  
    };
}
