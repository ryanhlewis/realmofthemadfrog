// Draw sprite depending on player state
switch (state) {
    case IDLE: 
        image_speed = 0.1;
        sprite_index = sPlayerIdle;
    break;
    
    case RUN: 
        image_speed = 0.5; 
        sprite_index = sPlayerRun;
    break;
}

// Line to mouse
/*
draw_set_alpha(0.25);
draw_line_width(x, y, mouse_x, mouse_y, 4);
draw_set_alpha(1);
*/

// Draw particle trail
//TrailDraw(trail,w1,w2,c1,c2,image_alpha, image_alpha);

// Draw player
draw_sprite_ext(sprite_index, image_index, x, y, facing * xscale, yscale, 0, c_white, image_alpha);

// Draw gun
if (gun != -1)
    draw_sprite_ext(sGun, gun, x + lengthdir_x(4, point_direction(x, y, mouse_x, mouse_y)), y + 4 + lengthdir_y(4, point_direction(x, y, mouse_x, mouse_y)), xscale, facing, point_direction(x, y, mouse_x, mouse_y), c_white, 1);

// Draw cursor
draw_sprite_ext(sCursor, -1, mouse_x, mouse_y, 1, 1, point_direction(x, y, mouse_x, mouse_y) + 45, c_white, 1);


