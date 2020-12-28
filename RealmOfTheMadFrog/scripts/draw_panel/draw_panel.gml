/// @description  draw_panel(sprite, index, x, y, width, height, size);
/// @param sprite
/// @param  index
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  size


// Script by Chinafreak (Hule Studios - www.hule-studios.com) 06.06.2014
// description:         draw a panel with difference size.
// return:              Nothing.

var xx, yy, w, h, sw, sh, iw, ih, sid, ii, size;

xx = argument2;
yy = argument3;
w  = argument4;
h  = argument5;
ii = argument1

sid = argument0;
size = argument6;
sw = sprite_get_width(sid);
sh = sprite_get_height(sid);
iw = sw-size*2;
ih = sh-size*2;

draw_sprite_part(sid, ii, 0, 0, size, size, xx, yy);
draw_sprite_part(sid, ii, sw-size, 0, size, size, xx + w-size, yy);
draw_sprite_part(sid, ii, 0, sh-size, size, size, xx, yy + h-size);
draw_sprite_part(sid, ii, sw-size, sh-size, size, size, xx + w-size, yy + h-size);

draw_sprite_part_ext(sid, ii, size, size, iw, ih, xx + size, yy +  size,(w-size*2)/iw, (h-size*2)/ih, c_white, 1);
draw_sprite_part_ext(sid, ii, 0, size, size, 1, xx, yy +  size, 1, h-size*2, c_white, 1);
draw_sprite_part_ext(sid, ii, sw-size, size, size, 1, xx + w-size, yy +  size, 1, h-size*2, c_white, 1);
draw_sprite_part_ext(sid, ii, size, 0, 1, size, xx+size, yy, w-size*2, 1, c_white, 1);
draw_sprite_part_ext(sid, ii, size, sh-size, 1, size, xx+size, yy + h-size, w-size*2, 1, c_white, 1);
