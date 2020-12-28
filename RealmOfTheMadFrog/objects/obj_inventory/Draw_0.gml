
//Now you can draw Inventory here:

//draw_panel(spr_background,0,5,5,__view_get( e__VW.WView, 0 )-10,__view_get( e__VW.HView, 0 )-10,32)

//draw_text(270,40,string_hash_to_newline("Key Q: Add random Item#Key W: Clear Inventory#Key E: Save Inventory#Key R: Load Inventory#Key T: Sort Inventory#Key Y: Clear a Item from Selecting Slot#Key U: Delete Item by Stack Amount#Key I: Drop a Item#Key O: Find Item on Inventory#Key P: Run the script of item with effect#Key A: Exchange Items from #       'ItemOverMouse' to Selecting"));


//draw_text(60,80,string_hash_to_newline("Inventory"));
inventory_draw(200,320,spr_slot, spr_slot,10,c_white);



var id_last = inventory_read("ID",inventory_last_select());


//Read the script "item_int" for more information for item_id_read

if inventory_last_select() >= 0 and inventory_read("ID",inventory_last_select()) != -1{
draw_text(60+70,250,
string_hash_to_newline("#Selected Item Name: " + string(item_id_read(id_last,0)) +
"#Selected Item Stack: " + string(inventory_read("Stack",inventory_last_select())) + " / " + string(item_id_read(id_last,1)) +
"#Selected Item Description: " + string(item_id_read(id_last,5)))
);

draw_sprite_ext(item_id_read(id_last,2),image_index,60,250,4,4,0,c_white,1);
}



