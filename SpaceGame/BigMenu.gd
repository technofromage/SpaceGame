extends TextureRect


var attachedFile = null
var options = ["open"]
var optionNames = []
# Called when the node enters the scene tree for the first time.

var spinner

func _ready():
	spinner = get_node("/root/SpaceGame/player/Camera2D/SpinMenu")

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
		if (temp == null):
			return "error marker not found"
	temp=attachedFile.get_line()
	var temp2
	var i=0
	for x in temp.split(",",true):	#ATTACH BUTTONS FROM SCRIPT
		temp2 = x.split(">")
		options[i] = temp2[1]
		get_node("BigContextMenu").get_child(i).set_text(temp2[0])
		get_node("BigContextMenu").get_child(i).set_visible(true)
		i=i+1
	while i>4: # there are 5 buttons labled from 0 to 4
		get_node("BigContextMenu").get_child(i).set_visible(false) #hide unessasary buttons
	temp=attachedFile.get_line()#move beyond the information line
	while (temp!="---end---"):
		output=output+"\n"+temp
		temp=attachedFile.get_line()
		if (temp == null):
			return "error no end marker"
	return output

func goTo(target, fromstart):#handling children will happen here
	var temp = readScript(target, fromstart)
	get_node("RichTextLabel").set_bbcode(temp)

func open():#TEMP TEST FUNCTION
	goTo("open", true)
	
func wait():
	spinner.open()
	set_visible(false)
	globals.set_fuel(globals.fuel+20)
	globals.set_power(globals.power+20)
