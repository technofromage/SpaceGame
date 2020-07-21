extends Sprite


func _process(_delta):
	set_visible(Input.is_action_pressed("ui_up"))
