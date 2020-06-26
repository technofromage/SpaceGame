extends Node2D

var velocity = Vector2(0,0)
var rot= 0
var forceStoped = false
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
	if(Input.is_action_pressed("ui_brake") || forceStoped):
		velocity.x-=velocity.x/10
		velocity.y-=velocity.y/10
		if (abs(velocity.x)<1):#if below threshold stop
			velocity.x=0		#this may be temperary idk
		if (abs(velocity.y)<1):
			velocity.y=0	
		globals.set_fuel(globals.fuel-0.4*( (velocity.x+velocity.y)/100 ))
	globals.set_power(globals.power-0.5*delta)
	set_rotation_degrees(rot)
	translate(velocity*delta)
	#function for solar power
	var sunDist=get_node("/root/SpaceGame/activeroom").get_child(0).get_node("Sun").get_global_position().distance_to(get_global_position());
	globals.set_power(globals.power+(1500/(sunDist*sunDist))*delta)	
