extends Node

var health = 100
var fuel = 100
var power = 100
var metal = 100
var food = 100
var powerbar	#the node for the power display
var fuelbar		#the node for the fuel display
var metalbar	#the node for the metal display
var currentroom = 0 #the current open room's array 
var player 		#the node for the player
var room_file 	#the pre-loaded rooms.tscn file
var sound_file	#the file for the audio display
var contextMenu	#the context menu object
var bigMenu		#the large context menu


func _ready():
	room_file = preload("res://rooms.tscn").instance()#load the 0 room
	var next_activeroom= room_file.get_child(currentroom)
	#var next_activeroom = get_node("/root/SpaceGame/rooms/room 0")
	next_activeroom.get_parent().remove_child(next_activeroom)
	get_node("/root/SpaceGame/activeroom").add_child(next_activeroom)
	player = get_node("/root/SpaceGame/player")	#mark all usefull nodes
	powerbar = get_node("/root/SpaceGame/player/Camera2D/status/powerBar")
	fuelbar = get_node("/root/SpaceGame/player/Camera2D/status/fuelBar")
	metalbar = get_node("/root/SpaceGame/player/Camera2D/status/metalBar")
	sound_file = get_node("/root/SpaceGame/GlobalSounds")
	contextMenu = get_node("/root/SpaceGame/player/Camera2D/ContextMenu")
	bigMenu = get_node("/root/SpaceGame/player/Camera2D/BigMenu")
	set_power(50)	#settup display values
	set_fuel(100)
	set_metal(100)

func set_fuel(target):#sets fuel to target # and refreshes the appropriate HUD
	fuelbar.updatevalue(target)
	fuel = target
	if fuel <= 0:
		bigMenu.set_visible(true)
		bigMenu.loadScript("scripts/stranded.txt")
		bigMenu.goTo("fuel", true)

func set_metal(target):#sets fuel to target # and refreshes the appropriate HUD
	metalbar.updatevalue(target)
	metal = target

func set_power(target):#sets power to target # and refreshes the appropriate HUD
	powerbar.updatevalue(target)
	power = target
	if power <= 0:
		bigMenu.set_visible(true)
		bigMenu.loadScript("scripts/stranded.txt")
		bigMenu.goTo("power", true)

func changeRoom(target):#changes currentroom to target #.
	if (currentroom != target):
		currentroom = target
		player.set_position(Vector2(0,0))
		player.rot=0
		player.velocity = Vector2(0,0)
		var activeroom = get_node("/root/SpaceGame/activeroom")
		var current_room=activeroom.get_child(0)
		var next_room= room_file.get_node("room "+str(target))
		#put room back
		activeroom.remove_child(current_room)
		room_file.add_child(current_room)
		#get next room 
		next_room.get_parent().remove_child(next_room)
		activeroom.add_child(next_room)

func openContextMenu(object):#opens the context menu over the class "object"
	contextMenu.set_visible(true)
	contextMenu.attached_object = object
	contextMenu.attachTo(object)

func openBigMenu(file, picture):
	bigMenu.set_visible(true)
	bigMenu.loadScript(file)
	bigMenu.goTo("continue", true)
	
