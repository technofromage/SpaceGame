extends TextureRect


var attached_object = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):#needs to move every frame b/c attached to camera #attached to camera for rotation correction
	if (attached_object!=null):
		set_global_position(attached_object.get_global_position())
		rect_position+=Vector2(25,25)

func attachTo(object):#TODO have the size of the context menu depend on the buttons to draw
		var i = 0
		for option in object.options:#whenever there is an option set visable and fill text
			get_child(i).set_text(option)
			get_child(i).set_visible(true)
			i=i+1;
		while (i<5):#if there is no option then hide button
			get_child(i).set_visible(false)
			i=i+1;

