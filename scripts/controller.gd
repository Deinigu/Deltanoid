extends Node2D

var score : int


# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	var Ball = get_node("Ball")
	Ball.add_score.connect(_on_addScore)

func _on_addScore():
	score += 1
	print(score)

func _on_ball_game_over():
	get_tree().change_scene_to_file("res://scenes/Menu.tscn")
