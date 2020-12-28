
hspd = walking_speed*(keys[KEY_RIGHT]-keys[KEY_LEFT])
vspd = walking_speed*(keys[KEY_DOWN]-keys[KEY_UP])




//do some collision 
if (place_free(x+hspd, y)) {
	x+= hspd
}else {
	hspd = distance_to_object(obj_solid)*sign(hspd)
}

if (place_free(x, y+vspd)) {
	y+=vspd
}else {
	vspd = distance_to_object(obj_solid)*sign(vspd)
}

//sprite handling 
if (hspd == 0) {
	sprite_index = idle_sprite 
}else {
	sprite_index = run_sprite 
}

//Find target client

//loop through every clients'object and check if it has teh same id as ours 
/*for (var i =0; i < instance_number(obj_client); i++) {
	var e = instance_find(obj_client, i)
	if my_id == e.my_id {
		target = e 
		break 
	}
}*/
//Solution #2, pass x,y, mouse positions as network buffers

// Diagnosis: Cannot figure out how to find relating OBJ_CLIENT.
// IF i could find him, easily could send
// target x, target y back forth for bullets.

//I believe the problem here is that there is an ORIGINAL screen or something
// So when game takes mouse_x, it works for the first area. but doesn't once that mouse
// leaves. Mouse is clicking on the screen at 400, so it shoots at 400 in the room.

//shooting


if(keys[MOUSE_CLICK]) {
if (canShoot) {
            // Bullet creation + aim at mouse
            with (instance_create(x + lengthdir_x(4, point_direction(x, y, pos[MouseX], pos[MouseY])), y - 4 + lengthdir_y(4, point_direction(x, y, pos[MouseX], pos[MouseY])), oBullet)) {
				speed=5;
                direction = point_direction(x, y, other.pos[MouseX],other.pos[MouseY]/*mouse_x, mouse_y*/) + random_range(-2, 2);    
			}
            
            // Delay fire
            switch(gun) {
                case 0:
                    alarm[0] = 10;
                break;
                case 1:
                    alarm[0] = 3;
                break;
                case 2:
                    alarm[0] = 20;
             break;
			 
            }
            
            canShoot = false;
        }
		
		
		if (hp <=0 ) {
		visible = false
		canShoot=false;
		walking_speed=0;
}
		
}

//Cursor
//draw_sprite_ext(sCursor, -1, mouse_x, mouse_y, 1, 1, point_direction(x, y, mouse_x, mouse_y) + 45, c_white, 1);
