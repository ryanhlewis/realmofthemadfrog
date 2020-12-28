/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_font(fnt_small)
var xpos = x-camera_get_view_x(view_camera[0])
var ypos = y-camera_get_view_y(view_camera[0])

//easy workaround
// Drawing to player doesn't work, draw to camera.
//draw_text(obj_remote_entity.x+10, obj_remote_entity.y+10, name)


draw_text(xpos/**2*/+200, ypos/**2*/+100, name)
draw_set_halign(fa_left)