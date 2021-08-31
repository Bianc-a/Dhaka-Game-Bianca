extends Label
onready var save = load("res://save.gd")

var Coins = 0
var coin_count = []
func _ready():
	text = String(Coins)

func _on_coin_CoinCollected(event):
	Coins += 1
	coin_count.append(event.int)
	if event is InputEventKey and event.scancode == KEY_1:
		save.save_world()
	
