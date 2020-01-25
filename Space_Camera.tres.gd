extends Camera

var window
var player

func _ready():
	var parentName= get_parent().name
	window = get_node("/root/spacePrograming/Inside/"+parentName+"Window")
	player = get_node("/root/spacePrograming/PlayerBody")


#TODO: atm does not reflect motion coorrectly; turn into a window by adding position & rotation
func _physics_process(delta):
		#capturing the player motion
		var windowwidth = window.scale.x*0.5
		var angle1 = player.translation-(window.translation+Vector3(windowwidth,0,0))
		var angle2 = player.translation-(window.translation+Vector3(-windowwidth,0,0))
		#print(angle1)
		#print(angle2)
		#print_debug(angle1.angle_to(test)*180/PI)
		var angle = angle1.angle_to(angle2)
		#print_debug(angle*180/PI)
		#look_at(get_translation()-angle2,Vector3(0,1,0))
		#rotate_object_local(Vector3(0,1,0),-angle*0.5)
		#set_translation(player.translation)
		#translate_object_local(Vector3(0,0,-10))
		set_fov(angle*180/PI)
		
		#capturing the ship's motion
		translate(globals.accel*delta)
		rotate_object_local(Vector3(1,0,0),globals.rot_accel.x*delta)
		rotate_object_local(Vector3(0,1,0),globals.rot_accel.y*delta)
		rotate_object_local(Vector3(0,0,1),globals.rot_accel.z*delta)