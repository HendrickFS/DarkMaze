extends Node2D
onready var animation = $AnimationPlayer
var play=false
var time=2

func _on_TouchScreenButton_pressed():
	
	play=true
	
func _process(delta):
	if play:
		if time<=0:
			get_tree().change_scene("res://World/Maze.tscn")
		else:
			time-=delta

