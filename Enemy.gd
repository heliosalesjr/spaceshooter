extends Area2D

const ExplosionEffect = preload("res://ExplosionEffect.tscn")

export(int) var SPEED = 20
export(int) var ARMOR = 3

signal score_up

func _ready():
	var main = get_tree().current_scene
	if main.is_in_group("World"):
		connect("score_up", main, "on_Enemy_score_up")

func _process(delta):
	position.x -= SPEED * delta
	

func _on_Enemy_body_entered(body):
	body.queue_free()
	ARMOR -= 1
	if ARMOR <= 0:
		emit_signal("score_up")

		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _exit_tree():
	var main = get_tree().current_scene
	var explosionEffect = ExplosionEffect.instance()
	main.add_child(explosionEffect)
	explosionEffect.global_position = global_position
	
