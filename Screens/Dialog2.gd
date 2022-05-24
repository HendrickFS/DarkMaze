extends Node2D

var TypeTime=0.1
onready var text = $RichTextLabel
var TextList: Array=[
	"Consegui achar uma saída...",
	"Onde estou? O que é isso? Me parece hostil...",
	"Parece que ao passar pelo portal obtive poderes.",
	"Esse Triângulo é a representação do ciclo da minha alma!",
	"Tenho que quebra-lo para sair daqui!"
]

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		ShowText()
func ShowText()->void:
	if text.visible_characters<text.bbcode_text.length():
		text.visible_characters=text.bbcode_text.length()
		return
	if TextList.size()==0:
		get_tree().change_scene("res://World/BattleField.tscn")
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


func _on_Enter01_pressed():
	ShowText()
