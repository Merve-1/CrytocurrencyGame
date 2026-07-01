extends CharacterBody2D
var speed = 300
var bullet_scene = load("res://scenes/bullet.tscn")
@onready var bullet_container = $RocketContainer
func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed 
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0),screen_size)
	move_and_slide()	
func shoot():
	var bullet_instance = bullet_scene.instantiate()
	bullet_container.add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.global_position.x +=50 
