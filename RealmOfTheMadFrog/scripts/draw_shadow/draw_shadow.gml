/// @description  draw_shadow(x,y,alpha,sprite,extrasize)
/// @param x
/// @param y
/// @param alpha
/// @param sprite
/// @param extrasize

// Script by Chinafreak (Hule Studios - www.hule-studios.com) 06.06.2014
// description:         draw circle shadow under the object.
// return:              nothing.


var _x = argument0
var _y = argument1
var _alpha = argument2
var spr_width = sprite_get_width(argument3)
var spr_height = sprite_get_height(argument3)
var extra = argument4

var pre_alpha;
pre_alpha = draw_get_alpha()
var pre_color;
pre_color = draw_get_color()

draw_set_color(c_black)
draw_set_alpha(_alpha)
draw_ellipse(_x-(spr_width+extra)/2,_y+spr_height-(spr_height+extra)/8,_x+(spr_width+extra)/2,_y+spr_height+(spr_height+extra)/8,false)
draw_set_alpha(pre_alpha)
draw_set_color(pre_color)
