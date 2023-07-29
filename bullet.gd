extends Area2D

var speed = 2000

onready var bullet = $Sprite

func _physics_process(delta):
	
	if Global.direction == "left":
		position -= transform.x * speed * delta
		
	elif Global.direction == "right":
		position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
	

func _ready():
	pass

func _on_VisibilityNotifier2D_screen_exited():
	pass 

func _on_bullet_body_entered(body):
	
	if body.name == "TileMap":
		queue_free()
	elif body.is_in_group("Mob"):
		queue_free()
		body.queue_free()
	pass # Replace with function body.

func _on_mob_damage():
	pass # Replace with function body.
