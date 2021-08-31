extends Area

signal CoinCollected
var score = 0 
var Coin_Count = 0

func _ready():
	pass
func _physics_process(delta):
	rotate_y(deg2rad(3))



func _on_Timer_timeout():
	emit_signal("CoinCollected")
	queue_free()


func _on_coin_body_entered(body):
	if body.name == "player":
		
		$Timer.start()
