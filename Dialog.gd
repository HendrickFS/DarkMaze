extends Node2D

var TypeTime=0.1
onready var text = $RichTextLabel
var TextList: Array=[
	"Fui aprisionado no mundo das almas...",
	"Este lugar é estranho, nada faz sentido.",
	"Preciso achar a saída para retornar ao meu corpo logo."
]

func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		ShowText()
func ShowText()->void:
	if text.visible_characters<text.bbcode_text.length():
		text.visible_characters=text.bbcode_text.length()
		return
	if TextList.size()==0:
		get_tree().change_scene("res://World/Maze.tscn")
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
