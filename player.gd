extends Node2D

var velocity = Vector2(0,0)
var rot= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x-=(cos((rot+90)*PI/180))
			velocity.y-=(sin((rot+90)*PI/180))
		else:
			rot-=0.5
		globals.set_fuel(globals.fuel-0.1)
	if(Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x+=(cos((rot+90)*PI/180))
			velocity.y+=(sin((rot+90)*PI/180))
		else:
			rot+=0.5
		globals.set_fuel(globals.fuel-0.1)
	if(Input.is_action_pressed("ui_up")):
		velocity.x+=(cos(rot*PI/180))
		velocity.y+=(sin(rot*PI/180))
		globals.set_fuel(globals.fuel-0.1)
	if(Input.is_action_pressed("ui_down")):
		velocity.x-=(cos(rot*PI/180))
		velocity.y-=(sin(rot*PI/180))
		globals.set_fuel(globals.fuel-0.5*delta)
	
	globals.set_power(globals.power-0.5*delta)
	set_rotation_degrees(rot)
	translate(velocity*delta)
	#function for solar power
	var sunDist=get_node("/root/SpaceGame/activeroom").get_child(0).get_node("Sun").get_global_position().distance_to(get_global_position());
	print(sunDist)
	globals.set_power(globals.power+(1500/(sunDist*sunDist))*delta)	
