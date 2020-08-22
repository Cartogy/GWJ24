extends Node

signal unpause

var game
# Called when the node enters the scene tree for the first time.
func _ready():
	game = get_tree().root.get_node("GameManager")
	self.connect("unpause", game, "change_state")
	self.connect("pressed", self, "_unpause_game")

func _unpause_game():
	emit_signal("unpause")
