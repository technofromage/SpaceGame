extends AstronomicalObject

func _init():
	#for use with the contextMenu info function
	#this should describe how many different variables there are to draw in the getInfo function
	dataCount=1
	objType = "home"
	#for use with the context menu buttons
	options = ["build","refuel"]
	revealed_info = true

func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("food: "+str(globals.food))
	return "Planet getInfo out of bounds error"

func build():
	if globals.metal >= 30:
		globals.food = globals.food + 7#this is global b/c it needs to be traked when the planet is not loaded
		globals.set_metal(globals.metal-30)
		globals.openContextMenu(self)
		
func refuel():
	globals.set_fuel(100)
