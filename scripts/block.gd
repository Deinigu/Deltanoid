extends Area2D

var effect
var estado


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.animation = "green"
	estado = 2
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area:Area2D):
	if area.is_in_group("ball"):
		if estado == 2:
			$AnimatedSprite2D.animation = "yellow"
			estado = estado -1
		elif estado == 1:
			$AnimatedSprite2D.animation = "red"
			estado = estado -1
		else:
			effect = load("res://scenes/Explosion.tscn").instantiate()
			effect.set_position(Vector2(0,0))
			self.add_child(effect)
			$AnimatedSprite2D.hide()
			remove_child($CollisionShape2D)
			await get_tree().create_timer(effect.lifetime).timeout
			queue_free()
			
