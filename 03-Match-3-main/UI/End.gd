extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "Level 1 Score : "+str(Global.level1Score)+ "\nLevel 2 Time: "+str(Global.level2Time)




func _on_Play_pressed():
	get_tree().change_scene("res://UI/Menu.tscn")


func _on_Quit_pressed():
	get_tree().quit()
