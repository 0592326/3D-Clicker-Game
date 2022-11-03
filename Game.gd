extends Spatial

var player = preload("res://Player.tscn")

func _ready():
	get_tree().connect("network_peer_connected", self, "player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	Globals.connect("instance_player", self, "_instance_player")
	
	if get_tree().network_peer != null:
		Globals.emit_signal("toggle_network_setup", false)

func _instance_player(id):
	var player_instance = player.instance()
	player_instance.set_network_master(id)
	player_instance.name = str(id)
	print (player_instance.position)
	player_instance.global_transform.origin = Vector3(0, 15, 0)
	
	add_child(player_instance)

func _player_connected(id):
	print ("Player " + str(id) + " has connected")
	
	_instance_player(id)

func _player_disconnected(id):
	print("Player " + str(id) + " has disconnected")
	
	if has_node(str(id)):
		get_node(str(id)).queue_free()
