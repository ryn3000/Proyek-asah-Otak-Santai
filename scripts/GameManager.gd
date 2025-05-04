extends Node

var score: int = 0
var is_level_2_unlocked: bool = false

func add_score(amount: int):
	score += amount
	check_unlock_level_2()
	check_unlock_level_3()


func check_unlock_level_2():
	if score >= 25 and not is_level_2_unlocked:
		is_level_2_unlocked = true
		print("Soal Buah-Buahan berhasil dibuka!")

func can_unlock_level_2() -> bool:
	return score >= 25  # Level 2 bisa dibuka jika poin cukup

func unlock_level_2():
	if not is_level_2_unlocked and can_unlock_level_2():  
		score -= 25  # Skor hanya dikurangi **sekali** saat membuka pertama kali
		is_level_2_unlocked = true
		print("Soal Buah-Buahan resmi dibuka, skor dikurangi 25 poin")
	
	# Pindah ke Level 2 setelah terbuka
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	
var is_level_3_unlocked: bool = false

func check_unlock_level_3():
	if score >= 50 and not is_level_3_unlocked:
		is_level_3_unlocked = true
		print("Soal Benda di Rumah berhasil dibuka!")

func can_unlock_level_3() -> bool:
	return score >= 50

func unlock_level_3():
	if not is_level_3_unlocked and can_unlock_level_3():
		score -= 50
		is_level_3_unlocked = true
		print("Soal Benda di Rumah resmi dibuka, skor dikurangi 50 poin")
		get_tree().change_scene_to_file("res://scenes/Level3.tscn")

