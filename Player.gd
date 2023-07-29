extends KinematicBody2D

export (PackedScene) var Bullet

func _ready():
	set_sync_to_physics(false) 
#enum States {AIR = 1, FLOOR, WALL}
const SPEED= 30
const gravity= 30
var Jumpforce= -600
var coin = 0
var velocity = Vector2.ZERO
var Max_Speed= 150

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		Global.direction = "right"
		velocity.x += SPEED
		$AnimatedSprite.flip_h = true
		if velocity.x >= Max_Speed:
			velocity.x = Max_Speed
	elif Input.is_action_pressed("ui_left"):
		Global.direction = "left"
		velocity.x -= SPEED
		$AnimatedSprite.flip_h = false
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
	velocity = move_and_slide(velocity,Vector2.UP)


