extends TextureRect

func _process(delta):
	if (Input.is_action_just_pressed("ui_map")):
		set_visible(!is_visible())
