extends KinematicBody2D

var random = RandomNumberGenerator.new()
var Speed=6
var Velocity = Vector2.ZERO
var TimeChange = 0.1
var TimeSpark=1.2
onready var Animation = $AnimationPlayer
var hp =10
signal Damage(hp)
var dead=false
signal dead(dead)

func _physics_process(delta):
	Animation.play("Spin")
	if TimeChange>0:
		TimeChange-=delta
	else:
		TimeChange=0.3
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
		
	if TimeSpark>0:
		TimeSpark-=delta
	else:
		TimeSpark=1.2
		var Spark = preload("res://Enemies/Spark.tscn")
		var FiredSpark = Spark.instance()
		FiredSpark.position=Vector2(position.x,position.y)
		get_parent().call_deferred("add_child",FiredSpark)
		
	var collision = move_and_collide(Velocity)
	if collision and collision.collider.has_method("kill"):
		collision.collider.kill()
func KillBySpark():
	hp-=1
	emit_signal("Damage",hp)
	if hp<=0:
		dead=true
		emit_signal("dead",dead)
		queue_free()
		
