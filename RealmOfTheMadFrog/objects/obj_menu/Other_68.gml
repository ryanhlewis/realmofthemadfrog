/// @description Insert description here
// You can write your code in this editor


var event_id = async_load[? "id"]

if event_id == brodcast_server {
	var ip = async_load[? "ip"]
	
	var buff = async_load[? "buffer"]
	var nam = buffer_read(buff, buffer_string)
	var des = buffer_read(buff, buffer_string)
	var cli = buffer_read(buff, buffer_u8)
	var mac = buffer_read(buff, buffer_u8)
	
	//add it to the map 
	var ind = ds_list_find_index(s_ips, ip)
	if ind != -1{
		//update
		ds_list_set(s_names, ind, nam)
		ds_list_set(s_clients, ind, cli)
		ds_list_set(s_maxclients, ind, mac)
		ds_list_set(s_descriptions, ind, des)
	} else {
		ds_list_add(s_ips, ip)
		ds_list_add(s_names, nam)
		ds_list_add(s_clients, cli)
		ds_list_add(s_maxclients, mac)
		ds_list_add(s_descriptions, des)
	}

	
}