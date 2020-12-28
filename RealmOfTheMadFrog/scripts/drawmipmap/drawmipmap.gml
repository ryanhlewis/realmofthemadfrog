var _x, _y, _s;
_x = argument0
_y = argument1
_s = argument2


draw_set_color(c_black)
draw_rectangle(_x,_y,_x+240,_y+250,0)

/*
with (obj_solid) {
draw_set_color(c_white)
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0)
}*/

//You gotta realize- clients cant see obj_server nor obj_player.
// It seems they cant even see obj_client
// So the server is just sending them sprites and positions.

//You gotta figure out how to display those sprites and positions.

with (obj_remote_entity) {
draw_set_color(c_white)
if(sprite_index == spr_goblin || sprite_index == spr_demon || sprite_index == spr_skeleton || sprite_index == spr_brownslime || sprite_index == spr_scaryskull || sprite_index == spr_greenslime)
draw_set_color(c_red)
if(obj_remote_entity.x <> room_width && obj_remote_entity.y <> room_height)
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0)
}


//Holy shit. Never- ever forget brackets again.
/*
with (en) {
draw_set_color(c_red)
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0)
}

//So enemies are server-side, need to find a way for client to see them on map.



/*
with (BrownSlime) {
draw_set_color(c_red)
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0)
}

with (ScarySkull) {
draw_set_color(c_red)
draw_rectangle(_x+x/_s-sprite_width/(2*_s),_y+y/_s-sprite_width/(2*_s),_x+x/_s+sprite_width/(2*_s),_y+y/_s+sprite_width/(2*_s),0)
}*/