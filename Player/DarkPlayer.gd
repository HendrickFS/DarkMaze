extends KinematicBody2D

var velocity = Vector2.ZERO
onready var animation = $AnimationPlayer
var dark=true
var dir=0
var left=false
var right = false
var up = false
var down = false
signal direction(dir)
func _physics_process(delta):
	if position.y<=-500:
		get_tree().change_scene("res://Screens/Dialog4.tscn")
	if Input.is_action_pressed("ui_right") or right:
		animation.play("Right")
		velocity.x =4
		dir=1
	elif Input.is_action_pressed("ui_left") or left:
		animation.play("Left")
		velocity.x =-4
		dir=2
	elif Input.is_action_pressed("ui_up") or up:
		animation.play("Up")
		velocity.y =-4
		dir=3
	elif Input.is_action_pressed("ui_down") or down:
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
	


func _on_Left_pressed():
	left = true


func _on_Right_pressed():
	right = true


func _on_Down_pressed():
	down=true


func _on_Up_pressed():
	up=true


func _on_Left_released():
	left=false

func _on_Right_released():
	right=false


func _on_Down_released():
	down=false


func _on_Up_released():
	up=false
