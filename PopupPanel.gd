extends Popup
var is_open=false
var history
var text
var functionsG=["forward","backward","left","right"]
var functionsR=["go","turn"]

func _ready():
	history=get_child(0)
	text=get_child(1)
	history.set_syntax_coloring(true)
	for word in functionsR:
		history.add_keyword_color(word,Color.royalblue)
		text.add_keyword_color(word,Color.royalblue)
	for word in functionsG:
		history.add_keyword_color(word,Color.green)
		text.add_keyword_color(word,Color.royalblue)

func _process(delta):
	if Input.is_action_just_pressed("ui_textOpen"):
		if is_open:
			close()
		else:
			open()
	if Input.is_action_just_pressed("ui_accept"):#manage input
		var command = text.get_text()
		text.set_text("")
		history.set_text(history.get_text()+"\n"+command)
		history.set_text(history.get_text()+proccess(command))
  
func open():
	popup()
	globals.is_movement_locked=true
	is_open=true

func close():
	hide()
	globals.is_movement_locked=false
	is_open=false
	
func proccess(text):
	var words = text.rsplit(" ",false,2)
	var pieces
	for word in words:
		pieces = word.rsplit(".",false,2)
		#Note: I dont think godot does a switch method
		if pieces[0]=="stop":
			globals.accel=Vector3(0,0,0)
			globals.rot_accel=Vector3(0,0,0)
			return "all thrust stoped"
		if pieces[0]=="go":
			if pieces[1]=="forward":
				globals.accel.y=1
				return "forward thruster set"
		return "error"