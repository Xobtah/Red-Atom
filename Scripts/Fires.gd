extends Node2D

signal no_more_fire

var fireNumber

func _ready():
	fireNumber = 0
	for node in get_children():
		fireNumber += 1

func fire_extinguished():
	fireNumber -= 1
	if !fireNumber:
		emit_signal('no_more_fire')
