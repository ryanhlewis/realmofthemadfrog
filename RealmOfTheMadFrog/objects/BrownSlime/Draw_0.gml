// Draw sprite depending on player state

    image_speed = 0.3;
    sprite_index = spr_brownslime;


// Draw enemy
draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);
// Draw gun
//draw_sprite_ext(sEnemyGun, -1, x + lengthdir_x(4, gunAng), y + 4 + lengthdir_y(4, gunAng), xscale, facing, gunAng, c_white, 1);

