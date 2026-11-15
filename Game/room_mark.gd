extends Node2D

var Active: bool = false
signal nextRoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arrow.visible = false
	$Arrow.disable_mode = true
	$Door.visible = true
	#$Puzzle2.openReady = true # What puzzle does this one have?


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_puzzle_2_punched() -> void:
	if(!Active): return
	$AnimationPlayer.play("Room2")

	$Arrow.visible = true
	await get_tree().create_timer(0.05).timeout
	$Arrow.monitoring = true
	

func _on_arrow_next_room() -> void:
	if(!Active): return
	nextRoom.emit()
