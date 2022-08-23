extends Node2D
var time=3
var TypeTime=0.1
var end=false
onready var animation=$AnimationPlayer
onready var text = $RichTextLabel
var TextList: Array=[
	"Você tem duas opções...",
	"Veja esta outra alma, que assim como você, busca uma saída.",
	"Sacrífique-a e você estará livre...",
	"Porém ela nunca mais poderá voltar ao seu corpo, é o que deseja??",
	"Sua outra opção é continuar lutando..",
	"O uq eposso lhe garantir que é a opção mais díficil.",
	"Vamos, DECIDA!"
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
		get_tree().change_scene("res://Screens/ChooseScreen.tscn")



func _on_Enter01_pressed():
	ShowText()
