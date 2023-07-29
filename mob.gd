extends KinematicBody2D

var speed = 50 
var velocity = Vector2()
export var direction = -1 

func _ready():
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker. is_colliding() and is_on_floor():
	   direction = direction * -1
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = speed * direction 
	
	velocity = move_and_slide(velocity,Vector2.UP)
	if direction == 1:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false

func _on_top_body_entered(body):
	if body.get_name() == "bullet":
		$AnimatedSprite.play("squash")
		speed = 0 

func _on_side_damage_body_entered(body):
	get_tree().change_scene("res://game over.tscn")
