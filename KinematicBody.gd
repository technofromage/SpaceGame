extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 10
export var sensitivity_horz = 0.001




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		OS.exit_code = 0 # OK
		get_tree().quit()

func _physics_process(delta):
	if !globals.is_movement_locked:
		#walk around-movement
		var direction: Vector3;
		direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		direction.z = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		if abs(direction.x) == 1 and abs(direction.z) == 1:
			direction = direction.normalized()
		var movement = speed * direction * delta
		translate(movement)
		
		#horizontal camera rotation
		#note that the up vert rotation is handeled by the camera object
		var rotation_horz
		get_viewport().warp_mouse(Vector2(500,300))
		rotation_horz=get_viewport().get_mouse_position().x-500
		rotate_y(-rotation_horz*sensitivity_horz)
