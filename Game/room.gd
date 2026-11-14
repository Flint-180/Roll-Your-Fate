extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Background/Arrow.visible = false
	$Background/Arrow.disable_mode = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
			


func _on_door_punched() -> void:
		$Background/Door.visible = false
		$Background/Arrow.visible = true
		await get_tree().create_timer(0.05).timeout
		$Background/Arrow.monitoring = true
		
	


func _on_arrow_next_room() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
