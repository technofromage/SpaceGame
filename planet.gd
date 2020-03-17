extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drawExtra = true
var resources = 100

func _ready():
	set_text("Planet \n Resources:"+str(resources))

func _draw():
	if (drawExtra):
		draw_line(Vector2(-50,-50),Vector2(0,0),Color(0,200,0),2)
		draw_line(Vector2(0,0),Vector2(30,0),Color(0,200,0),2)
