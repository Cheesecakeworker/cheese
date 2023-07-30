extends CanvasLayer

var coin = 0

func _ready():
	$coins.text = (coin)

func _physics_process(delta):
	if coin == 99:
		get_tree().change_scene_to_file("res://win.tscn")

func _on_coin_collected():
	coin = coin + 1
	_ready()
