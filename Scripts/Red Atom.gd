extends KinematicBody2D

var motion = Vector2()

export (int) var speed = 200
export (int) var gravity = 20
export (int) var jump = 500

var water = preload('res://Prefabs/Water.tscn')

func _process(delta):
	motion.y += gravity
	
	if is_on_floor():
		if Input.is_action_pressed('ui_right'):
			motion.x = speed
			if get_node('Sprite/AnimationPlayer').get_current_animation() != 'Run':
				get_node('Sprite/AnimationPlayer').play('Run')
			$Sprite.set_flip_h(false)
		elif Input.is_action_pressed('ui_left'):
			motion.x = -speed
			if get_node('Sprite/AnimationPlayer').get_current_animation() != 'Run':
				get_node('Sprite/AnimationPlayer').play('Run')
			$Sprite.set_flip_h(true)
		
		elif !Input.is_action_pressed('ui_left') && !Input.is_action_pressed('ui_right'):
			motion.x = 0
			get_node('Sprite/AnimationPlayer').play('Idle')
		
		if Input.is_action_just_pressed('ui_up'):
			motion.y = -jump
		
		if Input.is_action_pressed("ui_down"):
			get_node('Sprite/AnimationPlayer').play('Crouch')

	elif get_node('Sprite/AnimationPlayer').get_current_animation() != 'Jump':
		get_node('Sprite/AnimationPlayer').play('Jump')
		
	if Input.is_action_pressed('shoot'):
		var waterInstance = water.instance()
		var waterPosition = get_global_position()
		waterPosition.x += -25 if $Sprite.is_flipped_h() else 25
		waterInstance.direction = !$Sprite.is_flipped_h()
		waterInstance.set_position(waterPosition)
		get_parent().add_child(waterInstance)
	
	motion = move_and_slide(motion, Vector2(0, -1))
	
	pass