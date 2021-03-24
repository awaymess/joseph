extends KinematicBody2D

const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

var is_dead = false

export(int) var speed = 85

export(int) var hp = 2

export(Vector2) var size = Vector2(1, 1)


func _ready():
	scale = size
	pass
	

func dead(damage):
	hp = hp - damage
	if hp <= 0:
		is_dead = true
		velocity = Vector2(0, 0)
		$AnimatedSprite.play("dead")
		$dead.play()
		$attack.play()
		# The following line does not work in v3.1
#		$CollisionShape2D.disabled = true
		$CollisionShape2D.set_deferred("disabled", true)
		$Timer.start()
		if scale > Vector2(6, 6):
			get_parent().get_node("ScreenShake").screen_shake(1, 10, 100)



func _physics_process(delta):
	if is_dead == false:
		velocity.x = speed * direction
		
		if direction == 1:
			$AnimatedSprite.flip_h = false
		else:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("walk")
		velocity.y += GRAVITY
		velocity = move_and_slide(velocity, FLOOR)
	

	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1
		
	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1
	
	if get_slide_count() > 0:
		for i in range (get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
					get_slide_collision(i).collider.dead()

func _on_Timer_timeout():
	queue_free()
