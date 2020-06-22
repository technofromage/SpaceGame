extends TextureRect


var attachedFile = null
var options = ["open"]
# Called when the node enters the scene tree for the first time.

func loadScript(name):
	if (attachedFile != null):
		attachedFile.close()
	attachedFile = File.new()
	attachedFile.open(name,File.READ)

func readScript(target, fromstart):#outputs the string from that section
	if (fromstart):
		attachedFile.seek(0)
	var output = ""
	var temp = attachedFile.get_line()
	while (temp!="---"+target+"---"):#go to the target string name
		temp=attachedFile.get_line()
	temp=attachedFile.get_line()
	while (temp!="---end---"):
		output=output+"\n"+temp
		temp=attachedFile.get_line()
	return output

func goTo(target, fromstart):#handling children will happen here
	var temp = readScript(target, fromstart)
	get_node("RichTextLabel").set_bbcode(temp)

func open():#TEMP TEST FUNCTION
	goTo("open", true)
