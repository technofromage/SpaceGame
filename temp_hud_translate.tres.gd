extends Node

var up
var down
var left
var right

func _ready():
	up = get_node("arrowup")
	down = get_node("arrowdown")
	left = get_node("arrowleft")
	right = get_node("arrowright")

func _process(delta):
	up.set_visible(globals.accel.z<0)
	down.set_visible(globals.accel.z>0)
	left.set_visible(globals.accel.x>0)
	right.set_visible(globals.accel.x<0)