extends Node

#onready var music_player = $MusicPlayer
#onready var sound_player = $SoundPlayer
var sound_player

#var chirp_calm = preload("res://Audio/SFX/Chirps1.ogg")
#var chirp_stress = preload("res://Audio/SFX/Chirps2.ogg")
#var quack_angry = preload("res://Audio/SFX/Quack1.ogg")
var quack_neutral = preload("res://Audio/SFX/Quack2.ogg")
#var quack_secret = preload("res://Audio/SFX/Quack3.ogg")

#var possible_music = [
#preload("res://res://Audio/"),
#preload("res://res://Audio/"),
#]

func _ready():
#	randomize()
#	set_volume()
#	play_random_music()
#	if sound_player == null:
#		var sound_player = $SoundPlayer
#		print_debug(sound_player)
#	print_debug(sound_player)
	var sound_player = get_child(1)
	print_debug("get_child: ",get_child(0))
	print_debug("get_children",get_children())
	print_debug("get_child_count",get_child_count())
#	pass

#func play_random_music():
#	var temp = floor(rand_range(0, possible_music.size()))
#	music_player.stream = possible_music[temp]
#	music_player.play()

#func play_chirp_calm():
#	if sound_player:
#		var sound_player = $SoundPlayer
#	sound_player.stream = chirp_calm
#	sound_player.play()

#func play_chirp_stress():
#	sound_player.stream = chirp_stress
#	sound_player.play()

#func play_quack_angry():
#	sound_player.stream = quack_angry
#	sound_player.play()

func play_quack_neutral():
#	if sound_player == null:
#	var sound_player = $"SoundPlayer"
#		print_debug($SoundPlayer)
	print_debug(sound_player)
#	sound_player.stream = quack_neutral
#	sound_player.play()

#func play_quack_secret():
#	sound_player.stream = quack_secret
#	sound_player.play()

#func set_volume():
#	print_debug(sound_player)
#	if ConfigManager.sound_on:
##		music_player.volume_db = -15
#		sound_player.volume_db = -15
#	else:
##		music_player.volume_db = -80
#		sound_player.volume_db = -80
