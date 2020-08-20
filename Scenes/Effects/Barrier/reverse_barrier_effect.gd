extends "../effect_multiple.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func apply_effect_when_on():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	$AnimatedSprite.play("open")

func apply_effect_when_off():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite.play("close")

func switch_activated():
	current_switches_on += 1
	if current_switches_on == total_switches:
		apply_effect_when_on()

func switch_deactivated():
	if current_switches_on == total_switches:
		if effect_type == Type.CONSTANT:
			apply_effect_when_off()
	current_switches_on -= 1
