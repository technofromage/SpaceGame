extends Button
export var number = 0 #goes from 0 to 1-max buttons must represent the buttons # in list

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _pressed():#calls the function with the same name as the button
	var function = funcref(get_parent().attached_object,get_parent().attached_object.options[number])
	if (function != null):
		function.call_func()
