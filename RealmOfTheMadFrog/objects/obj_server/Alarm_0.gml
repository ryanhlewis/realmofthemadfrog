/// @description Insert description here
// You can write your code in this editor

alarm[0] = room_speed

buffer_seek(brodcast_buffer, buffer_seek_start, 0)
buffer_write(brodcast_buffer, buffer_string, server_name)
buffer_write(brodcast_buffer, buffer_string, server_desc)
buffer_write(brodcast_buffer, buffer_u8, ds_list_size(sockets))
buffer_write(brodcast_buffer, buffer_u8, MAX_CLIENTS)

//send this data 
network_send_broadcast(server, 4501, brodcast_buffer, buffer_tell(brodcast_buffer))
