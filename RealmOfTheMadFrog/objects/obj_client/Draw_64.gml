

draw_set_font(fnt_main)
draw_set_halign(fa_center)
if (!playing) {
	
	draw_set_color(c_black)
	draw_rectangle(0,0, view_wport[0], view_hport[0], false)
	
	///draw the chracter select menu 
	draw_set_color(c_orange)
	draw_text(view_wport[0]/2, 10, "Character Select")
	
	var sp = spr_wizzard_m_idle
	
	
	for (var i = 0; i <= CHAR_ELF_F; i++) {
		
		switch(i) {
			case CHAR_WIZZARD_F:
				sp = spr_wizzard_f_idle
			break 
	
			case CHAR_WIZZARD_M:
				sp = spr_wizzard_m_idle
			break 
	
			case CHAR_ELF_F:
				sp = spr_elf_f_idle

			break 
	
			case CHAR_ELF_M:
				sp = spr_elf_m_idle

			break 
	
			case CHAR_KNIGHT_M:
				sp = spr_knight_m_idle

			break 
	
			case CHAR_KNIGHT_F:
				sp = spr_knight_f_idle
			break 
		}
		
		
		var ib = c_green ;
		var off = view_wport[0] / 4 
		draw_sprite_ext(spr_box, 0, off+off*(i%3), 200+(off*(i >=3 ? 1:0)), 4, 4 , 0, picked[i]?c_gray:c_white, 1 )
		draw_sprite_ext(sp, i==char?image_index:0, off+off*(i%3), 190+(off*(i >=3 ? 1:0)), 4, 4, 0, picked[i]?c_gray:c_white, 1)
		if (i == char) {
			if (picked[i] == true) {
				ib = c_red
				draw_set_color(c_red)
				draw_set_font(fnt_small)
				draw_text(off+off*(i%3), 210+(off*(i >=3 ? 1:0)), "PICKED")
			}else {
				ib = c_green
			}
			draw_sprite_ext(spr_indicator, 0, off+off*(i%3), 200+(off*(i >=3 ? 1:0)), 4, 4 , 0, ib, 1 )
		}
	}
	draw_set_halign(fa_left)
}else {
	draw_set_halign(fa_left)
	draw_set_font(fnt_small)
	if typing {
		draw_set_color(c_black)
		draw_rectangle(8, 690, 8+string_width (msg)+8, 710, false) //460,480  
		draw_set_color(c_orange)
		draw_text(10, 690, msg+" | ") //460
	}
	
	for (var i =0; i < ds_list_size(names); i++) {
		var n = ds_list_find_value(names , i)
		var m = ds_list_find_value(msgs , i)
		var t = n+" : "
		draw_set_color(c_black) // 440      460
		draw_rectangle(8, 680-(ds_list_size(names)-i)*20, 8+2+string_width(t+m), 700-(ds_list_size(names)-i)*20, false)
		draw_set_color(c_lime)
		draw_text(10, 680-(ds_list_size(names)-i)*20, t)  //440
		draw_set_color(c_white)
		draw_text(10+string_width(t), 680-(ds_list_size(names)-i)*20, m) //440
	}
	
}


// Entire Hotbar on right side of screen

draw_rectangle_colour(1020, 0, 1300, 800, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false);


	//draw_sprite_ext(spr_parchment, image_index, 800, 800, image_xscale, image_yscale, 90, image_blend, 1);

	drawmipmap(1030,10,3);
	
draw_set_font(fnt_main);

if(target != noone) {
draw_text_transformed_color(1070,275,target.name,1,1,0,c_white,c_white,c_white,c_white,1)	
}
if(playing)
draw_sprite_ext(target.sprite_index,0,1045,305,2,2,0,-1,1)

draw_sprite_ext(spr_home,1,1240,275,0.15,0.15,0,-1,1)	



if(point_in_rectangle(  device_mouse_x_to_gui(0)  , device_mouse_y_to_gui(0)  , 1240, 275, 1270, 325)) {
    if(mouse_check_button(mb_left)) {
        // Need to run only once
		//If i switch rooms- this resets, doesn't it?
		// I dont think I made the player persistent either- I need to.
		room_goto(rm_hub);
		
		//show_debug_message("clicked")
		//window_cordx = device_mouse_x_to_gui(0);
        //window_cordy = device_mouse_y_to_gui(0);
    }
}

//Debug Mouse
//draw_text(x+10,y-10, "X: " + string(mouse_x) + "; Y: " + string(mouse_y));

var hptotal;
hptotal = (hp / max_hp) * 100;

draw_healthbar(1030, 315, 1270, 335, hptotal, c_black, c_red, c_lime, 0, true, true)

var manatotal;
manatotal = (mana / max_mana) * 100;
draw_healthbar(1030, 340, 1270, 360, manatotal, c_black, c_aqua, c_aqua, 0, true, true)
 
 
 
// Inventory


inventory_draw(1035,370,spr_slot, spr_slot,10,c_white);



var id_last = inventory_read("ID",inventory_last_select());


//Read the script "item_int" for more information for item_id_read

if inventory_last_select() >= 0 and inventory_read("ID",inventory_last_select()) != -1{

draw_set_font(fnt_small)
draw_text(1125,560,
string_hash_to_newline("# " + string(item_id_read(id_last,0)) +
"##  " + string(inventory_read("Stack",inventory_last_select())) + " / " + string(item_id_read(id_last,1)))
);
draw_text(1035,650,
string_hash_to_newline(" " + string(item_id_read(id_last,5)))
);



draw_sprite_ext(item_id_read(id_last,2),image_index,1035,570,4,4,0,c_white,1);
}



