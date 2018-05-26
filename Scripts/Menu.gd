extends Control

export (String, FILE, '*.tscn') var scene

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_accept"):
		get_tree().change_scene(scene)
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit();

func _on_Start_Game_pressed():
	get_tree().change_scene(scene)

func _on_Quit_pressed():
	get_tree().quit();
