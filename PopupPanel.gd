extends PopupPanel
var is_open=false

func _process(delta):
	if Input.is_action_just_pressed("ui_textOpen"):
		if is_open:
			close()
		else:
			open()
	if Input.is_action_just_pressed("ui_accept"):#manage input
		pass
  
func open():
	popup()
	globals.is_movement_locked=true
	is_open=true

func close():
	hide()
	globals.is_movement_locked=false
	is_open=false