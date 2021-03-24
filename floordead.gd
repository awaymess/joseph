extends KinematicBody2D

var is_dead = false

func _ready():
	pass
	
func _physics_process(delta):
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	queue_free()
