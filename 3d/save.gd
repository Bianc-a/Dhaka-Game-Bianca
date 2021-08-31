extends Spatial
export(Script) var game_save_class
onready var gamesave2 = load("res://gamesave2.gd")

func verify_save():
	pass
	#var save_dict = {
		#"coin" : coin,
		#"CoinCount" : CoinCount,
		#}
		
func save_world():
	var new_save = game_save_class.new()
	new_save.player_pos = $Player.position
	new_save.coin_count = gamesave2.coin_count
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# Store the save dictionary as a new line in the save file.
		verify_save().store_line(to_json(node_data))
		
		ResourceSaver.save("res://gamesavedata/",new_save)
	#verify_save.close()
func load_world():
	pass
