// Rotate when thrown
image_angle += (3 * speed) * dir;

// Friction
speed = Approach(speed, 0, 0.25);

