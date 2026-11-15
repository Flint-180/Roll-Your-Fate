extends Node2D

var Active: bool = false
signal nextRoom

var counter = 0

var broken = load("res://sprites/water_punched.png")
var notBroken = load("res://sprites/water1.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer/Fire.visible = false
	$AnimationPlayer/Fire2.visible = false
	$AnimationPlayer.play("firepuzzle")
	$Arrow.visible = false
	$Arrow.disable_mode = true
	$Puzzle3.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_door_punched() -> void:
	if(!Active): return
	$Door/Kaboom.play()
	$Door.visible = false
	$Arrow.visible = true
	await get_tree().create_timer(0.05).timeout
	$Arrow.monitoring = true
		


func _on_arrow_next_room() -> void:
	if(!Active): return
	nextRoom.emit()


func _on_puzzle_3_punched() -> void:
	$Puzzle3/Fountain.texture = broken
	await get_tree().create_timer(0.2).timeout
	$Puzzle3/Fountain.texture = notBroken
	counter += 1
	
	if counter >= 5:
		$Puzzle3/Fountain.texture = broken
		$Puzzle3/Water.visible = true
		$AnimationPlayer.play("fireout")
		
		$Door/DoorCollision.disabled = false
	
