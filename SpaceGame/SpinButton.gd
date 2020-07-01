extends Button

var wheels = []

func _ready():
	wheels.append(get_parent().get_node("wheel"))
	wheels.append(get_parent().get_node("wheel2"))

func _pressed():
	for x in wheels:
		x.speed=rand_range(8,15)#TODO change to make 100% fair
		x.spinning=true
