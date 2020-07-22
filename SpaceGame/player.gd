extends Node2D

var velocity = Vector2(0,0)
var rot= 0
var forceStoped = false
var radar = false
var radarRadius = 10000
const radarMaxTime = 200
const radarMaxRad = 150	#the difference between time and radious max is the time without any pings

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if globals.paused :
		delta = 0

	if radar:
		if radarRadius>radarMaxTime:
			radarRadius=1
		radarRadius+=delta*30
		globals.set_power(globals.power-1*delta)
		get_node("Area2D").shape_owner_get_shape(0,0).radius=radarRadius	#this is convuluted because godot physics doesnt like changing shapes
		update()

	if(Input.is_action_pressed("ui_left")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x-=(cos((rot+90)*PI/180))
			velocity.y-=(sin((rot+90)*PI/180))
		else:
			rot-=0.5
		globals.set_fuel(globals.fuel-2*delta)
	if(Input.is_action_pressed("ui_right")):
		if (Input.is_action_pressed("ui_alt")):
			velocity.x+=(cos((rot+90)*PI/180))
			velocity.y+=(sin((rot+90)*PI/180))
		else:
			rot+=0.5
		globals.set_fuel(globals.fuel-2*delta)
	if(Input.is_action_pressed("ui_up")):
		velocity.x+=(cos(rot*PI/180))
		velocity.y+=(sin(rot*PI/180))
		globals.set_fuel(globals.fuel-2*delta)
	if(Input.is_action_pressed("ui_down")):
		velocity.x-=(cos(rot*PI/180))
		velocity.y-=(sin(rot*PI/180))
		globals.set_fuel(globals.fuel-2*delta)
	if(Input.is_action_pressed("ui_brake") || forceStoped):
		velocity.x-=velocity.x/10
		velocity.y-=velocity.y/10
		if (abs(velocity.x)<1):#if below threshold stop
			velocity.x=0		#this may be temperary idk
		if (abs(velocity.y)<1):
			velocity.y=0	
		globals.set_fuel(globals.fuel-0.4*( (velocity.x+velocity.y)/100 ))
	set_rotation_degrees(rot)
	translate(velocity*delta)
	#function for solar power
	var sunDist=get_node("/root/SpaceGame/activeroom").get_child(0).get_node("Sun").get_global_position().distance_to(get_global_position());
	globals.set_power(globals.power+(40*pow(3,-(sunDist*sunDist)/10000))*delta)	#TODO make stronger and damage ship when close

func _draw():
	if radarRadius < radarMaxRad:
		draw_arc(Vector2(0,0),radarRadius, 0,2*PI, 20,Color(0,0.5,0.8,1-(radarRadius/radarMaxRad)))


func _on_Area2D_area_entered(area):
	area.get_parent().visible=true
