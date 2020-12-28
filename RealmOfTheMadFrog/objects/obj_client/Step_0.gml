/// @description Insert description here
// You can write your code in this editor

//MOVEMENT
if (playing) {
	if (keyboard_check_pressed(ord("A"))) {
		SendKey(KEY_LEFT, true)
	}

	if (keyboard_check_released(ord("A"))) {
		SendKey(KEY_LEFT, false)
	}


	if (keyboard_check_pressed(ord("D"))) {
		SendKey(KEY_RIGHT, true)
	}

	if (keyboard_check_released(ord("D"))) {
		SendKey(KEY_RIGHT, false)
	}
	
	if (keyboard_check_pressed(ord("S"))) {
		SendKey(KEY_DOWN, true)
	}

	if (keyboard_check_released(ord("S"))) {
		SendKey(KEY_DOWN, false)
	}


	if (keyboard_check_pressed(ord("W"))) {
		SendKey(KEY_UP, true)
	}

	if (keyboard_check_released(ord("W"))) {
		SendKey(KEY_UP, false)
	}
	
	//SHOOTING
	if mouse_check_button(mb_left) {
		//tempx = mouse_x;
		//tempy = mouse_y;
		SendLargeKey(MouseX,mouse_x)
		SendLargeKey(MouseY,mouse_y)
		SendKey(MOUSE_CLICK, true)
	
	}
	
	

	if mouse_check_button_released(mb_left) {
		SendKey(MOUSE_CLICK, false)
	}
	
	//CHAT
	if (keyboard_check_pressed(vk_enter)) {
		typing =!typing
		
		if (!typing) {
			if (string_length(msg)) > 1 {
				SendChat(msg)
			}
		}else {
			keyboard_string = ""
		}
	}
}else {
	if (keyboard_check_pressed(ord("A"))) {
		char -- 
	}

	if (keyboard_check_pressed(ord("D"))) {
		char ++
	}
	
	if (keyboard_check_pressed(ord("W"))) {
		char -=3
	}
	
	if (keyboard_check_pressed(ord("S"))) {
		char +=3
	}
	
	if (keyboard_check_pressed(vk_enter)) {
		SendCharacter(char)
	}
	
}


char = clamp(char, 0, CHAR_ELF_F)

//loop through every clients'object and check if it has teh same id as ours 
for (var i =0; i < instance_number(obj_remote_entity); i++) {
	var e = instance_find(obj_remote_entity, i)
	if my_id == e.my_id {
		target = e 
		break 
	}
}

if target!= noone {
	camera_set_view_target(view_camera[0], e)
	camera_set_view_border(view_camera[0], view_wport[0]/2, view_hport[0]/2)

	//Have client at player position
	x = target.x;
	y = target.y;

}



if (typing) {
	msg = keyboard_string
}



	if (keyboard_check_pressed(ord("Q"))) {
		inventory_item_add(1,2);
	}
	
	
