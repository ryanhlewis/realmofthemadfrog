#macro KEY_LEFT		0
#macro KEY_RIGHT	1
#macro KEY_UP		2
#macro KEY_DOWN		3
#macro MOUSE_CLICK  4


#macro MouseX       0
#macro MouseY       1
//var MouseX = 0
//var MouseY = 0

keys[KEY_LEFT] = false 
keys[KEY_RIGHT]= false 
keys[KEY_UP] = false 
keys[KEY_DOWN]= false

keys[MOUSE_CLICK]= false

pos[MouseX] = 0;
pos[MouseY] = 0;

walking_speed = 2
hspd = 0
vspd = 0 

my_id = -1

name = "Player"

if (instance_exists(obj_server) ) {
	visible = false 
}

character = 0 
HandleSprites(character)

//How do i want to do this?
// OBJ_Players only exist on server end.

//Maybe clients send a signal on their mouse press, 
// and obj_player of that client sends the bullet.

// How to tell which client sent what signal to what obj_player??
// I have to number my clients and players somehow.


canShoot = true;

if(room == rm_hub)
canShoot=false;


gun=2;

hp = 100;
max_hp = 100;

mana = 100;
max_mana = 100;

