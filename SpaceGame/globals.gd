extends Node

var paused = false

var health = 100
var fuel = 100
var power = 100
var metal = 0
var food = 100
var inventory	#contains all the ui elements
var currentroom = 0 #the current open room's array 
var player 		#the node for the player
var room_file 	#the pre-loaded rooms.tscn file
var sound_file	#the file for the audio display
var contextMenu	#the context menu object
var bigMenu		#the large context menu
var looseMenu	#temp
var cycles = 0

func _ready():
	room_file = preload("res://rooms.tscn").instance()#load the 0 room
	var next_activeroom= room_file.get_child(currentroom)
	#var next_activeroom = get_node("/root/SpaceGame/rooms/room 0")
	next_activeroom.get_parent().remove_child(next_activeroom)
	get_node("/root/SpaceGame/activeroom").add_child(next_activeroom)
	player = get_node("/root/SpaceGame/player")	#mark all usefull nodes
	inventory = get_node("/root/SpaceGame/player/Camera2D/HUD/Inventory")
	sound_file = get_node("/root/SpaceGame/GlobalSounds")
	contextMenu = get_node("/root/SpaceGame/player/Camera2D/ContextMenu")
	bigMenu = get_node("/root/SpaceGame/player/Camera2D/BigMenu")
	looseMenu = get_node("/root/SpaceGame/player/Camera2D/looseText")	#TODO: replace with actual loss
	set_power(50)	#settup display values
	set_fuel(100)
	set_metal(0)

func set_fuel(target):#sets fuel to target # and refreshes the appropriate HUD
	inventory.set(1,target)
	fuel = target
	if fuel <= 0:
		paused = true
		bigMenu.set_visible(true)
		bigMenu.loadScript("scripts/stranded.txt")
		bigMenu.goTo("fuel", true)

func set_metal(target):#sets fuel to target # and refreshes the appropriate HUD
	inventory.set(2,target)
	metal = target

func set_power(target):#sets power to target # and refreshes the appropriate HUD
	inventory.set(1,target)
	power = target
	if power <= 0:
		paused = true
		bigMenu.set_visible(true)
		bigMenu.loadScript("scripts/stranded.txt")
		bigMenu.goTo("power", true)

func set_food(target):
	food = target
	if target <= 0:
		looseMenu.set_text("The city has starved. You lasted " + str(cycles) + "days")
		looseMenu.set_visible(true)

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
