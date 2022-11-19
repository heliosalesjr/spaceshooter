extends Area2D

export(int) var SPEED = 100

export (int) var COLOR = 1

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		position.y -= SPEED * delta
	if Input.is_action_just_pressed("ui_down"):
		position.y += SPEED * delta
