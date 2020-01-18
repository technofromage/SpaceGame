extends Camera

var window
var player

func _ready():
	window = get_node("../Window")
	player = get_node("../../PlayerBody")
	
	#var angle = player.translation-(window.translation+Vector3(2,1,0))
	#print_debug(angle)
	#print_debug(angle.angle_to(player.translation-window.translation+Vector3(-2,-1,0))*180/PI)

func _physics_process(delta):
		#rotation
		#look_at_from_position(player.translation,window.translation,Vector3(0,1,0))
		#set_translation(player.translation)
		
		#look_at(window.translation+player.translation+get_translation(),Vector3(0,-1,0))
		
		#fov
		#assumes window is at y=0 and is 4 (x) wide
		var angle1 = player.translation-(window.translation+Vector3(2,0,0))
		var angle2 = player.translation-(window.translation+Vector3(-2,0,0))
		print(angle1)
		print(angle2)
		#print_debug(angle1.angle_to(test)*180/PI)
		
		var angle = angle1.angle_to(angle2)
		print_debug(angle*180/PI)
		look_at(get_translation()-angle2,Vector3(0,1,0))
		
		rotate_object_local(Vector3(0,1,0),-angle*0.5)
		
		set_translation(player.translation)
		translate_object_local(Vector3(0,0,-10))
		#var angle= angle1.angle_to(angle2)
		#print_debug(angle)
		set_fov(angle*180/PI)