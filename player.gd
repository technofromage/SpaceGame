extends Node2D

var velocity = Vector2(0,0)
var rot= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x-=(sin(rot*PI/180))
			velocity.y-=(cos(rot*PI/180))
		else:
			rot-=0.5
			print(rot)
	if(Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x+=(sin(rot*PI/180))
			velocity.y+=(cos(rot*PI/180))
		else:
			rot+=0.5
			print(rot)
	if(Input.is_action_pressed("ui_up")):
		velocity.x+=(cos(rot*PI/180))
		velocity.y+=(sin(rot*PI/180))
	if(Input.is_action_pressed("ui_down")):
		velocity.x-=(cos(rot*PI/180))
		velocity.y-=(sin(rot*PI/180))
	
	set_rotation_degrees(rot)
	translate(velocity*delta)
