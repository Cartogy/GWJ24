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
		cur_entity_state = Entity_State.DUCK
		cur_entity_item = $DuckItems
	elif state == "Flock":
		cur_entity_state = Entity_State.FLOCK
		cur_entity_item = $FlockItems

func update_entity_position(pos):
	cur_entity_item.set_entity_position(pos)

func deactivate_item(item):
	item.set_physics_process(false)
	cur_entity_item.current_item = item
	cur_entity_item.has_item = true
	
func activate_item():
	cur_entity_item.current_item.set_physics_process(true)
	cur_entity_item.current_item.global_position = cur_entity_item.get_entity_position()
	cur_entity_item.has_item = false
	cur_entity_item.current_item = null
		
func pickup_item(item):
	if cur_entity_item.has_item == false:
		cur_entity_item.set_current_item(item)
		deactivate_item(item)
		


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
