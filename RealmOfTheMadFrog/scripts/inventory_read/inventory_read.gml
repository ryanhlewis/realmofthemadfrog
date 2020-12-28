/// @description  inventory_read(Typ,SlotID)
/// @param Typ
/// @param SlotID
return ds_map_find_value(global.inventory,argument0+string(argument1))
