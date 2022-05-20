extends TouchScreenButton
onready var animation=$AnimatonPlayervar play=false
var time=2

func _on_TouchScreenButton_pressed():
	animation.play("Open")
	play=true
	
func _process(delta):
	if play:
		if time<=0:
			get_tree().change_scene("res://World/Maze.tscn")
		else:
			time-=delta

