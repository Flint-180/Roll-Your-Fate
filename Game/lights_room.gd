extends Node2D

signal nextRoom
var Active: bool = false

@onready var red_light = $RedLight
@onready var green_light = $GreenLight
var green_light_texture = preload("res://sprites/light_green.png")
var red_light_texture = preload("res://sprites/light_red.png")
var off_light_texture = preload("res://sprites/light_button_off.png")

var can_click = false
var clicks = 0
const CLICKS_NEEDED = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arrow.visible = false
	$Arrow.disable_mode = true
	$Door.visible = true
	$Door.openReady = true
	toggle_lights()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func toggle_lights() -> void:
	if can_click:
		can_click = false
		red_light.texture = red_light_texture
		green_light.texture = off_light_texture
	else:
		can_click = true
		green_light.texture = green_light_texture
		red_light.texture = off_light_texture
		
	await get_tree().create_timer(randf_range(0.3, 2.0)).timeout
	toggle_lights()

func _on_door_punched() -> void:
	if (!Active): return
	if can_click:
		clicks += 1
		if clicks >= CLICKS_NEEDED:
			$Door/Kaboom.play()
			$Door.visible = false
			$Arrow.visible = true
			await get_tree().create_timer(0.05).timeout
			$Arrow.monitoring = true
		else:
			await get_tree().create_timer(0.05).timeout
	else:
		clicks = 0
		$Door/DoorWrong.play()
		await get_tree().create_timer(0.05).timeout


func _on_arrow_next_room() -> void:
	if(!Active): return
	nextRoom.emit()
