extends Node2D

var current_arrow: int = 0

@onready var door = get_node("../Door")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_arrow > 3:
		door.openReady = true
	pass
