extends Area2D

const SPEED = 500
var velocity = Vector2()
var direction = 1

func _ready():
	$Timer.start()
	pass

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true


func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("shoot")


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_FireballRed_body_entered(body):
	if "Enemy" in body.name:
		body.dead(2)
	queue_free()


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
