extends Node2D
var time=3
var TypeTime=0.1
var end=false
onready var animation=$AnimationPlayer
onready var text = $RichTextLabel
var TextList: Array=[
	"Parabéns idiota!",
	"Quebrando o ciclo sua alma foi corrompida...",
	"Agora você é um de nós!",
	"Para sair daqui vai precisar de mais do que isso...",
	"[...Porém o desenvolvedor ainda está criando o resto da história...]",
	"[...Então por hora, você zerou o jogo...]"
]

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		ShowText()
func ShowText()->void:
	if text.visible_characters<text.bbcode_text.length():
		text.visible_characters=text.bbcode_text.length()
		return
	if TextList.size()==0:
		end=true
		return
	var msg:String=TextList.pop_front()
	
	text.visible_characters=0
	text.bbcode_text=msg
	
func _process(delta):
	if TypeTime>0:
		TypeTime-=delta
	else:
		text.visible_characters+=1
		TypeTime=0.1
	if end:
		animation.play("End")
		if time>0:
			time-=delta
		else:
			get_tree().change_scene("res://Screens/EndScreen.tscn")

