//vspeed += 1;

// Friction
hspeed = Approach(hspeed, 0, 0.1);
vspeed = Approach(vspeed, 0, 0.1);

if (fade)
    image_alpha -= 0.1;
    
if (image_alpha < 0.25)
    dead=true;
	//instance_destroy();

