extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_touch_play_pressed():
	$button.play()
	get_tree().change_scene("page1.tscn")

func _on_touch_howto_pressed():
	$button.play()
	get_tree().change_scene("howto.tscn")

func _on_touch_credits_pressed():
	$button.play()
	get_tree().change_scene("credits.tscn")

func _on_touch_exit_pressed():
	$button.play()
	get_tree().quit()

