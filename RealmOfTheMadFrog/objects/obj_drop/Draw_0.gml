var yy;
yy = sin((current_time-r)/200)*2

draw_shadow(x,y-2,0.25,sprite,yy)
draw_sprite(sprite,image_index,x-sprite_get_width(sprite)/2,y-sprite_get_height(sprite)/2+yy)


