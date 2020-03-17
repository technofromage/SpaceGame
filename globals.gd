extends Node

var health = 100
var fuel = 100
var power = 100
var powerbar
var fuelbar
var currentroom = 0 #the current open room's array #
var player
var rooms = [] #an array containing app rooms

func _ready():
	rooms.append(get_node("/root/SpaceGame/rooms/room 0"))
	rooms.append(get_node("/root/SpaceGame/rooms/room 1"))
	player = get_node("/root/SpaceGame/player")
	powerbar = get_node("/root/SpaceGame/player/Camera2D/status/powerBar")
	fuelbar = get_node("/root/SpaceGame/player/Camera2D/status/fuelBar")
	set_power(100)
	set_fuel(100)

func set_fuel(target):
	fuelbar.updatevalue(target)
	fuel = target

func set_power(target):
	powerbar.updatevalue(target)
	power = target

func changeRoom(target):
	if (currentroom != target):
		rooms[currentroom].set_visible(false)
		rooms[target].set_visible(true)
		currentroom = target
		player.set_position(Vector2(0,0))
		player.rot=0
		player.velocity = Vector2(0,0)
