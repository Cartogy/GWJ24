extends Node

enum State { PLAYING, OFF}
var current_state;

func _ready():
	current_state = State.OFF
	
func _input(event):
	if Input.is_action_just_pressed("next_diag") && current_state == State.PLAYING:
		$DialogueUI.play_next_dialogue()

func _on_Play_Dialogue(d_id):
	# 
	var diag_seq = $DialogueDB.get_diag_seq(d_id)
	$DialogueUI.set_diag_seq(diag_seq)
	$DialogueUI.show()
	current_state = State.PLAYING

func _on_Dialogue_Finished():
	$DialogueUI.clear()
	$DialogueUI.hide()
	current_state = State.OFF
