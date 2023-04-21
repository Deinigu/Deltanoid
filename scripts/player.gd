extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size
var initial_position = Vector2(300,855)

# Called when the node enters the scene tree for the first time.
func _ready():
	var ball = get_node("../Ball")
	ball.add_score.connect(_on_addScore)
	screen_size = get_viewport_rect().size
	$AnimationSprite2D.animation = "default"
	self.position = initial_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_right")):
		velocity.x += 1
	if(Input.is_action_pressed("move_left")):
		velocity.x -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	position.x = clamp(position.x, 65, screen_size.x-65)

func _on_addScore():
	$AnimationSprite2D.animation = "score"
	await get_tree().create_timer(1).timeout
	$AnimationSprite2D.animation = "default"

func _on_area_entered(area):
	$AnimationSprite2D.animation = "hit"
	await get_tree().create_timer(1).timeout
	if(	$AnimationSprite2D.animation != "score"):
		$AnimationSprite2D.animation = "default"
