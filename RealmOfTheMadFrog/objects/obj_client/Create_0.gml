#macro MAX_CHAT_MSGS	5
socket = network_create_socket(network_socket_tcp)
global.socket = socket 
buffer = buffer_create(16384, buffer_grow, 1)
connect = network_connect(socket, global.ip, PORT)

if (connect < 0) {
	show_message("Can not reach the server")
	game_restart()
}

//show_debug_message(string(socket))

//
entities = ds_map_create()
SendName(global.name)
char = 0

playing = false 
picked[0] = false 
picked[1] = false 
picked[2] = false 
picked[3] = false 
picked[4] = false 
picked[5] = false 

my_id = -2
target = noone 
image_speed = .1

SendMyID()

typing = false 
msg = ""

names = ds_list_create()
msgs = ds_list_create()


//Inventory

item_int();

//Then put here global inventory init, slot width and slot height:

//ignore the error, its a custom script.
inventory_int(4,3);


//Just a variable value, ignore this:

last_stack = 0
last_slot = 0
last_id_item = 0
   
current_stack = 0
current_slot = 0
current_id_item = 0



hp = 100;
max_hp = 100;

mana = 100;
max_mana = 100;

//camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);
//camera_set_view_size([0],100,100)
//camera_get_view_width(view_camera[0]);
//vx = 500;
//vx = camera_get_view_x(view_camera[0]);
//camera_get_view_y(view_camera[0]);

//view_set_xport(0,-250)
//view_set_wport(0,300)
//Copy Paste code

#macro cam view_camera[0]
#macro view_w camera_get_view_width(view_camera[0])
#macro view_h camera_get_view_height(view_camera[0])
aspect_ratio = display_get_width()/display_get_height();

view_height= 720;
view_width=round(view_height*aspect_ratio);

if(view_width & 1) view_width++;
if(view_height & 1) view_height++;

max_window_scale = min(floor(display_get_width()/view_width),floor(display_get_height()/view_height));
if(view_height * max_window_scale == display_get_height())
    max_window_scale--;
    
window_scale = max_window_scale;

window_set_size(view_width*window_scale,view_height*window_scale);
alarm[0]=1;


surface_resize(application_surface,(view_width*window_scale),view_height*window_scale);


//view_set_xport(0,-700);


//view_
//view_set_xport(0,-180)
//view_wview[0] = 240;


// Click event on client side needs to spawn an object on server side, server host.