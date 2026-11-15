extends Node2D

var current_arrow: int = 0

@onready var door = get_node("../Door")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Light1.texture = load("res://sprites/light_button_on.png")
	$Light2.texture = load("res://sprites/light_button_on.png")
	$Light3.texture = load("res://sprites/light_button_on.png")
	$Light4.texture = load("res://sprites/light_button_on.png")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_arrow > 0:
		$Light1.texture = load("res://sprites/light_button_off.png")
	if current_arrow > 1:
		$Light2.texture = load("res://sprites/light_button_off.png")
	if current_arrow > 2:
		$Light3.texture = load("res://sprites/light_button_off.png")
	if current_arrow > 3:
		$Light4.texture = load("res://sprites/light_button_off.png")
		door.openReady = true
	pass
