extends TextureButton


export var numroom = 0
var marker

func _ready():
	marker = get_node("../player_marker")

func _on_button_up():
	globals.changeRoom(numroom)
	marker.set_position(get_position())
	globals.set_fuel(globals.fuel-10)
	globals.sound_file.play();
	get_parent().set_visible(false);
