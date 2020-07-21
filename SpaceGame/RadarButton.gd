extends CheckButton

func _pressed():
	globals.player.radar = pressed#set the radar value to the value of weather the button is pressed
	if pressed:
		globals.player.radarRadius = 1000
