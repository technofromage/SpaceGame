extends TextureButton

export var objType = "planet"
export var metal = 100
export var revealed_info = false; #if true then the info is drawn
#for use with the CameraLabeling function
#this should describe how many different variables there are to draw in the getInfo function
var dataCount=1
export var options = ["sample","look","destroy"]

func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("metal: "+str(metal))
	return "Planet getInfo out of bounds error"

func _pressed():
	globals.set_power(globals.power-10)
	globals.openContextMenu(self)
