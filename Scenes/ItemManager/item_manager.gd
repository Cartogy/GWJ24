extends Node

enum Entity_State { DUCK, FLOCK }
var cur_entity_state

var cur_entity_item

var item_near_player : Item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if Input.is_action_pressed("drop_item"):
		if cur_entity_item.has_item:
			activate_item()


func _physics_process(delta):
	if cur_entity_item.has_item:
		cur_entity_item.update_item_position()

func set_entity_state(state):
	if state == "Duck":
		print("Duck entity")
		cur_entity_state = Entity_State.DUCK
		cur_entity_item = $DuckItems
	elif state == "Flock":
		print("Flock entity")
		cur_entity_state = Entity_State.FLOCK
		cur_entity_item = $FlockItem

func update_entity_position(pos):
	cur_entity_item.set_entity_position(pos)
#	print("Entityi Position")
#	print(pos)

func deactivate_item(item: Item):
	item.set_physics_process(false)

	cur_entity_item.current_item = item
	cur_entity_item.has_item = true

func activate_item():
	cur_entity_item.current_item.set_physics_process(true)
	cur_entity_item.current_item.global_position = cur_entity_item.get_entity_position()
	cur_entity_item.has_item = false
	cur_entity_item.current_item.get_node("CollisionShape2D").set_deferred("disabled", false)	# Let the item have and effect on switches
	cur_entity_item.current_item = null

func pickup_item(item):
	if cur_entity_item.has_item == false:

		# Don't teleport item to another entity's position
		if $DuckItems.current_item != item && $FlockItem.current_item != item:
			item.get_node("CollisionShape2D").set_deferred("disabled", true)	# Prevents collision between duck and item
			cur_entity_item.set_current_item(item)
			print(cur_entity_item.name)
			deactivate_item(item)

func set_entity_lock(lock):
	cur_entity_item.set_lock(lock)

func unlock_lock():
	var item = cur_entity_item.get_current_item()
	var lock = cur_entity_item.get_lock()

	if item && lock:
		if lock.apply_key_item(item):
			cur_entity_item.set_current_item(null)
			cur_entity_item.has_item = false
			cur_entity_item.set_lock(null)

func _on_PlayerController_change_item_entity(state):
	set_entity_state(state)


func _on_Duck_update_position_entity(pos):
	update_entity_position(pos)


func _on_FlockManager_update_entity_position(pos):

	update_entity_position(pos)

func _on_Item_pick_up(item):
	print("ITEM")
	pickup_item(item)


func _on_Item_notify_item_manager(item):
	pickup_item(item)


func _on_Lock_notify_entity_is_near(lock):
	set_entity_lock(lock)


func _on_Lock_notify_entity_left():
	cur_entity_item.set_lock(null)


func _on_PlayerController_unlocking():
	unlock_lock()


