extends Node2D




func _on_Triangle_dead(dead):
	if dead:
		queue_free()
