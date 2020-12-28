// Explode + destroy self
with (instance_create(xprevious, yprevious, oEnemyExplosion))
    move_contact_solid(point_direction(other.x, other.y, other.xprevious, other.yprevious), 12);
    
//instance_destroy();
dead=true;
