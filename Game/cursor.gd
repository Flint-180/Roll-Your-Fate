class_name Cursor
extends CharacterBody2D

@export var speed = 400

var Active: bool = false

var Punch: bool = false # If the cursor is punching on any give frame

func _move_cursor():
	if(!Active): return #Ensures you can't mess with anything before entering the game
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(delta):
	if(!Active): return
	_move_cursor()
	move_and_slide()
	_interact(input_event)

func _interact(event):
	if(!Active): return #Ensures you can't mess with anything before entering the game
	if Input.is_action_just_pressed("interact"): 
		$PunchSound.play()
		rotation_degrees = -10
		position.x -= 10
		Punch = true
		await get_tree().create_timer(0.05).timeout
		Punch = false
		rotation_degrees = 0
		position.x += 10
	Punch = false
