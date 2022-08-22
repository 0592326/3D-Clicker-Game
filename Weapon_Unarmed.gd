extends Spatial

const DAMAGE = 1

var is_weapon_enabled = true

var player_node = null

var ammo_in_weapon = 1
var spare_ammo = 1
const AMMO_IN_MAG = 1

var globals

func _ready():
	print ("idk")
	pass
	globals = get_node("/root/Globals")

func fire_weapon():
	print ("clicked")
	var area = $Area
	var bodies = area.get_overlapping_bodies()
	for body in bodies:
		print ("CLICKED")
		if body == player_node:
			continue

		if body.has_method("bullet_hit"):
			body.bullet_hit(DAMAGE, area.global_transform)

	player_node.create_sound("click_1", self.global_transform.origin)


func reload_weapon():
	return false

func reset_weapon():
	ammo_in_weapon = 1
	spare_ammo = 1

func create_sound(sound_name, position=null):
	globals.play_sound(sound_name, false, position)
