// Declare Temp Variables /////////////////////////////////////////////////////
var kLeft, kRight, kUp, kDown, tempAccel, tempFric;
///////////////////////////////////////////////////////////////////////////////

// Input //////////////////////////////////////////////////////////////////////

kLeft        = keyboard_check(ord("A"));
kRight       = keyboard_check(ord("D"));
kUp          = keyboard_check(ord("W"));
kDown        = keyboard_check(ord("S"));

///////////////////////////////////////////////////////////////////////////////

// Left 
if (kLeft && !kRight) {
    if (h > 0)
        h = Approach(h, 0, fric);   
    h = Approach(h, -maxSpd, accel);
        
    state = RUN;
}

// Right
if (kRight && !kLeft) {
    if (h < 0)
        h = Approach(h, 0, fric);   
    h = Approach(h, maxSpd, accel);
        
    state = RUN;
}

// Up
if (kUp && !kDown) {
    if (v > 0)
        v = Approach(v, 0, fric);   
    v = Approach(v, -maxSpd, accel);
        
    state = RUN;
}

// Down
if (kDown && !kUp) {
    if (v < 0)
        v = Approach(v, 0, fric);   
    v = Approach(v, maxSpd, accel);
        
    state = RUN;
}

// Friction
if (!kRight && !kLeft)
    h = Approach(h, 0, fric);
if (!kDown && !kUp)
    v = Approach(v, 0, fric);

// Standing
if (!kRight && !kLeft && !kDown && !kUp)
    state = IDLE;
    
// Face mouse position
if (mouse_x >= x)
    facing = 1;
else
    facing = -1; 

// Shoot //////////////////////////////////////////////////////////////////////
if (gun != -1) {
    if (canShoot) {
        if (mouse_check_button(mb_left)) {
            // Bullet creation + aim at mouse
            with (instance_create(x + lengthdir_x(8, point_direction(x, y, mouse_x, mouse_y)), y + 4 + lengthdir_y(8, point_direction(x, y, mouse_x, mouse_y)), oBullet))
                direction = point_direction(other.x, other.y, mouse_x, mouse_y) + random_range(-2, 2);    
            
            // Extra shotgun bullets
            if (gun == 2) {
                var i;
                for (i = 0; i < 4; ++i)
                    with (instance_create(x + lengthdir_x(8, point_direction(x, y, mouse_x, mouse_y)), y + 4 + lengthdir_y(8, point_direction(x, y, mouse_x, mouse_y)), oBullet))
                        direction = point_direction(other.x, other.y, mouse_x, mouse_y) + random_range(-15, 15);  
            };    
                
            // Distort player sprite
            if (choose(0, 1)) {
                xscale = 1.3;
                yscale = 0.7;
            } else {
                yscale = 1.3;
                xscale = 0.7;        
            }
            
            // Delay fire
            switch(gun) {
                case 0:
                    alarm[0] = 10;
                break;
                case 1:
                    alarm[0] = 3;
                break;
                case 2:
                    alarm[0] = 20;
                break;
            }
            
            canShoot = false;
        }
    } 
}

if (mouse_check_button_pressed(mb_right)) {
    if (gun == -1) {
        with (instance_place(x, y, oGunPickup)) {
            other.gun = image_index;
            instance_destroy();
        }
    } else {
        var oldGun = gun;
        
        // Pickup new gun
        if (instance_place(x, y, oGunPickup)) {
            with (instance_place(x, y, oGunPickup)) {
                other.gun = image_index;
                instance_destroy();
            }
        } else {
            // no gun
            gun = -1;
        }  
        
        // Throw old gun
        with (instance_create(x, y, oGunPickup)) {
            image_index = oldGun;
            direction   = point_direction(other.x, other.y, mouse_x, mouse_y);
            speed       = 14;
        }  
    }
}

// Adjust scaling after squash + stretch
xscale = Approach(xscale, 1, 0.05);
yscale = Approach(yscale, 1, 0.05);



