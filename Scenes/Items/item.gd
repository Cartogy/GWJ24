extends Node

class_name Item

var entity_near : bool

signal display_prompt_item
signal notify_item_manager(item)

export (String) var item_name
export (NodePath) var item_manager_path
var item_manager

func _ready():
	item_manager = get_node(item_manager_path)

func _input(event):
	if Input.is_action_pressed("pick_item") && entity_near:
		print("near")
		emit_signal("notify_item_manager", self)

func _on_Area2D_body_entered(body):
	entity_near = true
	print("Intruders")


func _on_Area2D_body_exited(body):
	entity_near = false
