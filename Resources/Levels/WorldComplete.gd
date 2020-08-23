extends Area2D

signal level_complete(next_level)

export (String, FILE, "*.tscn") var next_world

var game

func _ready():
	game = get_tree().root.get_node("GameManager")
	print(game)
	if game:
		self.connect("level_complete", game, "_on_World_Complete")

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Duck":
			if next_world:
				if game:
					emit_signal("level_complete", next_world)
				else:
					get_tree().change_scene(next_world)
#			else: #Go back to menu?
#				pass
