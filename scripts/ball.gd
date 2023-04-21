extends Area2D

@export var speed = 500
signal add_score

var screen_size

var xPlus = 0
var yPlus = 1

var player


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	player = get_node("../Player")

func _process(delta):
	if(position.x >= screen_size.x):
		xPlus = -1
	if(position.y >= screen_size.y):
		queue_free()
	if(position.x <= 0):
		xPlus = 1
	if(position.y <= 0):
		yPlus = 1

	var velocity = Vector2(xPlus,yPlus)
	position += velocity.normalized() * speed * delta

func _on_area_entered(area:Area2D):
	if area.global_position.x < global_position.x:
		xPlus = -1
		yPlus = -yPlus
	if area.global_position.x > global_position.x:
		xPlus = 1
		yPlus = -yPlus
	if area.global_position.y < global_position.y:
		yPlus = 1
		xPlus = -xPlus
	if area.global_position.y > global_position.y:
		yPlus = -1
		xPlus = -xPlus
	if area != player:
		add_score.emit()
	