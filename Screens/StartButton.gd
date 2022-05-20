extends TouchScreenButton
var time=2
var play=false
onready var animation = $AnimationPlayer
func _on_StartButton_pressed():
	animation.play("Open")
	play=true
	
func _process(delta):
	if play:
		if time<=0:
			get_tree().change_scene("res://Screens/Dialog.tscn")
		else:
			time-=delta
