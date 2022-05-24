extends KinematicBody2D

var velocity = Vector2.ZERO
onready var animation = $AnimationPlayer
var dark=true
var hp=10
var dir=0
var right=false
var left=false
var down=false
var up=false
signal damage(hp)
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") or right:
		animation.play("Right")
		velocity.x =4
		dir=1
	elif Input.is_action_pressed("ui_left") or left:
		animation.play("Left")
		velocity.x =-4
		dir=2
	elif Input.is_action_pressed("ui_up")or up:
		animation.play("Up")
		velocity.y =-4
		dir=3
	elif Input.is_action_pressed("ui_down") or down:
		animation.play("Down")
		velocity.y =4
		dir=4
	elif Input.is_action_just_pressed("ui_select"):
		if dir==1:
			var Spark = preload("res://Player/PlayerSparkRight.tscn")
			var firedSpark = Spark.instance()
			firedSpark.position = Vector2(position.x+20,position.y)
			get_parent().call_deferred("add_child",firedSpark)
		elif dir==2:
			var Spark = preload("res://Player/PlayerSparkLeft.tscn")
			var firedSpark = Spark.instance()
			firedSpark.position = Vector2(position.x-20,position.y)
			get_parent().call_deferred("add_child",firedSpark)
		elif dir==3:
			var Spark = preload("res://Player/PlayerSparkUp.tscn")
			var firedSpark = Spark.instance()
			firedSpark.position = Vector2(position.x,position.y-25)
			get_parent().call_deferred("add_child",firedSpark)
		elif dir==4:
			var Spark = preload("res://Player/PlayerSparkDown.tscn")
			var firedSpark = Spark.instance()
			firedSpark.position = Vector2(position.x,position.y+25)
			get_parent().call_deferred("add_child",firedSpark)
	else:
		velocity.x=0
		velocity.y=0
	if !dark:
		animation.play("Light")
	var collision = move_and_collide(velocity)
	
func kill():
	hp-=1
	emit_signal("damage",hp)
	if hp<=0:
		get_tree().change_scene("res://Screens/AgainScreen.tscn")
		queue_free()
	


func _on_Left_pressed():
	left=true


func _on_Right_pressed():
	right=true

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


func _on_ATK_pressed():
	if dir==1:
		var Spark = preload("res://Player/PlayerSparkRight.tscn")
		var firedSpark = Spark.instance()
		firedSpark.position = Vector2(position.x+20,position.y)
		get_parent().call_deferred("add_child",firedSpark)
	elif dir==2:
		var Spark = preload("res://Player/PlayerSparkLeft.tscn")
		var firedSpark = Spark.instance()
		firedSpark.position = Vector2(position.x-20,position.y)
		get_parent().call_deferred("add_child",firedSpark)
	elif dir==3:
		var Spark = preload("res://Player/PlayerSparkUp.tscn")
		var firedSpark = Spark.instance()
		firedSpark.position = Vector2(position.x,position.y-25)
		get_parent().call_deferred("add_child",firedSpark)
	elif dir==4:
		var Spark = preload("res://Player/PlayerSparkDown.tscn")
		var firedSpark = Spark.instance()
		firedSpark.position = Vector2(position.x,position.y+25)
		get_parent().call_deferred("add_child",firedSpark)
