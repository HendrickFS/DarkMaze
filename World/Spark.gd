extends KinematicBody2D
var velocity = Vector2.ZERO
func _physics_process(delta):
	var collision = move_and_collide(velocity)
	if collision and collision.collider.has_method("passed"):
		get_tree().change_scene("res://Screens/Dialog2.tscn")
func passed():
	queue_free()
