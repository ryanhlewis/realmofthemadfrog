buffer_seek(buffer, buffer_seek_start, 0)
buffer_write(buffer, buffer_u8, PACKET_MYID)
network_send_packet(socket, buffer, buffer_tell(buffer))
