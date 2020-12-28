#macro CMD_X		0
#macro CMD_Y		1
#macro CMD_NAME		2
#macro CMD_SPRITE	3
#macro CMD_DESTROY	4
#macro CMD_MYID		5
#macro CMD_ANGLE	6


buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, PACKET_ENTITY)
buffer_write(buffer, buffer_u8, argument1) // second command 
buffer_write(buffer, buffer_u32, argument2) // id of the entity 

switch (argument1) {
	case CMD_X:
		buffer_write(buffer, buffer_s16, argument3)
	break 
	
	case CMD_Y:
		buffer_write(buffer, buffer_s16, argument3)
	break 
	
	case CMD_NAME:
		buffer_write(buffer, buffer_string, argument3)
	break 
	
	case CMD_SPRITE:
		buffer_write(buffer, buffer_u16, argument3)
	break 
	
	case CMD_DESTROY:
		buffer_write(buffer, buffer_u8, argument3)
	break 
	
	case CMD_MYID:
		buffer_write(buffer, buffer_u8, argument3)
	break 
	
	case CMD_ANGLE:
		buffer_write(buffer, buffer_s16, argument3)
	break 
}

network_send_packet(argument0, buffer, buffer_tell(buffer))