extends Control

@onready var level_1_button: Button = $ButtonLevel1
@onready var level_2_button: Button = $ButtonLevel2
@onready var unlock_label: Label = $UnlockLabel
@onready var score_label: Label = $ScoreLabel
@onready var level_3_button: Button = $ButtonLevel3
@onready var unlock_label_3: Label = $UnlockLabel3
@onready var petunjuk_panel: Panel = $PetunjukPanel
@onready var petunjuk_button: Button = $PetunjukButton
@onready var close_button: Button = $PetunjukPanel/CloseButton
@onready var settings_panel: Panel = $SettingsPanel
@onready var pengaturan_button: TextureButton = $PengaturanButton
@onready var back_button: Button = $SettingsPanel/BackButton
@onready var music_slider: HSlider = $SettingsPanel/MusicSlider
@onready var sfx_slider: HSlider = $SettingsPanel/SFXSlider
@onready var exit_button: Button = $SettingsPanel/ExitButton



func _ready():
	update_ui()
	
	if not level_1_button.pressed.is_connected(_on_level_1_pressed):
		level_1_button.pressed.connect(_on_level_1_pressed)

	if not level_2_button.pressed.is_connected(_on_level_2_pressed):
		level_2_button.pressed.connect(_on_level_2_pressed)


func update_ui():
	score_label.text = "Poin: " + str(GameManager.score)

	# Level 2 (Buah-buahan)
	if GameManager.is_level_2_unlocked:
		level_2_button.disabled = false
		unlock_label.visible = true
		unlock_label.text = "Soal Buah-Buahan terbuka!"
	else:
		level_2_button.disabled = true
		unlock_label.visible = true
		unlock_label.text = "Kumpulkan 25 poin untuk membuka soal Buah-Buahan!"

	# Level 3 (Benda-benda di rumah)
	if GameManager.is_level_3_unlocked:
		level_3_button.disabled = false
		unlock_label_3.visible = true
		unlock_label_3.text = "Soal Benda di Rumah terbuka!"
		unlock_label.visible = false  # Sembunyikan unlock_label jika sudah 50 poin
	else:
		level_3_button.disabled = true
		unlock_label_3.visible = false
	settings_panel.visible = false

	pengaturan_button.pressed.connect(_on_PengaturanButton_pressed)
	back_button.pressed.connect(_on_BackButton_pressed)
	exit_button.pressed.connect(_on_ExitButton_pressed)
	# Atur posisi slider berdasarkan volume saat ini
	music_slider.value = AudioManager.get_music_volume()
	sfx_slider.value = AudioManager.get_sfx_volume()

	music_slider.value_changed.connect(_on_MusicSlider_value_changed)
	sfx_slider.value_changed.connect(_on_SFXSlider_value_changed)
		# Update volume saat slider digeser
	sfx_slider.connect("value_changed", Callable(self, "_on_sfx_slider_value_changed"))
	
	# Mainkan contoh suara ketika slider dilepas
	sfx_slider.connect("drag_ended", Callable(self, "_on_sfx_slider_drag_ended"))
func _on_petunjuk_button_pressed():
	petunjuk_panel.visible = true

func _on_close_button_pressed():
	petunjuk_panel.visible = false


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _on_level_2_pressed():
	if GameManager.is_level_2_unlocked:  # Jika sudah terbuka, langsung ke Level 2
		get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	elif GameManager.can_unlock_level_2():
		GameManager.unlock_level_2()
		update_ui()  # Perbarui UI setelah membuka level


func _on_level_3_pressed():
	if GameManager.is_level_3_unlocked:
		get_tree().change_scene_to_file("res://scenes/Level3.tscn")
	elif GameManager.can_unlock_level_3():
		GameManager.unlock_level_3()
		update_ui()





func _on_PengaturanButton_pressed():
	settings_panel.visible = true


func _on_BackButton_pressed():
	settings_panel.visible = false


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_MusicSlider_value_changed(value):
	AudioManager.set_music_volume(value)


func _on_SFXSlider_value_changed(value):
	AudioManager.set_sfx_volume(value)


func  _on_sfx_slider_drag_ended(value_changed):
	AudioManager.play_correct()  # Bisa diganti ke play_wrong() juga untuk variasi
