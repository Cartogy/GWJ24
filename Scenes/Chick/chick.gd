extends KinematicBody2D

export (NodePath) var duck_path
var duck

var speed = 10

func _ready():
	duck = get_node(duck_path)
	print(duck.name)
	
func _physics_process(delta):
	$StateMachine.tick(delta)
	
func get_duck():
	return duck
