extends Sprite

export var objType = "sun"
export var temp = 5500
export var size = 5;
export var revealed_info = true;
#for use with the CameraLabeling function
#this should describe how many different variables there are to draw in the getInfo function
var dataCount=2

func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("temperatue: "+str(temp)+"F")
	if (i==1):
		return ("size: "+str(size))
	return "Sun getInfo out of bounds error"
