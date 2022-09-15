extends Button

export (String) var Item
export (int) var Price


func _ready():
	pass

func _on_pressed():
	if Globals.playerScore >= Price:
		Globals.playerScore -= Price
		print (Price)

	#CODE HERE TO SPAWN IN UPGRADES like turrets, health, ammo.
