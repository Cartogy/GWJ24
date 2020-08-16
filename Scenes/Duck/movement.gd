extends Node

onready var duck = get_parent()

var velocity = Vector2()
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-1)
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0,1)
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2(1,0)
	elif Input.is_action_pressed("ui_left"):
		velocity = Vector2(-1,0)
		
	if velocity.x != 0 && velocity.y != 0:
		duck.change_direction(velocity)
	

func _physics_process(delta):
	get_input()
	duck.move_and_slide(velocity * 10,Vector2(1,0))
	
