extends KinematicBody2D

var velocity = Vector2.ZERO
onready var animation = $AnimationPlayer
var dark=true
var dir=0
signal direction(dir)
func _physics_process(delta):
	if position.y<=-500:
		get_tree().change_scene("res://Screens/Dialog4.tscn")
	if Input.is_action_pressed("ui_right"):
		animation.play("Right")
		velocity.x =4
		dir=1
	elif Input.is_action_pressed("ui_left"):
		animation.play("Left")
		velocity.x =-4
		dir=2
	elif Input.is_action_pressed("ui_up"):
		animation.play("Up")
		velocity.y =-4
		dir=3
	elif Input.is_action_pressed("ui_down"):
		animation.play("Down")
		velocity.y =4
		dir=4
	else:
		velocity.x=0
		velocity.y=0
	if !dark:
		animation.play("Light")
	emit_signal("direction",dir)
	var collision = move_and_collide(velocity)
	if collision and collision.collider.has_method("passed"):
		get_tree().change_scene("res://Screens/Dialog2.tscn")
	if collision and collision.collider.has_method("end"):
		get_tree().change_scene("res://Screens/Dialog4.tscn")
	
