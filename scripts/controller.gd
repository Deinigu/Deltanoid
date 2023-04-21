extends Node2D

@export var NOISE_SHAKE_STRENGTH: float = 60.0

var noise = FastNoiseLite.new()

var noise_i: float = 0
var shake_strength: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	var Ball = get_node("Ball")
	Ball.add_score.connect(_on_addScore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_addScore():
	print("1 punto")



