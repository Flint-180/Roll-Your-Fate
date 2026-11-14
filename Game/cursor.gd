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
	if event.is_action_pressed("interact"):
		self.rotate(0.5)
	
