extends Node


export (String, FILE, "*.tscn") var menu_scene
func _ready():
	self.connect("pressed", self, "to_menu")


func to_menu():
	get_tree().change_scene(menu_scene)
