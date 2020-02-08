extends Camera

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var targetname = "../../sideframe";

# Called when the node enters the scene tree for the first time.
func _ready():
	var target = get_node(targetname)
	var point = target.translation+Vector3(0,0,-15)
	look_at(point,Vector3(0,1,0))