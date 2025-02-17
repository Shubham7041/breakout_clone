extends Node2D

signal scored
var bricks = preload("res://Scenes/bricks.tscn")
var colors = [Color(155,0,0,1), Color(150,200,100,1), Color(0,155,0,1)]
var brick_arr = []
@onready var score: Label = %score
var ball_count : int = 0
@onready var timer: Timer = $Timer
@onready var ball = preload('res://Scenes/ball.tscn')

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score.text = 'Score:'
	#Below code adds bricks to the level
	for i in range(100,1100,50):
		for j in range(100,350,25):
			var view = randi_range(0,5)
			if view in [1,2,4,5]:	
				var brick_instance = bricks.instantiate()
				brick_instance.modulate = colors.pick_random()
				brick_instance.position.y = j
				brick_instance.position.x = i
				brick_instance.connect('body_entered', Callable(self, '_on_body_entered'))
				add_child(brick_instance)
				brick_arr.append(brick_instance)
			else: continue # Replace with function body.

#Tracking ball count on screen for 
var has_started = false
func _process(delta: float) -> void:
	ball_count = get_tree().get_node_count_in_group('ball_group')
	if ball_count < 1:
		if !has_started:
			timer.start()
			has_started = true

#Shows Death Screen when player losses the ball
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file('res://Scenes/died_screen.tscn')

#To track Score every time a brick is hit
func _on_body_entered(color):
	if color == colors[0]:
		Global.score +=2
		score.text = 'Score: ' +str(Global.score)
		print("Red Hit! " , Global.score)
	elif color == colors[1]:
		Global.score+=1
		score.text = 'Score: ' +str(Global.score)
		print('White Hit! ', Global.score)
	elif color == colors[2]:
		Global.score +=3
		score.text = 'Score: ' +str(Global.score)
		print('Green Hit! ', Global.score)
	
