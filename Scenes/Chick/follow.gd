extends "../StateMachine/state.gd"

onready var chick = get_owner()

var max_distance_away = 2

var goal = Vector2()
var speed = 10
var direction = Vector2()

func enter():
	pass

func update(delta):
	var direction = direction_to_follow()
	chick.direction = direction
	chick.move_and_slide(chick.direction * chick.speed, Vector2(0,0))
	

## Main function to follow lead ##
func direction_to_follow():
	var goal_pos = calculate_destination(chick.get_lead(), chick.get_lead().get_gap())
	draw_destination(goal_pos)
	var distance = calculate_distance(goal_pos, chick.position)
	var velocity = Vector2(0,0)
	if distance > 1:
		velocity = calculate_direction(goal_pos, chick.position)
	return velocity






func calculate_destination(leader, gap):
	var position =  leader.position - leader.direction.normalized() * leader.get_gap()	# Position behind lead
	
	return position
	
func calculate_distance(pos_to_go, curr_pos):
	var direction = pos_to_go - curr_pos
	var distance = direction.length()
	
	return distance
	
func calculate_direction(pos_to_go, curr_pos):
	return (pos_to_go - curr_pos).normalized()
	
func draw_destination(goal):
	chick.set_circle_center(goal - chick.position)
	
func exit():
	pass
