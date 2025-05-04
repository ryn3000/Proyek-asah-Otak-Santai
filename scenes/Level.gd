extends Control

@onready var question_label: Label = $QuestionLabel
@onready var answers: Array[Button] = [$Answer1, $Answer2, $Answer3, $Answer4]
@onready var label_score: Label = $LabelScore

var questions: Array = []
var current_question_index: int = 0
var all_questions: Array = []  # <- tambahkan ini


func _ready():
	if get_tree().current_scene.scene_file_path == "res://scenes/Level1.tscn":
		all_questions = [
	{"question": "Bisa terbang?", "answers": ["Kucing", "Burung", "Ikan", "Sapi"], "correct": 1},
	{"question": "Hidup di air?", "answers": ["Anjing", "Ayam", "Ikan", "Sapi"], "correct": 2},
	{"question": "Suka madu?", "answers": ["Ular", "Beruang", "Kucing", "Bebek"], "correct": 1},
	{"question": "Bisa ganti warna?", "answers": ["Kuda", "Bunglon", "Singa", "Jerapah"], "correct": 1},
	{"question": "Telinga panjang?", "answers": ["Kelinci", "Singa", "Sapi", "Burung"], "correct": 0},
	{"question": "Melata?", "answers": ["Burung", "Ular", "Sapi", "Anjing"], "correct": 1},
	{"question": "Suka wortel?", "answers": ["Anjing", "Kelinci", "Burung", "Sapi"], "correct": 1},
	{"question": "Kulit tebal?", "answers": ["Kucing", "Gajah", "Ikan", "Bebek"], "correct": 1},
	{"question": "Menggonggong?", "answers": ["Kucing", "Anjing", "Ayam", "Bebek"], "correct": 1},
	{"question": "Berbulu lebat?", "answers": ["Ikan", "Beruang", "Ular", "Kuda"], "correct": 1},
	{"question": "Bertanduk?", "answers": ["Gajah", "Kambing", "Kelinci", "Ayam"], "correct": 1},
	{"question": "Bisa terbang di malam hari?", "answers": ["Burung", "Kelelawar", "Ular", "Kucing"], "correct": 1},
	{"question": "Duri di tubuhnya?", "answers": ["Ikan buntal", "Landak", "Kucing", "Gajah"], "correct": 1},
	{"question": "Punya cangkang?", "answers": ["Kupu-kupu", "Siput", "Ular", "Kucing"], "correct": 1},
	{"question": "Berbisa?", "answers": ["Anjing", "Ular", "Bebek", "Kelinci"], "correct": 1},
	{"question": "Punya ekor panjang?", "answers": ["Kucing", "Ayam", "Burung", "Anjing"], "correct": 0},
	{"question": "Suka berkokok?", "answers": ["Ayam", "Bebek", "Burung", "Kucing"], "correct": 0},
	{"question": "Berjalan lambat?", "answers": ["Kelinci", "Kura-kura", "Anjing", "Burung"], "correct": 1},
	{"question": "Suka menggonggong?", "answers": ["Kucing", "Anjing", "Sapi", "Ayam"], "correct": 1},
	{"question": "Punya belalai?", "answers": ["Gajah", "Sapi", "Jerapah", "Ayam"], "correct": 0},
	{"question": "Hewan nokturnal?", "answers": ["Kelelawar", "Ayam", "Anjing", "Ikan"], "correct": 0},
	{"question": "Suka bersiul?", "answers": ["Burung", "Anjing", "Ular", "Kuda"], "correct": 0},
	{"question": "Berkaki dua?", "answers": ["Ayam", "Sapi", "Kuda", "Gajah"], "correct": 0},
	{"question": "Punya surai?", "answers": ["Singa", "Harimau", "Kucing", "Ular"], "correct": 0},
	{"question": "Hewan peliharaan?", "answers": ["Kucing", "Harimau", "Ular", "Sapi"], "correct": 0},
	{"question": "Punya cakar tajam?", "answers": ["Kelinci", "Kucing", "Sapi", "Gajah"], "correct": 1},
	{"question": "Bertelur?", "answers": ["Ayam", "Kelinci", "Anjing", "Kucing"], "correct": 0},
	{"question": "Hidup di gurun?", "answers": ["Kuda", "Unta", "Ayam", "Kucing"], "correct": 1},
	{"question": "Bisa berenang cepat?", "answers": ["Kucing", "Lumba-lumba", "Ayam", "Bebek"], "correct": 1},
	{"question": "Bersirip?", "answers": ["Ular", "Ikan", "Ayam", "Kuda"], "correct": 1},
	{"question": "Suka tanah basah?", "answers": ["Katak", "Burung", "Ular", "Anjing"], "correct": 0},
	{"question": "Bunyi meong?", "answers": ["Anjing", "Kucing", "Ayam", "Bebek"], "correct": 1},
	{"question": "Berbisa dan melata?", "answers": ["Kucing", "Ular", "Burung", "Ayam"], "correct": 1},
	{"question": "Berbulu dan bisa terbang?", "answers": ["Burung", "Kucing", "Anjing", "Ular"], "correct": 0},
	{"question": "Bertaring tajam?", "answers": ["Singa", "Ayam", "Sapi", "Burung"], "correct": 0},
	{"question": "Punya cangkang keras?", "answers": ["Siput", "Burung", "Kucing", "Sapi"], "correct": 0},
	{"question": "Suka menggali lubang?", "answers": ["Tikus", "Burung", "Sapi", "Ikan"], "correct": 0},
	{"question": "Bernafas di air?", "answers": ["Ikan", "Kuda", "Anjing", "Ular"], "correct": 0},
	{"question": "Suka susu?", "answers": ["Kucing", "Burung", "Ular", "Ayam"], "correct": 0},
	{"question": "Hewan mamalia?", "answers": ["Sapi", "Ayam", "Ular", "Ikan"], "correct": 0},
	{"question": "Punya tanduk dan suka makan rumput?", "answers": ["Kambing", "Ayam", "Kucing", "Bebek"], "correct": 0},
	{"question": "Bisa tidur sambil berdiri?", "answers": ["Kuda", "Ikan", "Ular", "Burung"], "correct": 0},
	{"question": "Hewan berkaki empat?", "answers": ["Anjing", "Ayam", "Bebek", "Ikan"], "correct": 0},
	{"question": "Suka berkubang?", "answers": ["Babi", "Kucing", "Kuda", "Ayam"], "correct": 0},
	{"question": "Kulitnya berbulu?", "answers": ["Gajah", "Beruang", "Ular", "Ikan"], "correct": 1},
	{"question": "Bernafas dengan insang?", "answers": ["Ikan", "Kucing", "Ular", "Anjing"], "correct": 0},
	{"question": "Punya kaki berselaput?", "answers": ["Bebek", "Ayam", "Sapi", "Kucing"], "correct": 0},
	{"question": "Hidup di pepohonan?", "answers": ["Burung", "Ikan", "Anjing", "Kuda"], "correct": 0},
	{"question": "Suka meloncat?", "answers": ["Kelinci", "Ikan", "Burung", "Ular"], "correct": 0},
	{"question": "Memiliki ekor besar?", "answers": ["Monyet", "Kucing", "Ayam", "Bebek"], "correct": 0}
]
	elif get_tree().current_scene.scene_file_path == "res://scenes/Level2.tscn":
		all_questions = [
	{"question": "Buah yang berwarna merah?", "answers": ["Pisang", "Apel", "Mangga", "Jeruk"], "correct": 1},
	{"question": "Buah yang kaya akan vitamin C?", "answers": ["Apel", "Pisang", "Jeruk", "Durian"], "correct": 2},
	{"question": "Buah berwarna kuning?", "answers": ["Jeruk", "Melon", "Pisang", "Salak"], "correct": 2},
	{"question": "Buah berduri?", "answers": ["Jambu", "Durian", "Apel", "Nangka"], "correct": 1},
	{"question": "Buah yang terkenal di Thailand?", "answers": ["Mangga", "Durian", "Jambu", "Kiwi"], "correct": 1},
	{"question": "Buah yang bisa dibuat jus segar?", "answers": ["Melon", "Durian", "Apel", "Salak"], "correct": 0},
	{"question": "Buah yang sering dijadikan manisan?", "answers": ["Jeruk", "Mangga", "Salak", "Pisang"], "correct": 2},
	{"question": "Buah yang sering dimakan dengan garam?", "answers": ["Mangga muda", "Apel", "Jeruk", "Pisang"], "correct": 0},
	{"question": "Buah berwarna hijau dan berbentuk bulat?", "answers": ["Melon", "Kiwi", "Apel", "Jeruk"], "correct": 1},
	{"question": "Buah yang bisa menjadi makanan pencuci mulut?", "answers": ["Nangka", "Durian", "Apel", "Mangga"], "correct": 3},
	{"question": "Buah yang mengandung biji besar di tengahnya?", "answers": ["Durian", "Mangga", "Apel", "Jeruk"], "correct": 1},
	{"question": "Buah yang tumbuh di pohon palem?", "answers": ["Kelapa", "Pisang", "Mangga", "Durian"], "correct": 0},
	{"question": "Buah yang bisa digunakan untuk membuat es krim?", "answers": ["Pisang", "Melon", "Apel", "Durian"], "correct": 1},
	{"question": "Buah yang banyak dikonsumsi di Asia?", "answers": ["Durian", "Mangga", "Pisang", "Kiwi"], "correct": 1},
	{"question": "Buah yang berwarna jingga?", "answers": ["Apel", "Jeruk", "Pisang", "Kiwi"], "correct": 1},
	{"question": "Buah yang berbentuk seperti bola kecil?", "answers": ["Jeruk", "Melon", "Apel", "Mangga"], "correct": 0},
	{"question": "Buah yang sering dimakan dengan es?", "answers": ["Mangga", "Melon", "Jeruk", "Apel"], "correct": 1},
	{"question": "Buah yang berbiji banyak?", "answers": ["Jeruk", "Apel", "Durian", "Nangka"], "correct": 3},
	{"question": "Buah dengan rasa manis dan sedikit asam?", "answers": ["Apel", "Mangga", "Durian", "Pisang"], "correct": 1},
	{"question": "Buah yang banyak ditemukan di tropis?", "answers": ["Durian", "Jeruk", "Apel", "Pisang"], "correct": 0},
	{"question": "Buah dengan kulit yang bisa dimakan?", "answers": ["Apel", "Pisang", "Mangga", "Durian"], "correct": 0},
	{"question": "Buah yang memiliki banyak jenis?", "answers": ["Mangga", "Pisang", "Jeruk", "Kiwi"], "correct": 0},
	{"question": "Buah yang dagingnya berwarna putih?", "answers": ["Melon", "Kelapa", "Apel", "Mangga"], "correct": 1},
	{"question": "Buah yang bisa dibuat menjadi salad?", "answers": ["Apel", "Melon", "Jeruk", "Mangga"], "correct": 1},
	{"question": "Buah yang memiliki rasa sangat manis?", "answers": ["Durian", "Mangga", "Jeruk", "Kiwi"], "correct": 1},
	{"question": "Buah yang dagingnya berwarna kuning?", "answers": ["Apel", "Pisang", "Jeruk", "Mangga"], "correct": 3},
	{"question": "Buah yang berwarna merah dan manis?", "answers": ["Apel", "Mangga", "Durian", "Pisang"], "correct": 0},
	{"question": "Buah dengan aroma khas?", "answers": ["Pisang", "Durian", "Jeruk", "Mangga"], "correct": 1},
	{"question": "Buah yang bisa digunakan untuk membuat jus sehat?", "answers": ["Jeruk", "Pisang", "Apel", "Kiwi"], "correct": 0},
	{"question": "Buah yang banyak ditemukan di kebun?", "answers": ["Mangga", "Pisang", "Durian", "Jeruk"], "correct": 0},
	{"question": "Buah yang bisa dipakai untuk obat?", "answers": ["Mangga", "Apel", "Jeruk nipis", "Durian"], "correct": 2},
	{"question": "Buah yang memiliki banyak serat?", "answers": ["Pisang", "Durian", "Melon", "Mangga"], "correct": 0},
	{"question": "Buah yang bisa digunakan untuk smoothies?", "answers": ["Melon", "Pisang", "Durian", "Jeruk"], "correct": 1},
	{"question": "Buah yang banyak ditemukan di supermarket?", "answers": ["Apel", "Durian", "Mangga", "Kiwi"], "correct": 0},
	{"question": "Buah yang bisa dimakan mentah?", "answers": ["Pisang", "Durian", "Jeruk", "Apel"], "correct": 0},
	{"question": "Buah yang berwarna ungu?", "answers": ["Anggur", "Jeruk", "Apel", "Mangga"], "correct": 0},
	{"question": "Buah yang sering dijadikan rujak?", "answers": ["Mangga", "Jeruk", "Melon", "Durian"], "correct": 0},
	{"question": "Buah yang berbiji besar di dalamnya?", "answers": ["Mangga", "Durian", "Jeruk", "Melon"], "correct": 0},
	{"question": "Buah yang berkulit hijau?", "answers": ["Kiwi", "Jeruk", "Apel", "Nangka"], "correct": 0},
	{"question": "Buah yang kaya antioksidan?", "answers": ["Kiwi", "Pisang", "Melon", "Jeruk"], "correct": 0},
	{"question": "Buah yang berbentuk oval?", "answers": ["Avokad", "Pisang", "Jeruk", "Durian"], "correct": 0},
	{"question": "Buah yang bisa dimakan langsung dari pohon?", "answers": ["Pisang", "Mangga", "Durian", "Apel"], "correct": 0},
	{"question": "Buah dengan tekstur lembut?", "answers": ["Pisang", "Jeruk", "Durian", "Apel"], "correct": 0},
	{"question": "Buah yang berwarna hijau gelap?", "answers": ["Avokad", "Apel", "Melon", "Durian"], "correct": 0},
	{"question": "Buah yang dagingnya banyak airnya?", "answers": ["Melon", "Durian", "Mangga", "Apel"], "correct": 0},
	{"question": "Buah dengan kulit kasar?", "answers": ["Durian", "Melon", "Apel", "Kiwi"], "correct": 0},
	{"question": "Buah yang memiliki biji kecil?", "answers": ["Semangka", "Pisang", "Durian", "Apel"], "correct": 0},
	{"question": "Buah yang biasa digunakan untuk membuat selai?", "answers": ["Apel", "Jeruk", "Durian", "Kiwi"], "correct": 0}
]
	elif get_tree().current_scene.scene_file_path == "res://scenes/Level3.tscn":
		all_questions = [
	{"question": "Alat yang digunakan untuk menyapu lantai?", "answers": ["Sapu", "Kriket", "Sapu Botol", "Mop"], "correct": 0},
	{"question": "Tempat tidur di rumah?", "answers": ["Kasur", "Kursi", "Meja", "Lemari"], "correct": 0},
	{"question": "Alat untuk memasak nasi?", "answers": ["Rice Cooker", "Kompor", "Oven", "Microwave"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk duduk?", "answers": ["Kursi", "Meja", "Lemari", "Bantal"], "correct": 0},
	{"question": "Alat untuk memotong kertas?", "answers": ["Gunting", "Pisau", "Kapak", "Solder"], "correct": 0},
	{"question": "Alat yang digunakan untuk mencuci piring?", "answers": ["Spons", "Ember", "Sikat", "Piring"], "correct": 0},
	{"question": "Peralatan untuk tidur di ruang tamu?", "answers": ["Sofa", "Kasur", "Lemari", "Kursi"], "correct": 0},
	{"question": "Tempat untuk menaruh pakaian?", "answers": ["Lemari", "Meja", "Bantal", "Kursi"], "correct": 0},
	{"question": "Benda yang digunakan untuk menyiram tanaman?", "answers": ["Ember", "Cangkir", "Siram", "Vas"], "correct": 0},
	{"question": "Alat yang digunakan untuk membersihkan debu?", "answers": ["Kain lap", "Kipas angin", "Saputangan", "Sapu"], "correct": 0},
	{"question": "Tempat untuk menyimpan makanan?", "answers": ["Kulkas", "Lemari", "Dapur", "Meja"], "correct": 0},
	{"question": "Alat yang digunakan untuk memasak telur?", "answers": ["Penggorengan", "Oven", "Kompor", "Mangkuk"], "correct": 0},
	{"question": "Benda yang digunakan untuk membaca?", "answers": ["Buku", "Komputer", "Lampu", "Kaca"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk menulis?", "answers": ["Meja", "Pensil", "Kertas", "Buku"], "correct": 1},
	{"question": "Alat yang digunakan untuk melihat jam?", "answers": ["Jam tangan", "Kaca", "Ponsel", "Cermin"], "correct": 0},
	{"question": "Benda yang digunakan untuk menggantung pakaian?", "answers": ["Gantungan", "Lemari", "Kasur", "Sofa"], "correct": 0},
	{"question": "Alat yang digunakan untuk memasak mie?", "answers": ["Panci", "Mikrofon", "Kompor", "Sendok"], "correct": 0},
	{"question": "Benda yang digunakan untuk menutupi tubuh saat tidur?", "answers": ["Selimut", "Bantal", "Kasur", "Meja"], "correct": 0},
	{"question": "Benda yang digunakan untuk menaruh makanan?", "answers": ["Piring", "Mangkok", "Sendok", "Garpu"], "correct": 0},
	{"question": "Tempat untuk mencuci pakaian?", "answers": ["Ember", "Mesin cuci", "Sikat", "Sabun"], "correct": 1},
	{"question": "Alat yang digunakan untuk menghangatkan makanan?", "answers": ["Microwave", "Kompor", "Oven", "Kulkas"], "correct": 0},
	{"question": "Benda yang digunakan untuk memotong rambut?", "answers": ["Gunting rambut", "Cukur", "Sisir", "Kuku"], "correct": 0},
	{"question": "Alat yang digunakan untuk membersihkan lantai?", "answers": ["Sapu", "Ember", "Spons", "Penggaruk"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk membuat kopi?", "answers": ["Cangkir", "Kopi", "Mesin Kopi", "Gelas"], "correct": 2},
	{"question": "Benda yang digunakan untuk membuka botol?", "answers": ["Pembuka botol", "Pisau", "Gunting", "Tuas"], "correct": 0},
	{"question": "Alat yang digunakan untuk mencuci tangan?", "answers": ["Sabun", "Ember", "Cairan pembersih", "Kran air"], "correct": 0},
	{"question": "Benda yang digunakan untuk melipat pakaian?", "answers": ["Meja lipat", "Gantungan", "Setrika", "Kursi"], "correct": 0},
	{"question": "Alat yang digunakan untuk menyeterika pakaian?", "answers": ["Setrika", "Sapu", "Kursi", "Ember"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk menyimpan sepatu?", "answers": ["Rak sepatu", "Lemari", "Meja", "Kursi"], "correct": 0},
	{"question": "Benda yang digunakan untuk menutup pintu?", "answers": ["Pintu", "Kunci", "Gagang", "Palu"], "correct": 1},
	{"question": "Perabotan untuk menaruh makanan panas?", "answers": ["Talenan", "Kuali", "Panci", "Wadah panas"], "correct": 3},
	{"question": "Benda yang digunakan untuk melindungi dari hujan?", "answers": ["Payung", "Topi", "Jakarta", "Sepatu"], "correct": 0},
	{"question": "Alat yang digunakan untuk menggali tanah?", "answers": ["Cangkul", "Palu", "Sapu", "Rake"], "correct": 0},
	{"question": "Benda yang digunakan untuk menggulung kertas?", "answers": ["Roller", "Gunting", "Plester", "Pensil"], "correct": 0},
	{"question": "Benda yang digunakan untuk mengikat rambut?", "answers": ["Ikatan rambut", "Gunting", "Sisir", "Tali"], "correct": 0},
	{"question": "Benda yang digunakan untuk melindungi mata dari sinar matahari?", "answers": ["Kacamata", "Topi", "Handuk", "Payung"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk menaruh alat makan?", "answers": ["Meja makan", "Lemari", "Kursi", "Sofa"], "correct": 0},
	{"question": "Benda yang digunakan untuk menyemir sepatu?", "answers": ["Sikat sepatu", "Ember", "Kain lap", "Sabun"], "correct": 0},
	{"question": "Alat untuk menaruh benda saat bekerja?", "answers": ["Meja", "Kursi", "Lemari", "Kasur"], "correct": 0},
	{"question": "Benda yang digunakan untuk mengukur suhu?", "answers": ["Termometer", "Jam", "Pendeteksi", "Kaca"], "correct": 0},
	{"question": "Perabotan yang digunakan untuk menaruh makanan?", "answers": ["Kulkas", "Panci", "Lemari", "Piring"], "correct": 0},
	{"question": "Benda yang digunakan untuk menulis di papan?", "answers": ["Spidol", "Pensil", "Pena", "Tinta"], "correct": 0},
	{"question": "Benda yang digunakan untuk mengikat barang?", "answers": ["Tali", "Gunting", "Kain", "Sampul"], "correct": 0},
	{"question": "Alat yang digunakan untuk menyiram tanaman?", "answers": ["Ember", "Vas", "Kran", "Hose"], "correct": 0},
	{"question": "Benda yang digunakan untuk meratakan tanah?", "answers": ["Rake", "Cangkul", "Gali", "Sisir"], "correct": 0}
]


	questions = get_random_questions(all_questions, 5)	
	update_ui()
	load_question()

func update_ui():
	label_score.text = "Poin: " + str(GameManager.score)

func get_random_questions(source_array: Array, count: int) -> Array:
	var temp_array = source_array.duplicate()
	temp_array.shuffle()
	return temp_array.slice(0, count)

func load_question():
	if current_question_index < questions.size():
		var q = questions[current_question_index]
		question_label.text = q["question"]

		for i in range(answers.size()):
			answers[i].text = q["answers"][i]
			answers[i].modulate = Color(1, 1, 1, 1)  # Reset warna ke putih
			answers[i].disabled = false  # Aktifkan kembali tombol

			# Perbaikan: cek koneksi sebelum menghubungkan ulang sinyal
			if answers[i].pressed.is_connected(_on_answer_pressed):
				answers[i].pressed.disconnect(_on_answer_pressed)

			answers[i].pressed.connect(Callable(self, "_on_answer_pressed").bind(i))
	else:
		print("Semua pertanyaan selesai, kembali ke menu dalam 2 detik")
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://scenes/Menu.tscn")

func _on_answer_pressed(index: int):
	var correct_index = questions[current_question_index]["correct"]

	for btn in answers:
		btn.disabled = true  

	if index == correct_index:
		GameManager.add_score(5)
		AudioManager.play_correct()  # ✅ Suara jawaban benar
	else:
		AudioManager.play_wrong()  # ❌ Suara jawaban salah
		answers[correct_index].modulate = Color(0, 1, 0)

	update_ui()
	await get_tree().create_timer(1.5).timeout  
	current_question_index += 1
	load_question()


