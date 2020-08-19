extends "lock.gd"

func unlock():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
	
