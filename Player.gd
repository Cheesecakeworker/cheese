extends CharacterBody2D

@export var bullet: Array[PackedScene] = []

func _ready():

sync_to_physics(false)
const SPEED= 30
const gravity= 30
var Jumpforce= -600
var coin = 0
var Max_Speed= 150

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		Global.direction = "right"
		velocity.x += SPEED
		$AnimatedSprite2D.flip_h = true
		if velocity.x >= Max_Speed:
			velocity.x = Max_Speed
	elif Input.is_action_pressed("ui_left"):
		Global.direction = "left"
		velocity.x -= SPEED
		$AnimatedSprite2D.flip_h = false
		if velocity.x <= -150:
			velocity.x = -150
	else:
		velocity.x = 0
	
	velocity.y += gravity
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = Jumpforce
		$jumpsound.play()
	if Input.is_action_just_pressed("shoot"):
		shoot()
		$"shoot sound".play()
	set_velocity(velocity)
	set_up_direction(Vector2.UP)
	move_and_slide()
	velocity = velocity


