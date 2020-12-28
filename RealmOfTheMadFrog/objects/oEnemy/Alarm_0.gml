// Reset alarm
alarm[0] = random_range(20, 40);

// Search for player
if (instance_exists(obj_player)) {
    if (!collision_line(x, y, obj_player.x, obj_player.y, oParSolid, false, false)) {
        if (point_distance(x, y, obj_player.x, obj_player.y) >= 32) {
            if (random_range(10, 30) > 15) {
                // Bullet creation + aim at mouse
                with (instance_create(x + lengthdir_x(10, gunAng), y + 4 + lengthdir_y(10, gunAng), oEnemyBullet)) 
                    direction = other.gunAng + random_range(-4, 4);
        
            // Aim at player + reset
            gunAng = point_direction(x, y, obj_player.x, obj_player.y);
            alarm[0] = random_range(15, 20);
        } else {
            // Move away ish from player
            moveDir = point_direction(x, y, obj_player.x, obj_player.y) + random_range(90, 180);
            
            // Set speed from direction
            h = lengthdir_x(accel, moveDir);
            v = lengthdir_y(accel, moveDir);
        
            // How far he will move
            moveTime = random_range(10, 20);
            gunAng   = point_direction(x, y, obj_player.x, obj_player.y);
        }
    } else {
        // Move towards ish the player
        moveDir = point_direction(x, y, obj_player.x, obj_player.y) + random_range(-10, 10);

        // Set speed from direction
        h = lengthdir_x(accel, moveDir);
        v = lengthdir_y(accel, moveDir);
        
        moveTime = random_range(40, 60);
        gunAng   = point_direction(x, y, obj_player.x, obj_player.y);
    }

    if (obj_player.x >= x)
        facing = 1;
    else
        facing = -1;
        
    } else if (random_range(10, 30) > 20) {
        // Move random
        moveDir = random(360);

        // Set speed from direction
        h += lengthdir_x(accel, moveDir);
        v += lengthdir_y(accel, moveDir);
        
        // Set move time + reset
        moveTime = random_range(10, 30);
        alarm[0] = moveTime + random_range(10, 40);

        // Face direction traveling
        if (sign(h) >= 0)
            facing = sign(h);
                    
        // Point gun in direction traveling
        gunAng = moveDir;

    }
} else if (random(100) > 85) {
    // Move randomly if NO player
    moveDir = random(360);
    h += lengthdir_x(accel, moveDir);
    v += lengthdir_y(accel, moveDir);
    moveTime = random_range(10, 30);
    alarm[0] = moveTime + random_range(10, 40);
    gunAng = moveDir;
    
    if (sign(h) >= 0)
        facing = sign(h);
}

