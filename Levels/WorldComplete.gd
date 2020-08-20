extends Area2D

export (String, FILE, "*.tscn") var next_world

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Duck":
			if next_world:
				get_tree().change_scene(next_world)
#			else: #Go back to menu?
#				pass
