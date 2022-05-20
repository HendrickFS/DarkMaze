extends KinematicBody2D

var random = RandomNumberGenerator.new()
var Speed=10
var Velocity = Vector2.ZERO
var Time = 5
var TimeChange = 1
func _physics_process(delta):
	
	if Time<=0:
		queue_free()
		Time=5
	else:
		Time-=delta
		spawn()
	var collision = move_and_collide(Velocity)
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
		queue_free()
func spawn():
	var RandDirection=random.randf_range(0,4)
	if RandDirection>=0 and RandDirection<=1:
		Velocity.x=-Speed
		Velocity.y=-Speed
	elif RandDirection>1 and RandDirection<=2:
		Velocity.x=-Speed
		Velocity.y=Speed
	elif RandDirection>2 and RandDirection<=3:
		Velocity.x=Speed
		Velocity.y=-Speed
	elif RandDirection>3:
		Velocity.x=Speed
		Velocity.y=Speed
func KillBySpark():
	queue_free()
