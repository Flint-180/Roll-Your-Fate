extends Node2D

var Active: bool = false
signal nextRoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arrow.visible = false
	$Arrow.disable_mode = true
	$Door.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_punched() -> void:
	if(!Active): return
	
	$Door.visible = false
	$Arrow.visible = true
	await get_tree().create_timer(0.05).timeout
	$Arrow.monitoring = true
		
	


func _on_arrow_next_room() -> void:
	if(!Active): return
	get_tree().change_scene_to_file("res://end_screen.tscn")
	#nextRoom.emit()
	pass
