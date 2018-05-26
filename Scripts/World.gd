extends Node2D

export (String, FILE, '*.tscn') var nextScene

export (int) var marginLeft = -1000000
export (int) var marginRight = 1000000
export (int) var marginTop = -1000000
export (int) var marginBottom = 1000000

func _ready():
	get_node("Red Atom/Camera2D").set_limit(MARGIN_TOP, marginTop)
	get_node("Red Atom/Camera2D").set_limit(MARGIN_LEFT, marginLeft)
	get_node("Red Atom/Camera2D").set_limit(MARGIN_RIGHT, marginRight)
	get_node("Red Atom/Camera2D").set_limit(MARGIN_BOTTOM, marginBottom)
	get_node('Fires').connect('no_more_fire', self, 'next_scene')
	pass

func next_scene():
	get_tree().change_scene(nextScene)