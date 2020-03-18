extends Sprite

export var objType = "planet"
export var metal = 100
#for use with the CameraLabeling function
#this should describe how many different variables there are to draw in the getInfo function
var dataCount=1


func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("metal: "+str(metal))
	return "getInfo out of bounds error"
