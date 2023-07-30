extends CharacterBody2D

var speed = 50 

@export var direction = -1 

func _ready():
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):
	
	if is_on_wall() or not $floor_checker. is_colliding() and is_on_floor():
		direction = direction * -1
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	
	velocity.y += 20
	
	velocity.x = speed * direction 
	
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false

func _on_top_body_entered(body):
	if body.get_name() == "bullet":
		$AnimatedSprite2D.play("squash")
		speed = 0 

func _on_side_damage_body_entered(body):
	get_tree().change_scene_to_file("res://game over.tscn")
