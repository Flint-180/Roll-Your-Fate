class_name Cursor
extends CharacterBody2D

@export var speed = 400
var Active: bool = false

var Punch: bool = false # If the cursor is punching on any give frame
var flipped = false

func _move_cursor():
	if(!Active): return #Ensures you can't mess with anything before entering the game
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	if velocity.x > 0:
		$CursorSprite.flip_h = true
		flipped = true
	if velocity.x < 0:
		$CursorSprite.flip_h = false
		flipped = false
		

func _physics_process(delta):
	if(!Active): return
	_move_cursor()
	move_and_slide()
	_interact(input_event)

func _interact(event):
	if(!Active): return #Ensures you can't mess with anything before entering the game
	if Input.is_action_just_pressed("interact"): 
		var default = position.x
		$PunchSound.play()
		if flipped:
			rotation_degrees = 20
			position.x += 20
		elif flipped == false:
			rotation_degrees = -20
			position.x -= 20
		Punch = true
		await get_tree().create_timer(0.05).timeout
		Punch = false
		rotation_degrees = 0
		position.x = default
	Punch = false
