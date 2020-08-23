extends Control



var dialogue_seq : DialogueSequence
var dialogue_manager

func _ready():
	dialogue_manager = get_parent()

func set_diag_seq(seq):
	dialogue_seq = seq

func play_next_dialogue():
	var n_dialogue = dialogue_seq.get_next_dialogue()
	if n_dialogue == null:
		dialogue_manager.finish_sequence()
	else:
		set_dialogue_text(n_dialogue)
		
func set_dialogue_text(d):
	$Node/Label.text = d

func clear():
	dialogue_seq = null
