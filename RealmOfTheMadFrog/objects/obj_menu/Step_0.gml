if (picking_name) {
	global.name = keyboard_string
	
	if (keyboard_check_pressed(vk_enter)) {
		picking_name = false 
	}
}else {
	if (keyboard_check_pressed(vk_down)) {
		cur_index ++ 
	}

	if (keyboard_check_pressed(vk_up)) {
		cur_index --
	}

	if !server_list
		cur_index = clamp(cur_index, 0, array_length_1d(menu)-1)
	else 
		cur_index = clamp(cur_index, 0, ds_list_size(s_ips))
	
	if (keyboard_check_pressed(vk_enter)) {
		
		if !server_list {
			switch(cur_index) {
				case 0: 
					instance_create_layer(0,0, "Instances", obj_server)
					instance_destroy()
					room_goto_next()
				break 
		
				case 1:
					instance_destroy()
					room_goto_next()
					break 
			
				case 2: // see the available servers 
				
					server_list = true
					cur_index = 0
				

				break 
				
				case 3: //quit the game
					game_end()
					break 
		
			}
		}else  {
			//go back 
			if cur_index == ds_list_size(s_ips) {
				server_list = false 
			}else {
				global.ip = ds_list_find_value(s_ips, cur_index)
				room_goto_next()
			}
			
			
		}
	}
}
