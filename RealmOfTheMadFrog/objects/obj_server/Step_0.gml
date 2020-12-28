/// @description Insert description here
// You can write your code in this editor
global.sockets = ds_list_size(sockets);

for (var i = 0;i < instance_number(obj_player); i++) {
	var pl = instance_find(obj_player, i) 
	for (var s = 0; s < ds_list_size(sockets) ; s++) {
		var so = ds_list_find_value(sockets, s)
		
		//Send player entity to all sockets
		SendRemoteEntity(so, CMD_X, pl.id, pl.x)
		SendRemoteEntity(so, CMD_Y, pl.id, pl.y)	
		SendRemoteEntity(so, CMD_SPRITE, pl.id, pl.sprite_index)	
		SendRemoteEntity(so, CMD_MYID, pl.id, pl.my_id)	
		//show_debug_message(string(so))
		
		
		//Delete wrong enemy positions.

		// Made detection system, 
		// if( cant find server i.e not host, delete enemies on create)
		
		//For host client, he has to make enemies invis to see server side positions.
		//I could probably get around this- send sprites to everyone but him.
		//Meh, would mess up the thing we have going on here.
		
		
		/*if(s==0)
		if(instance_exists(obj_enemy))
		with obj_enemy
		image_alpha = 0;
		*/
		
		
		//Must delete remote entity on entity death.
	//	SendRemoteEntity(so, CMD_DESTROY, p.id, 0)
		
		//Send Enemy projectiles to all sockets
		for (var enemycount1 = 0; enemycount1 < instance_number(oEnemyBullet);enemycount1++) {
		var ep = instance_find(oEnemyBullet, enemycount1)
		SendRemoteEntity(so, CMD_X, ep.id, ep.x)
		SendRemoteEntity(so, CMD_Y, ep.id, ep.y)
		SendRemoteEntity(so, CMD_SPRITE, ep.id, ep.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, ep.id, ep.image_angle)	
		
		//Must delete for all clients before destroying.
		
		if(ep.dead) { //Iterate through all sockets and CMD_Destroy it, then instance_destroy.
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
				SendRemoteEntity(so, CMD_DESTROY, ep.id, 0)
			}
			with (ep) {
				instance_destroy()
			}
		}
		//if(!instance_exists(oEnemyBullet))
		//SendRemoteEntity(so, CMD_DESTROY, ep.id, 0)
		}
		
		//Send projectiles to all sockets
		//Since projectiles from players arent simply server-side, gonna have to put them in CLIENT
		
		//Projectiles are dealt with server-side, like movement.
		for (var enemycount2 = 0; enemycount2 < instance_number(oBullet);enemycount2++) {
		var pr = instance_find(oBullet, enemycount2)
		SendRemoteEntity(so, CMD_X, pr.id, pr.x)
		SendRemoteEntity(so, CMD_Y, pr.id, pr.y)
		SendRemoteEntity(so, CMD_SPRITE, pr.id, pr.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, pr.id, pr.image_angle)

		if(pr.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, pr.id, 0)
			}
			with (pr) {
				instance_destroy()
			}
			
		}
		}
		
		//Send explosion projectile to all sockets
		for (var enemycount2 = 0; enemycount2 < instance_number(oExplosion);enemycount2++) {
		var pr = instance_find(oExplosion, enemycount2)
		SendRemoteEntity(so, CMD_X, pr.id, pr.x)
		SendRemoteEntity(so, CMD_Y, pr.id, pr.y)
		SendRemoteEntity(so, CMD_SPRITE, pr.id, pr.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, pr.id, pr.image_angle)

		if(pr.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, pr.id, 0)
			}
			with (pr) {
				instance_destroy()
			}
		}
		}
		
		
		//Send enemy explosion projectile to all sockets
		for (var enemycount2 = 0; enemycount2 < instance_number(oEnemyExplosion);enemycount2++) {
		var pr = instance_find(oEnemyExplosion, enemycount2)
		SendRemoteEntity(so, CMD_X, pr.id, pr.x)
		SendRemoteEntity(so, CMD_Y, pr.id, pr.y)
		SendRemoteEntity(so, CMD_SPRITE, pr.id, pr.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, pr.id, pr.image_angle)

		if(pr.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, pr.id, 0)
			}
			with (pr) {
				instance_destroy()
			}
		}
		}
		
		
		//Send enemy blood to all sockets
		for (var enemycount2 = 0; enemycount2 < instance_number(oEnemyBlood);enemycount2++) {
		var pr = instance_find(oEnemyBlood, enemycount2)
		SendRemoteEntity(so, CMD_X, pr.id, pr.x)
		SendRemoteEntity(so, CMD_Y, pr.id, pr.y)
		SendRemoteEntity(so, CMD_SPRITE, pr.id, pr.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, pr.id, pr.image_angle)

		if(pr.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, pr.id, 0)
			}
			with (pr) {
				instance_destroy()
			}
		}
		}
		
		//Send player blood to all sockets
		for (var enemycount2 = 0; enemycount2 < instance_number(oBlood);enemycount2++) {
		var pr = instance_find(oBlood, enemycount2)
		SendRemoteEntity(so, CMD_X, pr.id, pr.x)
		SendRemoteEntity(so, CMD_Y, pr.id, pr.y)
		SendRemoteEntity(so, CMD_SPRITE, pr.id, pr.sprite_index)	
		SendRemoteEntity(so, CMD_ANGLE, pr.id, pr.image_angle)

		if(pr.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, pr.id, 0)
			}
			with (pr) {
				instance_destroy()
			}
		}
		}
		
		
			
		//Send enemy entities to all sockets
		for (var enemycount = 0; enemycount < instance_number(obj_enemy);enemycount++) {
		var en = instance_find(obj_enemy, enemycount)
		SendRemoteEntity(so, CMD_X, en.id, en.x)
		SendRemoteEntity(so, CMD_Y, en.id, en.y)
		SendRemoteEntity(so, CMD_SPRITE, en.id, en.sprite_index)
		
		if(en.dead) {
			for (var s = 0; s < ds_list_size(sockets) ; s++) {
				var so = ds_list_find_value(sockets, s)
			SendRemoteEntity(so, CMD_DESTROY, en.id, 0)
			}
			with (en) {
				instance_destroy()
			}
		}
		//SendRemoteEntity(so, CMD_SPRITE, en.id, en.sprite_index)	
		//show_debug_message("EnemyCount = " + string(enemycount))
		}
	
	
	
	}
	
}


// 960,720

//Viewport settings
