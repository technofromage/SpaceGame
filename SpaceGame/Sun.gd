extends TextureButton

export var objType = "sun"
export var temp = 5500
export var size = 5;
export var revealed_info = false;
#for use with the CameraLabeling function
#this should describe how many different variables there are to draw in the getInfo function
var dataCount=2
export var options = ["sample","look"]

func getInfo(i):#This function returns a string for displaying on the UI
	if (i==0):
		return ("temperatue: "+str(temp)+"F")
	if (i==1):
		return ("size: "+str(size))
	return "Sun getInfo out of bounds error"

func _pressed():
	if get_global_position().distance_to( globals.player.get_global_position() ) < 200 :
		globals.openContextMenu(self)
		globals.player.forceStoped=true

func sample():#this function cannot be called if "sample" is already not in list
	revealed_info=true
	globals.openContextMenu(self)
	options.remove(options.find("sample"))
	globals.openContextMenu(self)

func look():
	globals.openBigMenu("scripts/test_script.txt",null)
