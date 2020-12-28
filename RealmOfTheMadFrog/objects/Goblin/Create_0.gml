// Movement speed
h = 0;
v = 0;

// Movement Vars //////////////////////////////////////////////////////////////

// Adjust THIS to adjust overall player speed
m = 1;

// Acceleration + friction
accel = 0.8  * m;
fric  = 0.4  * m;

// Max movement speeds
maxSpd = 3.0 * m;

///////////////////////////////////////////////////////////////////////////////

// State Info /////////////////////////////////////////////////////////////////

facing = choose(1, -1);

// For squash + stretch
xscale = 1;
yscale = 1;

///////////////////////////////////////////////////////////////////////////////

// Misc
moveDir  = 0;
moveTime = 0;
gunAng   = random(360);
alarm[0] = random_range(30, 120);




if (!instance_exists(obj_server) ) {
	instance_destroy();
}

dead=false;