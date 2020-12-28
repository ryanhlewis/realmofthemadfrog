/// @description  void generate_map(String seed, double ratio);
/// @param String seed
/// @param  double ratio

var p=0, i=0, ratio=argument1;
for (i=1; i<=string_length(argument0); i++)
    p+=ord(string_char_at(argument0, i));

var xx, yy, xxLast, yyLast, type;
xxLast=-1;
yyLast=-1;



do {
    p=(p+1+units) mod 1000000000;
    xx=floor((p*p/1337)  mod rx);
    yy=floor((p*p/501)  mod ry);
    if (grid[# xx, yy]!=noone||(xx==xxLast&&yy==yyLast))
        continue;
    if ((p mod 3)==1)
        type=spr_rock;
    else
        type=spr_tree;
    grid[# xx, yy]=instance_create(xx*64, yy*64, SolidObject);
    grid[# xx, yy].sprite_index=type;
    units++;
    xxLast=xx;
    yyLast=yy;
} until(units/cells>ratio);


