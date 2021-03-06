extends Node2D

class_name Lock

signal notify_entity_is_near(lock)
signal notify_entity_left

export (NodePath) var item_manager_path 
var item_manager
export (NodePath) var key_path
var key
var near_lock



func _ready():
	key = get_node(key_path)
	var item_manager = get_node(item_manager_path)
	self.connect("notify_entity_is_near", item_manager, "_on_Lock_notify_entity_is_near")
	self.connect("notify_entity_left", item_manager, "_on_Lock_notify_entity_left")

func apply_key_item(key_item) -> bool:
	if key_item == key:
		unlock()
		return true
	else:
		return false

func unlock():
	get_node("StaticBody2D").get_node("CollisionShape2D").set_deferred("disabled", true)
	get_node("AnimatedSprite").play("open")


# Notify Item Manager to update the DataEntities
func _on_Area2D_body_entered(body):
	if body as Duck || body as Chick:
		emit_signal("notify_entity_is_near", self)


func _on_Area2D_body_exited(body):
	emit_signal("notify_entity_left")
