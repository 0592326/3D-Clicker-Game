extends Spatial

var player_node

var DAMAGE = 30

var ammo_in_weapon = 1
var spare_ammo = 1

var is_weapon_enabled = false

func fire_weapon():
	var ray = $Ray_Cast3
	ray.force_raycast_update()

	if ray.is_colliding():
		var body = ray.get_collider()

		if body == player_node:
			pass
		elif body.has_method("bullet_hit"):
			body.bullet_hit(DAMAGE, ray.global_transform)

func unequip_weapon():
	is_weapon_enabled = false

func equip_weapon():
	is_weapon_enabled = true

func reload_weapon():
	return false

func reset_weapon():
	ammo_in_weapon = 1
	spare_ammo = 1
