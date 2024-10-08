extends Node3D

@onready var button_menu : BoxContainer = $Mainmenu/button
@onready var setting_menu : BoxContainer = $Mainmenu/setting_menu
var visibility = true

@onready var animation = $AnimationPlayer
var character_selection = false

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
	character_selection = !character_selection
	if character_selection:
		animation.play("camera_move")
	else:
		animation.play_backwards("camera_move")
