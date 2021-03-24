extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TouchScreenButton_pressed():
	$button.play()
	get_tree().change_scene("menu.tscn")
	pass # Replace with function body.



func _on_TouchScreenButton2_pressed():
	$button.play()
	get_tree().change_scene("main1.tscn")
	pass # Replace with function body.


func _on_TouchScreenButton3_pressed():
	$button.play()
	get_tree().change_scene("main2.tscn")
	pass # Replace with function body.


func _on_TouchScreenButton4_pressed():
	$button.play()
	get_tree().change_scene("main3.tscn")
	pass # Replace with function body.


func _on_TouchScreenButton5_pressed():
	$button.play()
	get_tree().change_scene("main4.tscn")
	pass # Replace with function body.


func _on_TouchScreenButton6_pressed():
	$button.play()
	get_tree().change_scene("main5.tscn")
	pass # Replace with function body.
