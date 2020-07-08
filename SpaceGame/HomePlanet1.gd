extends TextureButton

export var objType = "planet"
export var revealed_info = true; #if true then the info is drawn
#for use with the CameraLabeling function
#this should describe how many different variables there are to draw in the getInfo function
var dataCount=1
export var options = ["build", "refuel"]

func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("food: "+str(globals.food))
	return "Planet getInfo out of bounds error"

func _pressed():
	#globals.set_power(globals.power-10)
	if get_global_position().distance_to( globals.player.get_global_position() ) < 200 :
		globals.openContextMenu(self)
		globals.player.forceStoped=true

func build():
	if globals.metal >= 30:
		globals.food = globals.food + 10#this is global b/c it needs to be traked when the planet is not loaded
		globals.set_metal(globals.metal-30)
		globals.openContextMenu(self)
		
func refuel():
	globals.set_fuel(100)
