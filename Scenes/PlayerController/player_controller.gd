extends Node2D

export (float) var speed

func get_input():
	if Input.is_action_pressed("duck_cmd"): 
		$StateMachine.change_state("DuckController")
	elif Input.is_action_pressed("chick_cmd"):
		$StateMachine.change_state("ChickController")

func _physics_process(delta):
	get_input()
	$StateMachine.tick(delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

