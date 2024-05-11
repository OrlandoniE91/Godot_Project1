extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var falling = false
var is_facing_right = true

func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if velocity.x > 0:
			$AnimatedSprite2D.play("run")	
		elif velocity.x < 0:
			$AnimatedSprite2D.play("run")
		elif velocity.x == 0 and !$AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("idle")
		if falling:
			$AnimatedSprite2D.play("ground")
			falling = false					
	elif !is_on_floor():
		if velocity.y > 0:
			$AnimatedSprite2D.play("fall")
			falling = true
						
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	
	if Input.is_action_just_pressed("attack"):
		$AnimatedSprite2D.play("attack")
		
	if Input.is_action_just_pressed("enter_door"):
		$AnimatedSprite2D.play("enter")	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if (is_facing_right and velocity.x < 0) or (not is_facing_right and velocity.x > 0):
		scale.x *= -1
		is_facing_right = not is_facing_right

	move_and_slide()

