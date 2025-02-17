# Ball Script
extends CharacterBody2D
@onready var player = $"../PlayerPad"
@onready var ball: CharacterBody2D = $"."

const SPEED = 5
var direction = Vector2(randf_range(-0.5,0.5),1)

func _ready() -> void:
	add_to_group('ball_group')
	

func _physics_process(delta: float) -> void:
	velocity = SPEED*direction
	
	#Below code detects collision and bounces the object
	var collision = move_and_collide(velocity)
	if collision !=null:
		direction = direction.bounce(collision.get_normal())
		if collision.get_collider_id() == 26004686086:
			direction += player.velocity_direction.normalized()

func _process(delta: float) -> void:
	if self.position.y >= 700:
		queue_free()
