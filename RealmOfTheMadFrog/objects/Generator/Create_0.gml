rx=room_width div 64;
ry=room_height div 64;

cells=rx*ry;

units=0;
seed=get_string("Seed plz.", "potato");
grid=ds_grid_create(rx, ry);
ds_grid_set_region(grid, 0, 0, rx, ry, noone);
generate_map(seed, 0.15);

