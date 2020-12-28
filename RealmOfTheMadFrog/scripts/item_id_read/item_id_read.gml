/// @description  item_id_read(ID,ID_Info)
/// @param ID
/// @param ID_Info
return ds_map_find_value(global.item_id,"item["+string(argument0)+","+string(argument1)+"]")
