extends Camera


export var sensitivity_vert = 0.001

func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#vertical camera rotation
	if !globals.is_movement_locked:
		var rotation_vert
		rotation_vert=get_viewport().get_mouse_position().y-300
		rotate(Vector3(1,0,0),-rotation_vert*sensitivity_vert)