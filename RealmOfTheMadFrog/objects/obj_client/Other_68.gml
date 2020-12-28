var event_id = async_load[? "id"]

if socket == event_id {
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0)
	
	var cmd = 	buffer_read(buff, buffer_u8)
	
	switch(cmd){
		case PACKET_ENTITY:
			var c = buffer_read(buff, buffer_u8)
			var e_id = buffer_read(buff, buffer_u32)
			
			if !ds_map_exists(entities, e_id) {
				var p = instance_create_layer(0, 0, "Instances", obj_remote_entity)
				ds_map_set(entities, e_id, p)
			}
			
			var p = entities[? e_id]
			
			switch (c) {
				case CMD_X:
					p.x = buffer_read(buff, buffer_s16)
				break 
	
				case CMD_Y:
					p.y = buffer_read(buff, buffer_s16)
				break 
	
				case CMD_NAME:
					p.name = buffer_read(buff, buffer_string)
				break 
	
				case CMD_SPRITE:
					p.sprite_index = buffer_read(buff, buffer_u16)
				break
				
				case CMD_ANGLE:
					p.image_angle = buffer_read(buff, buffer_s16)
				break 
	
				case CMD_DESTROY:
					buffer_read(buff, buffer_u8)
					ds_map_delete(entities, e_id)
					with (p) {
						instance_destroy()
					}
				break
				
				case CMD_MYID:
					p.my_id = buffer_read(buff, buffer_u8)
					break 
			}
			
			break 
			
			case PACKET_PLAY :
				playing = true 
			break 
			
			case PACKET_PICK:
				picked[buffer_read(buff, buffer_u8)] = buffer_read(buff, buffer_u8) 
			break 
			
			case PACKET_MYID:
				my_id = buffer_read(buff, buffer_u8)
			break
			
			case PACKET_CHAT :
				var n = buffer_read(buff, buffer_string)
				var m = buffer_read(buff, buffer_string)
				
				if (ds_list_size(names) < MAX_CHAT_MSGS) {
					ds_list_add(names , n)
					ds_list_add(msgs, m)
				}else {
					for (var i = 0; i < MAX_CHAT_MSGS-1; i++) {
						ds_list_set(names, i, ds_list_find_value(names, i+1))
						ds_list_set(msgs, i, ds_list_find_value(msgs, i+1))
					}
					ds_list_set(names, MAX_CHAT_MSGS-1, n)
					ds_list_set(msgs, MAX_CHAT_MSGS-1, m)
				}
			break 
	}
	
}