extends VBoxContainer

var objects = []
#objects 0: power
#objects 1: fuel
#objects 2: metal

func _enter_tree():#needs to happen before ready() because globals uses these values in its ready()
	objects = [get_node("PowerBar"),
		get_node("FuelBar"),
		get_node("MetalBar")]

func set(item, number): #sets string item and the number value
	objects[item].value == number
