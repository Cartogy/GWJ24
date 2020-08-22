extends Node


#onready var packed_mute_off_button = load("res://UI/Buttons/MuteOffButton.tscn")
# Have Mute_off button be active in editor view
onready var packed_mute_on_button = load("res://UI/Buttons/MuteOnButton.tscn")

var mute_on_button
var mute_off_button

# Allows for simple toggle behaviour
enum MuteState { OFF, ON }
var current_state

# Called when the node enters the scene tree for the first time.
func _ready():
	mute_on_button = packed_mute_on_button.instance()
	#mute_off_button = packed_mute_off_button.instance()
	mute_off_button = get_child(0)
	current_state = MuteState.OFF

func toggle():
	match current_state:
		MuteState.OFF:
			remove_child(mute_off_button)
			add_child(mute_on_button)
			current_state = MuteState.ON
		MuteState.ON:
			remove_child(mute_on_button)
			add_child(mute_off_button)
			current_state = MuteState.OFF
