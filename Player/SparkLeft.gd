extends KinematicBody2D


var Speed = 50
var LifeTime = 1.5
var LifeSpawn = 0

func _physics_process(delta):
	var collision = move_and_collide(Vector2.LEFT* Speed)
	if collision and collision.collider.has_method("KillBySpark"):
		collision.collider.KillBySpark()
		queue_free()
	
	
	LifeSpawn+=delta
	if LifeSpawn>LifeTime:
		queue_free()
