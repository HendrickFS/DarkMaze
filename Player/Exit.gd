extends Node2D


var change=true

func _on_Area2D_body_entered(body):
	var Player = preload("res://Player/PlayerWithoutLayer.tscn")
	var player = Player.instance()
	player.position = Vector2(550,0)
	get_parent().call_deferred("add_child",player)
	queue_free()
	if change:
		change=false
		get_tree().change_scene("res://Screens/Dialog3.tscn")
	
