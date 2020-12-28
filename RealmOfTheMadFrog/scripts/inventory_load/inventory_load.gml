/// @description  inventory_load(filename)
/// @param filename
global.inventory = ds_map_secure_load(argument0)

if (!ds_exists(global.inventory, ds_type_map)){
    global.inventory = ds_map_create();
    inventory_clear();
}
