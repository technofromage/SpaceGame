extends Node2D

var options = 7#full options --default to neutral
var bad = 2
const radius = 80
var speed = 0
var spinning = false
var result = ""
export var OutputName: String
var output

func _ready():
	output = get_parent().get_node(OutputName)

func _process(delta):
	if speed>0:
		speed=speed-0.05
	else:
		speed=0
		if spinning == true:
			if (ceil(get_rotation()/(2*PI/options)))<=bad:
				badThing()
			else:
				goodThing()
			spinning = false
			get_parent().addResult()
	rotate(speed*delta)
	if (get_rotation()>2*PI):
		set_rotation(get_rotation()-(2*PI))


func _draw():
	var points = PoolVector2Array([Vector2(0,0)])
	var i=0
	var change = (2*PI/options)
	var pointOnCircle=0
	var color
	while (i<options):
		if i<bad: color = Color.red
		else: color = Color.green
		points.append(Vector2(cos(pointOnCircle),sin(pointOnCircle))*radius)
		pointOnCircle=pointOnCircle-change
		points.append(Vector2(cos(pointOnCircle),sin(pointOnCircle))*radius)
		draw_colored_polygon(points,color)
		draw_arc(Vector2(0,0),radius-4,pointOnCircle,pointOnCircle+change,4,Color.gray,8)#happens after drawing sections for covering edges
		draw_line(Vector2(0,0),points[1],Color.gray,4)#goes on top so happens last
		points = PoolVector2Array([Vector2(0,0)])
		i=i+1
	draw_line(Vector2(0,0),Vector2(radius,0),Color.gray,4)
	
func badThing():
	output.set_text("bad outcome, food - 10")
	globals.food = globals.food-10
func goodThing():
	output.set_text("good outcome, food + 2")
	globals.food = globals.food+2
