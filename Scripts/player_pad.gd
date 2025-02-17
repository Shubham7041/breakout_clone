extends CharacterBody2D
# Player Script
const SPEED = 900
# velocity direction - adds direction to the ball if pad is in motion on contact
@export var velocity_direction = Vector2(0,0) 
var direciton = 0


func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO
	if Input.is_action_pressed("left_key"):
		velocity.x -= SPEED
		velocity_direction = Vector2(-1, 0)
	elif Input.is_action_pressed("right_key"):
		velocity.x += SPEED
		velocity_direction = Vector2(1,0)
	else : velocity_direction = Vector2(0,0)
	move_and_slide()
	
	
