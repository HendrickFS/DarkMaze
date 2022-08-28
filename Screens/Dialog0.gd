extends Node2D


func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Screens/Dialog.tscn")

func _on_Enter01_pressed():
	get_tree().change_scene("res://Screens/Dialog.tscn")
