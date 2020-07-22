extends TextureButton

var options = ["collect"]
var revealed_info = false

func collect():
	globals.set_metal(globals.metal+10)
	queue_free()

func _pressed():
	globals.openContextMenu(self)
	globals.player.forceStoped=true
