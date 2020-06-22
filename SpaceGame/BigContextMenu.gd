extends TextureRect

var attached_object = null

# Called when the node enters the scene tree for the first time.
func _ready():
	attached_object = get_parent()
