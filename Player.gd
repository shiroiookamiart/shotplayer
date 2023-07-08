extends CharacterBody2D

var bullet := preload("res://bullet.tscn")
var speed := 200

func get_input():
	var input_dir = Input.get_axis("backward", "forward")
	velocity = transform.x * input_dir * speed
	if Input.is_action_just_pressed("mouse_click"):
		shoot()

func shoot():
	var b = bullet.instantiate()
	b.start($Position.global_position, rotation)
	get_tree().root.add_child(b)

func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	# Don't move if too close to the mouse pointer.
	if dir.length() > 5:
		rotation = dir.angle()
		move_and_slide()
	pass

