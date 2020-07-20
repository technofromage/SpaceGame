extends Camera2D
var drawExtra = true
var room
var UIFont #this can be exported as a font for adding special fonts
func _ready():
	room=get_node("/root/SpaceGame/activeroom")
	var label = Label.new()
	UIFont = label.get_font("")

func _process(delta):#for the zoom
	if Input.is_action_pressed("ui_zoom"):
		set_scale(Vector2(1,1))
		set_zoom(Vector2(1,1))#these must be the same values
	else:
		set_scale(Vector2(2,2))
		set_zoom(Vector2(2,2))
	update()
