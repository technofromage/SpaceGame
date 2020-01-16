extends Camera

var window
var player

func _ready():
	window = get_node("../Window")
	player = get_node("../../PlayerBody")
	
	var angle = player.translation-(window.translation+Vector3(2,0,0))
	print_debug(angle)
	print_debug(angle.angle_to(player.translation-window.translation+Vector3(-2,0,0))*180/PI)

func _physics_process(delta):
		#rotation
		look_at_from_position(player.translation,window.translation,Vector3(0,1,0))
		
		translate_object_local(Vector3(0,0,-10))
		#look_at(window.translation+player.translation+get_translation(),Vector3(0,-1,0))
		
		#fov
		#assumes window is at y=0 and is 4 (x) wide
		#var angle = player.translation-(window.translation+Vector3(2,0,0))
		#print_debug(angle)
		#print_debug(angle.angle_to(player.translation-window.translation+Vector3(-2,0,0))*180/PI)
		#var angle= angle1.angle_to(angle2)
		#print_debug(angle*180/PI)
		#set_fov(angle*180/PI)