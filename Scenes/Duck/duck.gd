extends KinematicBody2D

export (int) var speed

var direction = Vector2(0, 0)

var gap_per_chick = 2

func _ready():
	pass # Replace with function body.

func change_direction(dir):
	direction = dir
