extends AstronomicalObject

export var temp = 5500
export var size = 5

func _init():
	#for use with the contextMenu info function
	#this should describe how many different variables there are to draw in the getInfo function
	dataCount=2
	objType = "sun"
	#for use with the context menu buttons
	options = ["sample","look"]
	revealed_info = false


func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("temperatue: "+str(temp)+"F")
	if (i==1):
		return ("size: "+str(size))
	return "Sun getInfo out of bounds error"

func sample():#this function cannot be called if "sample" is already not in list
	revealed_info=true
	globals.openContextMenu(self)
	options.remove(options.find("sample"))
	globals.openContextMenu(self)

func look():
	globals.openBigMenu("scripts/test_script.txt",null)
