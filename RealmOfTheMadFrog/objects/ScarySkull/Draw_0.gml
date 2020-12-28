// Draw sprite depending on player state
if (h == 0 && v == 0) {
    image_speed = 0.1;
    sprite_index = spr_scaryskull;
	if(image_index > 4)
	image_index = 1;
	
} else {
    image_speed = 0.5; 
    sprite_index = spr_scaryskull;
	if(image_index < 3)
	image_index = 3;
}

// Draw enemy
draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);
// Draw gun
//draw_sprite_ext(sEnemyGun, -1, x + lengthdir_x(4, gunAng), y + 4 + lengthdir_y(4, gunAng), xscale, facing, gunAng, c_white, 1);

