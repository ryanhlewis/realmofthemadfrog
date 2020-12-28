/// @description Insert description here
// You can write your code in this editor
with (instance_create(xprevious, yprevious, oExplosion))
    move_contact_solid(point_direction(other.x, other.y, other.xprevious, other.yprevious), 12);
  
  
  dead=true;



//instance_destroy();