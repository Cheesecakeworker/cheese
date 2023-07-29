extends CanvasLayer

var life = 1


func _ready():
	$life.text = String(life)

func _physics_process(delta):
	if life == 0:
		get_tree().change_scene("res://World.tscn")


func _on_mob_damage():
	life = life - 1
	
	_ready()



