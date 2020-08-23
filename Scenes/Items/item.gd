extends Node

class_name Item

var entity_near : bool
var picked : bool

signal display_prompt_item
signal notify_item_manager(item)

export (String) var item_name
export (NodePath) var item_manager_path
var item_manager

func _ready():
	item_manager = get_node(item_manager_path)
	entity_near = false
	picked = false

func _input(event):
	if event.is_action_pressed("item_cmd") && entity_near && picked == false:
		print("near")
		emit_signal("notify_item_manager", self)
		get_tree().set_input_as_handled()

func _on_Area2D_body_entered(body):
	if body as Duck || body as Chick:

		entity_near = true
		print(body.name)


func _on_Area2D_body_exited(body):
	entity_near = false
