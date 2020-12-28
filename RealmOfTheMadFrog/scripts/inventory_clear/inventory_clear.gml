/// @description  inventory_clear()
ds_map_clear(global.inventory)

for (i=0; i<global.InventorySlot*global.InventorySlotH; i+=1)
{
    inventory_write("slot",i,false)
    inventory_write("ID",i,-1)
    inventory_write("Stack",i,-1)
};
