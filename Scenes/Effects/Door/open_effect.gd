extends "../effect_node.gd"


func play_effect():
	parent.get_node("AnimatedSprite").play("open")
	parent.get_node("StaticBody2D").get_node("CollisionShape2D").set_deferred("disabled", true)
