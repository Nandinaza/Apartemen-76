extends Node3D

@onready var button_menu : BoxContainer = $Mainmenu/button
@onready var setting_menu : BoxContainer = $Mainmenu/setting_menu
@onready var JudulGame : RichTextLabel = $"Mainmenu/Judul Game"
@onready var character_select : Control = $Mainmenu/Character_selection
var visibility = true

@onready var animation = $AnimationPlayer
var character_selection = false

@onready var BGM = $Mainmenu/setting_menu/HBoxContainer2/BGM
@onready var SFX = $Mainmenu/setting_menu/HBoxContainer2/SFX

@onready var audio = [
	$AudioStreamPlayer3D
]

func _ready():
	audio[0].play()
	
func _on_settting_pressed():
	visibility = !visibility
	if visibility:
		button_menu.visible = true
		setting_menu.visible = false
	else:
		setting_menu.visible = true
		button_menu.visible = false


func _on_exit_pressed():
	get_tree().quit()


func _on_play_pressed():
	#get_tree().change_scene_to_file("res://godot-scene/Overworld.tscn")
	
	character_selection = !character_selection
	if character_selection:
		animation.play("camera_move")
		JudulGame.visible = false
		button_menu.visible = false
		character_select.visible = true
	else:
		animation.play_backwards("camera_move")
		JudulGame.visible = true
		button_menu.visible = true


func _on_touch_screen_button_pressed():
	_on_settting_pressed()



func _on_ok_pressed():
	get_tree().change_scene_to_file("res://godot-scene/Overworld.tscn")


func _on_back_pressed():
	_on_play_pressed()
	character_select.visible = false
