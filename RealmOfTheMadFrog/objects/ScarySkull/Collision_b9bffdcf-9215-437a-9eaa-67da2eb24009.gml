// Move away from other enemies
h += lengthdir_x(accel, point_direction(other.x, other.y, x, y) + random_range(-10, 10));
v += lengthdir_y(accel, point_direction(other.x, other.y, x, y) + random_range(-10, 10));


