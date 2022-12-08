extends Node2D

onready var highscoreLabel = $HighScoreLabel
func _ready():
	set_highscore_label()
	
func set_highscore_label():
	var save_data = SaveAndLoad.load_data_from_file()
	highscoreLabel.text = "Highscore: " + str(save_data.highScore)
