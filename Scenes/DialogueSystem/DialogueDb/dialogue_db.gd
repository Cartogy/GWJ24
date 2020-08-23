extends Node


var dialogue_seq = {}
func _ready():
	for seq in get_children():
		dialogue_seq[seq.id] = seq

func get_diag_seq(s_id):
	return dialogue_seq[s_id]
