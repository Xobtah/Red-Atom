extends KinematicBody2D

export (bool) var direction = true

var motion = Vector2()
var speed = 500
var gravity = 20
var timer = 0

func _ready():
	$Area2D.connect('body_entered', self, 'collision')

func _process(delta):
	timer += delta
	motion.y += gravity
	motion.x = speed if direction else -speed
	move_and_slide(motion)
	if timer >= 2:
		get_parent().remove_child(self)

func collision(body):
	if body.name == 'FireBox':
		body.get_parent().watered()
	if get_parent():
		get_parent().remove_child(self)