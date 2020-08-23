extends Node

class_name DialogueSequence

export (Array, NodePath) var dialogues
export (String) var id

var d_index = 0

func get_next_dialogue():
	if dialogues.size() < d_index:
		var d = dialogues[d_index]
		d_index += 1
		return d.get_text()
	else:
		return null
