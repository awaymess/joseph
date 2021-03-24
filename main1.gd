extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	
func _on_pause_btn_pressed():
	get_tree().set_pause(true)
	$canvas/HUD/pause_popup.show()
	
func _on_play_btn2_pressed():
	$canvas/HUD/pause_popup.hide()
	get_tree().paused = false
	
func _on_replay_btn2_pressed():
	$canvas/HUD/pause_popup.hide()
	get_tree().paused = false
	get_tree().change_scene("res://main1.tscn")
	pass # Replace with function body.


func _on_exit_btn2_pressed():
	$canvas/HUD/pause_popup.hide()
	get_tree().paused = false
	get_tree().change_scene("res://menu.tscn")
	pass # Replace with function body.



func _on_Doc_body_entered(body):
	if "Player" in body.name:
		print("test")
		get_tree().set_pause(true)
		$canvas/HUD/Doc.show()
		$Doc.queue_free()


func _on_cont_btn_pressed():
	$canvas/HUD/Doc.hide()
	get_tree().paused = false


func _on_Doc2_body_entered(body):
	if "Player" in body.name:
		print("test")
		get_tree().set_pause(true)
		$canvas/HUD/Doc2.show()
		$Doc2.queue_free()
	pass # Replace with function body.


func _on_cont_btn2_pressed():
		$canvas/HUD/Doc2.hide()
		get_tree().paused = false

