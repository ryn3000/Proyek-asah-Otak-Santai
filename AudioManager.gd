extends Node

@onready var bgm_player: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var sfx_correct: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var sfx_wrong: AudioStreamPlayer = AudioStreamPlayer.new()

# Gunakan bgm_player sebagai music_player
@onready var music_player: AudioStreamPlayer = bgm_player
# Gunakan sfx_correct sebagai sfx_player default untuk pengaturan volume
@onready var sfx_player: AudioStreamPlayer = sfx_correct

func _ready():
	add_child(bgm_player)
	add_child(sfx_correct)
	add_child(sfx_wrong)

	bgm_player.stream = load("res://audio/bg_music.mp3")
	sfx_correct.stream = load("res://audio/correct.wav")
	sfx_wrong.stream = load("res://audio/wrong.wav")

	bgm_player.volume_db = -10
	bgm_player.play()

func play_correct():
	sfx_correct.play()

func play_wrong():
	sfx_wrong.play()

func set_music_volume(vol):
	if music_player:
		music_player.volume_db = linear_to_db(vol)

func set_sfx_volume(vol):
	var db = linear_to_db(vol)
	if sfx_correct:
		sfx_correct.volume_db = db
	if sfx_wrong:
		sfx_wrong.volume_db = db


func get_music_volume():
	return db_to_linear(music_player.volume_db)

func get_sfx_volume():
	return db_to_linear(sfx_correct.volume_db)

