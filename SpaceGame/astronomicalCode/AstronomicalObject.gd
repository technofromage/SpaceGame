extends TextureButton
class_name AstronomicalObject, "res://sprites/planet.png"
#this is the base class for all click-able objects that can appear on maps; the following functions and variables will serve as defaults

export var objType = "errorType"
export var revealed_info = true;
var dataCount = 0

var options = []

func getInfo(_i):#This function returns a string for displaying on the UI
	return "Class Define Error"

func _pressed():
	#globals.set_power(globals.power-10)
	if get_global_position().distance_to( globals.player.get_global_position() ) < 200 :
		globals.openContextMenu(self)
		globals.player.forceStoped=true
