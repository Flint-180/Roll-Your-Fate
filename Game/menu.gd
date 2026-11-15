extends Node2D

signal cursorOn
@onready var menu = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_start_pressed() -> void:
	if menu:
		cursorOn.emit()
	menu = false
	
	


func _on_quit_pressed() -> void:
	get_tree().quit()
