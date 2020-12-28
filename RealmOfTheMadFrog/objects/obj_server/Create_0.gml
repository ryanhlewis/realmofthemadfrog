//inialize server 
#macro PORT		45000
#macro MAX_CLIENTS	4

//characters 
#macro CHAR_WIZZARD_M	0
#macro CHAR_WIZZARD_F	1
#macro CHAR_KNIGHT_M	2
#macro CHAR_KNIGHT_F	3
#macro CHAR_ELF_M		4
#macro CHAR_ELF_F		5


//packets 
#macro PACKET_KEY		0
#macro PACKET_ENTITY	1
#macro PACKET_NAME		2
#macro PACKET_CHARACTER	3
#macro PACKET_PLAY		4
#macro PACKET_PICK		5
#macro PACKET_MYID		6
#macro PACKET_CHAT		7
#macro PACKET_POS       8

server_name = "My Server"
server_desc = "Playing for fun."

brodcast_socket = network_create_socket_ext(network_socket_udp, 4501)
server = network_create_server(network_socket_tcp, PORT, MAX_CLIENTS)
buffer = buffer_create(16384, buffer_grow, 1)
brodcast_buffer = buffer_create(1000, buffer_grow, 1)


clients = ds_map_create()
sockets = ds_list_create()



ava_chars = ds_list_create()
ds_list_add(ava_chars, CHAR_WIZZARD_M)
ds_list_add(ava_chars, CHAR_WIZZARD_F)
ds_list_add(ava_chars, CHAR_KNIGHT_M)
ds_list_add(ava_chars, CHAR_KNIGHT_F)
ds_list_add(ava_chars, CHAR_ELF_M)
ds_list_add(ava_chars, CHAR_ELF_F)

alarm[0] = room_speed