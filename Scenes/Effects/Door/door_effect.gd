extends "../effect_single.gd"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _ready():
	._ready()

func apply_effect_when_on():
	$AnimatedSprite.play("Open")
	$Area2D/CollisionShape2D.disabled = true
	
func apply_effect_when_off():
	$Area2D/CollisionShape2D.disabled = false
	$AnimatedSprite.play("Closed")
