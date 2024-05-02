extends RigidBody2D

const SPEED = 20000
const TURN_SPEED = 400

func _process(delta):
	print(Engine.get_frames_per_second())
	delta *= 20
	# Handle input for movement
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		input_vector.y = -1
	elif Input.is_action_pressed("ui_down"):
		input_vector.y = 1
	if input_vector.y != 0:
		if Input.is_action_pressed("ui_left"):
			input_vector.x = -0.6
		elif Input.is_action_pressed("ui_right"):
			input_vector.x = 0.6

	# Apply forces based on input
	var velocity = input_vector.rotated(rotation) * SPEED * delta
	linear_velocity = velocity

	# Apply torque for rotation
	var rotation_direction = input_vector.x
	angular_velocity = rotation_direction * TURN_SPEED * delta
