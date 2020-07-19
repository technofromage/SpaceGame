extends VBoxContainer

var objects = []
enum {POWER,FUEL,METAL} #the constants corresponding the the objects array; used for the set() function

func _enter_tree():#needs to happen before ready() because globals uses these values in its ready()
	objects = [get_node("PowerBar"),
		get_node("FuelBar"),
		get_node("MetalBar")]

func set(item, number): #sets string item and the number value
	objects[item].value = number
