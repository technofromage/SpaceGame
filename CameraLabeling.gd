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

func _draw():
	#for each child in room IE each planet draw the info
	for i in room.get_child(0).get_children():
		var targetPos
		if (drawExtra):
			targetPos = i.get_global_transform_with_canvas().origin-get_viewport().size/2
			draw_line(targetPos,targetPos+Vector2(50,50),Color(0,200,0),2)
			draw_line(targetPos+Vector2(50,50),targetPos+Vector2(80,50),Color(0,200,0),2)
			draw_string(UIFont,targetPos+Vector2(50,50),i.objType,Color(50,120,50))
			for j in range(i.dataCount):
				draw_string(UIFont,targetPos+Vector2(50,70+20*j),i.getInfo(j),Color(50,120,50))
