extends TextureRect

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		OS.exit_code = 0 # OK
		get_tree().quit()
	if Input.is_action_just_pressed("ui_menu_alt"):
		set_visible(!is_visible())

