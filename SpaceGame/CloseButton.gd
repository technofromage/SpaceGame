extends TextureButton


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _pressed():
	get_parent().set_visible(false)
	globals.player.forceStoped=false
	globals.paused=false
