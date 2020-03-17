extends Camera2D
var drawExtra = true
var room
var UIFont #this can be exported as a font for adding special fonts
func _ready():
	room=get_node("/root/SpaceGame/activeroom")
	var label = Label.new()
	UIFont = label.get_font("")

func _process(delta):
	update()

func _draw():
	#for each child in room IE each planet
	for i in room.get_child(0).get_children():
		var targetPos
		if (drawExtra):
			targetPos = i.get_global_transform_with_canvas().origin-get_viewport().size/2
			draw_line(targetPos,targetPos+Vector2(50,50),Color(0,200,0),2)
			draw_line(targetPos+Vector2(50,50),targetPos+Vector2(80,50),Color(0,200,0),2)
			draw_string(UIFont,targetPos+Vector2(50,50),"Planet",Color(50,120,50))
			draw_string(UIFont,targetPos+Vector2(50,70),"Metal:100",Color(50,120,50))
