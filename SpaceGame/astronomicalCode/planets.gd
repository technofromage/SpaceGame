extends AstronomicalObject

export var metal = 100

func _init():
	#for use with the contextMenu info function
	#this should describe how many different variables there are to draw in the getInfo function
	dataCount=1
	objType = "planet"
	#for use with the context menu buttons
	options = ["sample","harvest"]


func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("metal: "+str(metal))
	return "Planet getInfo out of bounds error"

func sample():#this function cannot be called if "sample" is already not in list
	revealed_info=true
	#options.remove(options.find("sample"))
	globals.openContextMenu(self)

func harvest():
	if (globals.power>20) && (globals.metal<100):
		globals.set_power(globals.power-20)
		if (metal>20):
			globals.set_metal(globals.metal+20)
			metal = metal - 20
		else:
			globals.set_metal(globals.metal+metal)
			metal = 0
