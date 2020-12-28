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

