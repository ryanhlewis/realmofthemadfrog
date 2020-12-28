var i;

for (i = 0; i < 32; ++i) 
    instance_create(xprevious + random_range(-12, 12), yprevious + random_range(-12, 12), oBlood);
    
instance_destroy();

