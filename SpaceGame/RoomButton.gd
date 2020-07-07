extends TextureButton


export var numroom = 0
var marker
var spinner

func _ready():
	marker = get_node("../player_marker")
	spinner = get_node("/root/SpaceGame/player/Camera2D/SpinMenu")

func _pressed():
	globals.changeRoom(numroom)
	marker.set_position(get_position())
	globals.set_fuel(globals.fuel-10)
	globals.sound_file.get_node("warp_sound").play()
	spinner.open();
	get_parent().set_visible(false);
