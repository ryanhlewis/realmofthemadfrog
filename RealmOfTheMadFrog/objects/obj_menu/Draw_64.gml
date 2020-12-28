draw_set_font(fnt_main)

draw_set_halign(fa_center)
if (picking_name) {
	draw_text(room_width /2, 50, "Pick Your Name")
	draw_text(room_width /2, 150, global.name)
}else if (server_list) {
	//
	draw_set_color(c_orange)
	draw_text(room_width/2, 70, "-Local Games-")
	var i = 0;
	for (i = 0; i < ds_list_size(s_ips); i++) {
		var ip = ds_list_find_value(s_ips, i)
		var n = ds_list_find_value(s_names, i)
		var d = ds_list_find_value(s_descriptions, i)
		var c = ds_list_find_value(s_clients, i)
		var m = ds_list_find_value(s_maxclients, i)
		
		draw_set_color(cur_index == i?c_green:c_white)
		draw_text(room_width/2, 100+32*i, ip+"-"+n+"-"+string(c)+"/"+string(m)+"-"+d)
	}
	draw_set_color(cur_index == i?c_green:c_white)
	draw_text(room_width/2, 100+32*i, "Back")
}
else {
	for (var i = 0; i < array_length_1d(menu) ; i++) {
		draw_set_color(cur_index==i?c_green:c_white)
		draw_text(room_width/2, 100+32*i, menu[i])
	}
}

draw_set_halign(fa_left)