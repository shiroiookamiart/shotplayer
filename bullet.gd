extends CharacterBody2D

var speed = 750

func start(_position, _direction):
	rotation = _direction
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		var obj = collision.get_collider()
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
		if obj.is_in_group("Wall"):
			obj.init_efect()
			
func _on_visibility_screen_exited():
	queue_free()
	pass # Replace with function body.
