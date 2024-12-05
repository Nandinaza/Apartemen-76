extends Control

var index

var character = ["Nandi","Akbar","Usmin"]
@export var charactr_icon : Array[Texture]
var description = [
	"membawa dua barang sekaligus",
	"ketika mengeliminasi musuh, buat musuh spawn +20 detik lebih lama",
	"menambah kecepatan lari untuk diri sendiri sebesar 25%, dan 10% ke semua anggota team"
]

@onready var ch_name = $Panel/Character_name
@onready var desk = $Panel/Description
@onready var rect = $Hero

func _ready():
	index = 1
	rect.texture = charactr_icon[0]
	ch_name.text = character[0]
	desk.text = description[0]

func refresh():
	ch_name.text = character[index-1]
	desk.text = description[index-1]
	rect.texture = charactr_icon[index-1]

func _on_left_pressed():
	if index == 1:
		index = 3
	else:
		index -= 1
	refresh()

func _on_right_pressed():
	if index == 3:
		index = 1
	else:
		index += 1
	refresh()
