extends KinematicBody2D


const SPEED = 510
const GRAVITY = 55.55
const JUMP_POWER = -900
const FLOOR = Vector2(0, -1)

const FIREBALL = preload("res://Fireball.tscn")
const FIREBALLRED = preload("res://FireballRed.tscn")

var velocity = Vector2()

var on_ground = false

var is_attacking = false

var is_dead = false

var fireball_power = 1


func _physics_process(delta):
	
	if is_dead == false:
	
		if Input.is_action_pressed("ui_right"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")

					$AnimatedSprite.flip_h = false
					if sign($Position2D.position.x) == -1:
						$Position2D.position.x *= -1
		elif Input.is_action_pressed("ui_left"):
			if is_attacking == false || is_on_floor() == false:
				velocity.x = -SPEED
				if is_attacking == false:
					$AnimatedSprite.play("run")

					$AnimatedSprite.flip_h = true
					if sign($Position2D.position.x) == 1:
						$Position2D.position.x *= -1
		else:
			velocity.x = 0
			if on_ground == true && is_attacking == false:
				$AnimatedSprite.play("idle")
			
		if Input.is_action_pressed("ui_up"):
			if is_attacking == false:
				if on_ground == true:
					velocity.y = JUMP_POWER
					on_ground = false
					$jume.play()
	
		if Input.is_action_just_pressed("ui_shoot") && is_attacking == false:
			if is_on_floor():
				velocity.x = 0
			is_attacking = true
			$AnimatedSprite.play("attack")
			$attack.play()
			
			var fireball = null
			if fireball_power == 1:
				fireball = FIREBALL.instance()
			elif fireball_power == 2:
				fireball = FIREBALLRED.instance()
			if sign($Position2D.position.x) == 1:
				fireball.set_fireball_direction(1)
			else:
				fireball.set_fireball_direction(-1)
			get_parent().add_child(fireball)
			fireball.position = $Position2D.global_position
	
		velocity.y += GRAVITY
	
		if is_on_floor():
			if on_ground == false:
				is_attacking = false
			on_ground = true
		else:
			if is_attacking == false:
				on_ground = false
				if velocity.y < 0:
					$AnimatedSprite.play("jump")
				else:
					$AnimatedSprite.play("fall")
					
					
	
		velocity = move_and_slide(velocity, FLOOR)
		
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "Enemy" in get_slide_collision(i).collider.name:
					$dead.play()
					dead()
					
		if get_slide_count() > 0:
			for i in range(get_slide_count()):
				if "floordead" in get_slide_collision(i).collider.name:
					$dead.play()
					dead()
					
		
	

func dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true
	$Timer.start()
	

func _on_AnimatedSprite_animation_finished():
	is_attacking = false


func _on_Timer_timeout():
	get_tree().reload_current_scene()
	

func crown_power_up():
	fireball_power = 2
