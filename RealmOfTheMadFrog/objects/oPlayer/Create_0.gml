// Movement speed
h = 0;
v = 0;

// Camera (later versions) ////////////////////////////////////////////////////
if (!instance_exists(oCamera))
    instance_create(x, y, oCamera);
    
// Initial camera position  
/*
__view_set( e__VW.XView, 0, max(0, min(x - __view_get( e__VW.WPort, 0 ) * 0.5, room_width  - __view_get( e__VW.WPort, 0 ))) );
__view_set( e__VW.YView, 0, max(0, min(y - __view_get( e__VW.HPort, 0 ) * 0.5 - 16, room_height - __view_get( e__VW.HPort, 0 ))) );
*/
// Movement Vars //////////////////////////////////////////////////////////////

// Adjust THIS to adjust overall player speed
m = 1;

// Acceleration + friction
accel = 1.0  * m;
fric  = 2.0  * m;

// Max movement speeds
maxSpd = 6.5 * m;

///////////////////////////////////////////////////////////////////////////////

// State Info /////////////////////////////////////////////////////////////////
// States
IDLE     = 10;
RUN      = 11;

// Initialize properties
state  = IDLE;

if (mouse_x > x)
    facing = 1;
else
    facing = -1;

// For squash + stretch
xscale = 1;
yscale = 1;

canShoot = true;

// Current gun
gun = 0; // pistol, machine, shot (-1 -> NONE)

///////////////////////////////////////////////////////////////////////////////


length = 6; //4;
w1 = 3;
w2 = 5; //0;
c1 = c_white
c2 = c_white
a1 = 1;
a2 = 1;
xscatter = 0//6;
yscatter = 1;
xdrift = 0;
ydrift = 5;
/*
trail = TrailCreate(length, x, y);
*/

