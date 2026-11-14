extends CharacterBody2D

@export var speed = 400

func _move_cursor():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	_move_cursor()
	move_and_slide()
	_interact(input_event)

func _interact(event):
	if Input.is_action_pressed("interact"): 
		$PunchSound.play()
		rotation_degrees = -10
		position.x -= 10
		await get_tree().create_timer(0.05).timeout
		rotation_degrees = 0
		position.x += 10
		
		
		
		
