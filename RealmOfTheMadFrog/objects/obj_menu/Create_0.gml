picking_name = true 
server_list = false
menu = ["Create Game", "Join Game",  "LAN Games", "Exit"]

cur_index = 0

global.ip = "127.0.0.1"
global.name = "Player"
keyboard_string = ""

//
brodcast_server = network_create_server(network_socket_udp, 4501, 100)

if brodcast_server < 0 {
	show_message("Could not creatre a brodcast srever, try join a game manually")
}

//keep data of each running srever 
s_ips = ds_list_create()
s_names = ds_list_create()
s_clients = ds_list_create()
s_maxclients = ds_list_create()
s_descriptions = ds_list_create()
