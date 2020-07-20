extends TextureRect

export var wheels = 2
var complete = 0

func addResult():
	complete = complete + 1
	get_node("SpinButton").set_visible(false)
	if complete==wheels:
		get_node("ContinueButton").set_visible(true)
		globals.cycles = globals.cycles+1

func open():
	set_visible(true)
	complete = 0
	get_node("ContinueButton").set_visible(false)
	get_node("SpinButton").set_visible(true)

func close():
	set_visible(false)
	globals.player.forceStoped=false
	globals.paused=false
