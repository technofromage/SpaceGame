extends Camera

export var key = KEY_1
export var sensitivity_vert = 0.001



func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if (self==get_viewport().get_camera()):
		get_viewport().warp_mouse(Vector2(500,300))
		var rotation_vert
		rotation_vert=get_viewport().get_mouse_position().y-300
		rotate_object_local(Vector3(1,0,0),-rotation_vert*sensitivity_vert)
		var rotation_horz
		rotation_horz=get_viewport().get_mouse_position().x-500
		rotate(Vector3(0,1,0),-rotation_horz*sensitivity_vert)
		
	if Input.is_key_pressed(key):
		make_current()