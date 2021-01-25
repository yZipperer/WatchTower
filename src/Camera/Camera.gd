extends KinematicBody2D


onready var camera = $RemoteTransform2D

#func _physics_process(delta):
#	#var speed = 40
#	#var position = Vector2(speed * delta, 0)
#	if Input.is_action_just_pressed("ui_down"):
#		camera.position.y += 25
#		print('elho')
#	elif Input.is_action_just_pressed("ui_up"):
#		camera.position.y += -25
#		print('elho')
#	elif Input.is_action_just_pressed("ui_right"):
#		camera.position.x += 25
#		print('elho')
#	elif Input.is_action_just_pressed("ui_left"):
#		camera.position.x += -25
#		print('elho')

const acceleration = 1500
const max_speed = 300
const friction = 500

var roll_vector = Vector2.ZERO
var velocity = Vector2.ZERO


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	velocity = move_and_slide(velocity)

func _unhandled_input(event):
	# Wheel Up Event
	if event.is_action_pressed("zoom_in"):
		print("zoom in")
		_zoom_camera(-1)
	# Wheel Down Event
	elif event.is_action_pressed("zoom_out"):
		print("zoom out")
		_zoom_camera(1)

# Zoom Camera
func _zoom_camera(dir):
	camera.zoom += Vector2(0.1, 0.1) * dir
