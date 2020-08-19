extends Node2D

class_name Lock

signal notify_entity_is_near(lock)
signal notify_entity_left

export (NodePath) var key_path
var key
var near_lock

		

func _ready():
	key = get_node(key_path)

func apply_key_item(key_item) -> bool:
	if key_item == key:
		unlock()
		return true
	else:
		return false
		
func unlock():
	pass
	

# Notify Item Manager to update the DataEntities
func _on_Area2D_body_entered(body):
	emit_signal("notify_entity_is_near", self)


func _on_Area2D_body_exited(body):
	emit_signal("notify_entity_left")
