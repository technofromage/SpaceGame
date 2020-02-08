extends Camera

export var key = KEY_1#the buttun to set camera as primary
export var sensitivity = 0.001#roation sensitivity
var start_rot#the starting angle that the camera is
export var restraints = Vector2 (70,70);

func _ready():
	start_rot=get_rotation_degrees();
	get_viewport().warp_mouse(Vector2(500,300))

func _physics_process(delta):
	if (self==get_viewport().get_camera()):#if self = active camera
		if (globals.camera_type==0):
			if (!globals.is_movement_locked):
				get_viewport().warp_mouse(Vector2(500,300))
				var rotation_vert = get_viewport().get_mouse_position().y-300
				if (rotation_vert>0):#pos.; neg. rotation movement
					if ( int(get_rotation_degrees().x+70)%360 <= int(start_rot.x)%360 ):#too far neg.
						rotation_vert=0;
				if (rotation_vert<0):#neg.; pos. rotation movement
					if ( int(get_rotation_degrees().x-70)%360 >= int(start_rot.x)%360 ):#too far pos.
						rotation_vert=0;
				rotate_object_local(Vector3(1,0,0),-rotation_vert*sensitivity)

				var rotation_horz = get_viewport().get_mouse_position().x-500
				if (rotation_horz>0):#pos.; neg. rotation movement
					if ( int(get_rotation_degrees().y+70)%360 <= int(start_rot.y)%360 ):#too far neg.
						rotation_horz=0;
				if (rotation_horz<0):#neg.; pos. rotation movement
					if ( int(get_rotation_degrees().y-70)%360 >= int(start_rot.y)%360 ):#too far pos.
						rotation_horz=0;
				rotate(Vector3(0,1,0),-rotation_horz*sensitivity)
		if (globals.camera_type==1):
			var rotation_horz = (get_viewport().get_mouse_position().x/1000)
			var rotation_vert = (get_viewport().get_mouse_position().y/600)
			print(rotation_horz)
			print(rotation_vert)
			var dir = start_rot
			dir.x = start_rot.x+restraints.x-(restraints.x*2*rotation_vert)
			dir.y = start_rot.y+restraints.y-(restraints.y*2*rotation_horz)
			set_rotation_degrees(dir)
	if Input.is_key_pressed(key):
		make_current()