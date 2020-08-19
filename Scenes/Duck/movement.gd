extends Node

onready var duck = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	# Calculate new forward vector
	var forward = move_forward(duck.get_forward_v(), duck.get_desired_direction_v())
	
	duck.move_and_slide(forward * duck.speed,Vector2(1,0))
	update_position_entity(duck.get_global_position())	# Tell the Item Manager to update my position
	if duck.get_slide_count() > 0:
		var box = duck.get_slide_collision(0).collider as Box
		if box:
			box.apply_force(duck.get_desired_direction_v(), duck.position)
		
	
# interpolate forward vector and desired direction to get vector in between
func move_forward(forward_v, desired_v):
	var i_v = Vector2(0,0)
	if desired_v != Vector2(0,0):
		i_v = forward_v
		if desired_v.x != 0 || desired_v.y != 0:
			i_v = lerp(forward_v, desired_v, duck.steering)
			duck.change_direction(i_v)
	return i_v
	
func update_position_entity(position):
	duck.emit_signal("update_position_entity", position)
	
