extends TextureRect

func _process(delta):
	var is_open=true;
	if Input.is_action_just_pressed("ui_menu_alt"):
		set_visible(!is_visible())
