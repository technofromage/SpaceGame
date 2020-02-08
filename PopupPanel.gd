extends Popup
var is_open=true
var history
var text
var functionsG=["forward","back","left","right"]
var functionsR=["go","turn"]

func _ready():
	history=get_child(1)#where the previous commands go
	text=get_child(2)#where the player input texts
	#history.set_syntax_coloring(true)
	text.set_syntax_coloring(true)
	for word in functionsR:
		#history.add_keyword_color(word,Color.royalblue)
		text.add_keyword_color(word,Color.royalblue)
	for word in functionsG:
		#history.add_keyword_color(word,Color.green)
		text.add_keyword_color(word,Color.green)

func _process(delta):
	if Input.is_action_just_pressed("ui_textOpen"):
		if is_open:
			close()
		else:
			open()
	if Input.is_action_just_pressed("ui_accept"):#manage input
		var command = text.get_text().strip_edges(true,true)
		text.set_text("")
		history.push_text(command)
		history.push_text(proccess(command))

func open():
	popup()
	globals.is_movement_locked=true
	is_open=true
	text.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func close():
	hide()
	globals.is_movement_locked=false
	is_open=false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
func proccess(text):
	var words = text.strip_edges().rsplit(" ",true,2)
	if words[0]=="stop":
		globals.accel=Vector3(0,0,0)
		globals.rot_accel=Vector3(0,0,0)
		return "all thrust stoped"
	if words.size() > 1: #fixed crash if player only enters first word
		if words[0]=="go":
			if words[1]=="forward":
				globals.accel.z=-1
				return "forward thruster on"
			if words[1]=="back":
				globals.accel.z=1
				return "reverse thruster on"
			if words[1]=="left":
				globals.accel.x=-1
				return "right thruster on"
			if words[1]=="right":
				globals.accel.x=1
				return "left thruster on"
		if words[0]=="turn":
			if words[1]=="forward":
				globals.rot_accel.x=-1
				return "forward thruster on"
			if words[1]=="back":
				globals.rot_accel.x=1
				return "reverse thruster on"
			if words[1]=="left":
				globals.rot_accel.y=-1
				return "right thruster on"
			if words[1]=="right":
				globals.rot_accel.y=1
				return "left thruster on"
	return "error"