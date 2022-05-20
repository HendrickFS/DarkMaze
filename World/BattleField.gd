extends Node2D


onready var animation=$AnimationPlayer
var reset=30
func _process(delta):
	animation.play("CloudsMove")
	if reset>0:
		reset-=delta
	else:
		animation.play("CloudsMove")


func _on_DeadDestiny_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://Screens/Dialog4.tscn")


func _on_DeadDestiny_body_entered(body):
	get_tree().change_scene("res://Screens/Dialog4.tscn")
