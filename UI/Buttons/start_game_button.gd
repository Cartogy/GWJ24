extends Node


export (String, FILE, "*.tscn") var begin_scene
func _ready():
	self.connect("pressed", self, "start_game")
	
func start_game():
	get_tree().change_scene(begin_scene)
