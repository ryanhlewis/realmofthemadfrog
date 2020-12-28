// Actual collision checks + movement
var i;

// Vertical
for (i = 0; i < abs(v); ++i) {
    // UP slope
    if (place_meeting(x, y + sign(v), oParSolid) && !place_meeting(x - 1, y + sign(v), oParSolid))
        --x;
    
    if (place_meeting(x, y + sign(v), oParSolid) && !place_meeting(x + 1, y + sign(v), oParSolid))
        ++x;

    if (!place_meeting(x, y + sign(v), oParSolid))
        y += sign(v);
    else {
        v = 0;
        break;
    }
}

// Horizontal
for (i = 0; i < abs(h); ++i) { 
    // Slopes
    if (place_meeting(x + sign(h), y, oParSolid) && !place_meeting(x + sign(h), y - 1, oParSolid))
        --y;
    
    if (place_meeting(x + sign(h), y, oParSolid) && !place_meeting(x + sign(h), y + 1, oParSolid))
        ++y;
         
    if (!place_meeting(x + sign(h), y, oParSolid))
        x += sign(h); 
    else {
        h = 0;
        break;
    }
}

///////////////////////////////////////////////////////////////////////////////


// Update particle trail
ydrift = -sign(v);
xdrift = -sign(h);

if (state == IDLE) {
    ydrift = random_range(-2, 2);
    xdrift = -5 * facing;
}
/*
TrailUpdate(trail, x, y);
TrailDrift(trail, xdrift, ydrift);8
TrailScatter(trail, xscatter, yscatter);
*/
