extends Node

var score = 0 setget set_score

onready var scoreLabel = $ScoreLabel

func set_score(value):
	score = value
	update_score_label()

func update_score_label():
	scoreLabel.text = "Score = " + str(score)

func update_save_data(): #saveandload is a singleton, so we can add a function directly to it
	var save_data = SaveAndLoad.load_data_from_file()
	if score > save_data.highScore:
		save_data.highScore = score
		SaveAndLoad.save_data_to_file(save_data)
	
func on_Enemy_score_up():
	self.score += 10
	
func _on_Ship_player_death():
	update_save_data()
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://GameOverScreen.tscn")
