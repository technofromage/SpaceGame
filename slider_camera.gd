extends HSlider

func _on_slider_camera_value_changed(value):
	print(value)
	globals.camera_type=value


func _on_slider_camera_mouse_entered():
	grab_click_focus() # Replace with function body.
	print("test")
