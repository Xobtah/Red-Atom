extends Node2D

func _ready():
	pass

func watered():
	var scale = get_scale()
	scale.x -= 0.1
	scale.y -= 0.1
	set_scale(scale)
	if scale.x <= 0.1:
		get_parent().fire_extinguished()
		get_parent().remove_child(self)