extends Node2D

var velocity = Vector2(0,0)
var rot= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_left")):
		Input.get_action_strength("ui_left")
		rot-=1
		print(rot)
	if(Input.is_action_pressed("ui_right")):
		Input.get_action_strength("ui_right")
		rot+=0.5
		print(rot)
	if(Input.is_action_pressed("ui_up")):
		Input.get_action_strength("ui_up")
		velocity.x+=(cos(rot*PI/180))
		velocity.y+=(sin(rot*PI/180))
	if(Input.is_action_pressed("ui_down")):
		Input.get_action_strength("ui_down")
		velocity.x-=(cos(rot*PI/180))
		velocity.y-=(sin(rot*PI/180))
	
	set_rotation_degrees(rot)
	translate(velocity*delta)
