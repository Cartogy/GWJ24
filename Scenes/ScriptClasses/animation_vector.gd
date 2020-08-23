extends RayCast2D

class_name AnimationVector

var degree_apart = 15.0

onready var vector_entity : VectorMovement = get_owner()
var anim : AnimatedSprite

func _ready():
	anim = vector_entity.get_node("AnimatedSprite")

func _process(delta):
	animation_direction()

func animation_direction():
	var degrees = degree_between_vectors(vector_entity.get_forward_v(), 
									get_cast_to())
									
	var forward_v = vector_entity.get_forward_v()
	
	# Flip sprites
	if forward_v.x < 0:
		anim.flip_h = true
	else: 
		anim.flip_h = false
		
	# Choose Top or Bottom sprites
	if forward_v.y < 0:	# Top
		if degrees <= degree_apart:
			anim.play("side")
		elif degrees > 15.0 && degrees <= 45.0 + degree_apart:
			anim.play("top_right")
		elif degrees > 45.0 + degree_apart && degrees < 90.0 + degree_apart:
			anim.play("up")
		elif degrees > 90 + degree_apart && degrees < 135 + degree_apart:
			anim.play("top_right")
		elif degrees > 135 + degree_apart && degree_apart <= 180.0:
			anim.play("side")
	else:	# Bottom
		if degrees <= degree_apart:
			anim.play("side")
		elif degrees > 15.0 && degrees <= 45.0 + degree_apart:
			anim.play("bottom_right")
		elif degrees > 45.0 + degree_apart && degrees <= 90.0 + degree_apart:
			anim.play("down")
		elif degrees > 90 + degree_apart && degrees < 135 + degree_apart:
			anim.play("bottom_right")
		elif degrees > 135 + degree_apart && degree_apart <= 180.0:
			anim.play("side")
		

	
func degree_between_vectors(f_v: Vector2, d_v: Vector2) -> float:
	var dot = f_v.dot(d_v)
	var fv_length = f_v.length() * d_v.length()
	if fv_length > 0:
		var rad = acos(dot / fv_length)
	
		var deg = rad * (180.0 / PI)
		return deg
	
	return 0.0
