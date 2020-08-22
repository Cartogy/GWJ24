extends Node

var has_item : bool

var current_item : Item
var entity_position : Vector2
var near_lock : Lock

func _ready():
	entity_position = Vector2.ZERO

func set_current_item(val: Item):
	if has_item == false:
		current_item = val

func get_current_item() -> Item:
	return current_item

func remove_current_item():
	if has_item:
		current_item = null
		has_item = false

func set_entity_position(val: Vector2):
	entity_position = val

func get_entity_position() -> Vector2:
	return entity_position

func update_item_position():
	current_item.global_position = entity_position

func set_lock(val):
	near_lock = val

func get_lock():
	if near_lock != null:
		return near_lock

func remove_lock():
	near_lock = null
