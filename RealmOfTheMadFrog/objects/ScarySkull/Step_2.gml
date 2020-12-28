// Actual collision checks + movement
var i;

// Vertical
for (i = 0; i < abs(v); ++i) {
    // UP slope
    if (place_meeting(x, y + sign(v), obj_solid) && !place_meeting(x - 1, y + sign(v), obj_solid))
        --x;
    
    if (place_meeting(x, y + sign(v), obj_solid) && !place_meeting(x + 1, y + sign(v), obj_solid))
        ++x;

    if (!place_meeting(x, y + sign(v), obj_solid))
        y += sign(v);
    else {
        v = 0;
        break;
    }
}

// Horizontal
for (i = 0; i < abs(h); ++i) { 
    // Slopes
    if (place_meeting(x + sign(h), y, obj_solid) && !place_meeting(x + sign(h), y - 1, obj_solid))
        --y;
    
    if (place_meeting(x + sign(h), y, obj_solid) && !place_meeting(x + sign(h), y + 1, obj_solid))
        ++y;
         
    if (!place_meeting(x + sign(h), y, obj_solid))
        x += sign(h); 
    else {
        h = 0;
        break;
    }
}

///////////////////////////////////////////////////////////////////////////////

// Stay away from walls
if (place_meeting(x + 1, y, obj_solid)) {
    moveTime = random_range(3, 9);
    moveDir  = 180 + random_range(-45, 45);
}

if (place_meeting(x - 1, y, obj_solid)) {
    moveTime = random_range(3, 9);
    moveDir  = 0 + random_range(-45, 45);
}

if (place_meeting(x, y - 1, obj_solid)) {
    moveTime = random_range(3, 9);
    moveDir  = 270 + random_range(-45, 45);
}

if (place_meeting(x, y + 1, obj_solid)) {
    moveTime = random_range(3, 9);
    moveDir  = 90 + random_range(-45, 45);
}
    

