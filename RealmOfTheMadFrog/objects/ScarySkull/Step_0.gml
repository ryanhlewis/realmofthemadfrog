// Walk
if (--moveTime > 0) {
    h += lengthdir_x(accel * 2, moveDir);
    v += lengthdir_y(accel * 2, moveDir);
}

// Limit movemetn speed
h = clamp(h, -maxSpd, maxSpd);
v = clamp(v, -maxSpd, maxSpd);

// Friction
h = Approach(h, 0, fric);
v = Approach(v, 0, fric);

//Server

// All server side code I've tried to put in obj_server

// Need to somehow direct enemy movement from Server Script.

// So the first client creates the enemies and hosts their information and coords.

// (if condition) if socket != 1, instance_remove obj_enemy. This should hopefully work.