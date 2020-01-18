extends Spatial
#This is where the ship moves from


func addforce(amount):
	globals.accel=globals.accel+amount

func addforce_rotate(amount):
	globals.rot_accel=globals.rotation_accel+amount

func _physics_process(delta):
	translate(globals.accel*delta)
	rotate_x(globals.rot_accel.x*delta)
	rotate_y(globals.rot_accel.y*delta)
	rotate_z(globals.rot_accel.z*delta)