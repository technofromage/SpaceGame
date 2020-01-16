extends PopupPanel
var is_open=false

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		if is_open:
			close()
		else:
			open()
  
func open():
	popup()
	globals.is_movement_locked=true

func close():
	hide()
	globals.is_movement_locked=false