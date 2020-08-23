extends Node

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

var chirp_calm = preload("res://Audio/SFX/Chirps1.ogg")
var chirp_stress = preload("res://Audio/SFX/Chirps2.ogg")
var quack_angry = preload("res://Audio/SFX/Quack1.ogg")
var quack_neutral = preload("res://Audio/SFX/Quack2.ogg")
var quack_secret = preload("res://Audio/SFX/Quack3.ogg")
var ui_button = preload("res://Audio/SFX/UIButton.ogg")
var game_switch = preload("res://Audio/SFX/Switch.ogg")

var main_theme = preload("res://Audio/Music/DuckThemeMaster.wav")

var possible_music = [
preload("res://Audio/Music/DuckTrack2Master.wav"),
preload("res://Audio/Music/DuckTrack3Master.wav")
]

func _ready():
	randomize()
	set_volume()

func play_random_music():
	var temp = floor(rand_range(0, possible_music.size()))
	music_player.stream = possible_music[temp]
	music_player.play()

func play_chirp_calm():
	sound_player.stream = chirp_calm
	sound_player.play()

func play_chirp_stress():
	sound_player.stream = chirp_stress
	sound_player.play()

func play_quack_angry():
	sound_player.stream = quack_angry
	sound_player.play()

func play_quack_neutral():
	sound_player.stream = quack_neutral
	sound_player.play()

func play_quack_secret():
	sound_player.stream = quack_secret
	sound_player.play()

func play_ui_button():
	sound_player.stream = ui_button
	sound_player.play()

func play_game_switch():
	sound_player.stream = game_switch
	sound_player.play()

func play_theme():
	music_player.stream = main_theme
	music_player.play()

func set_volume():
	if ConfigManager.sound_on:
		music_player.volume_db = -15
		sound_player.volume_db = -15
	else:
		music_player.volume_db = -80
		sound_player.volume_db = -80
