extends Node2D

signal nextRoom
var Active: bool = false
var cooldown: bool = false

var texture_0 = preload("res://sprites/bit_zero.png")
var texture_1 = preload("res://sprites/bit_one.png")

var computer_crash = preload("res://sprites/computer_crash_no_fire.png")
var computer_smashed = preload("res://sprites/computer_crash.png")

@onready var bit0 = $Bit0/Texture0
@onready var bit1 = $Bit1/Texture1
@onready var bit2 = $Bit2/Texture2
@onready var bit3 = $Bit3/Texture3
@onready var bit4 = $Bit4/Texture4
@onready var bit5 = $Bit5/Texture5

@onready var computer = $Computer

var hovering_bit = -1

var row_1 = [0, 1, 0, 1, 0, 1]

var row_textures

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Arrow.visible = false
	$Arrow.disable_mode = true
	$Door.visible = true
	$Door.openReady = false
	row_textures = [bit0, bit1, bit2, bit3, bit4, bit5]
	computer.Active = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Active: return
	if cooldown: return
	#print(hovering_bit)
	if hovering_bit < 0 || hovering_bit > 5: return
	if !Global.cursor.Punch: return
	cooldown = true
	
	if row_1[hovering_bit] == 1:
		row_1[hovering_bit] = 0
		row_textures[hovering_bit].texture = texture_0
	else:
		row_1[hovering_bit] = 1
		row_textures[hovering_bit].texture = texture_1
	
	$BitSound.play()
	
	if row_1 == [1, 0, 1, 0, 1, 0]:
		for bit in row_textures:
			bit.visible = false
		$Computer/Monitor.texture = computer_crash
		await get_tree().create_timer(0.5).timeout
		computer.Active = true
		
	await get_tree().create_timer(0.5).timeout
	cooldown = false
	

func _on_bit_0_body_entered(body: Node2D) -> void:
	hovering_bit = 0


func _on_bit_0_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_bit_1_body_entered(body: Node2D) -> void:
	hovering_bit = 1


func _on_bit_1_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_bit_2_body_entered(body: Node2D) -> void:
	hovering_bit = 2


func _on_bit_2_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_bit_3_body_entered(body: Node2D) -> void:
	hovering_bit = 3


func _on_bit_3_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_bit_4_body_entered(body: Node2D) -> void:
	hovering_bit = 4


func _on_bit_4_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_bit_5_body_entered(body: Node2D) -> void:
	hovering_bit = 5


func _on_bit_5_body_exited(body: Node2D) -> void:
	pass
	#hovering_bit = -1


func _on_outer_area_body_entered(body: Node2D) -> void:
	hovering_bit = -1


func _on_computer_screen_hit() -> void:
	$Computer/Monitor.texture = computer_smashed
	$OuterArea.monitorable = false
	$OuterArea.monitoring = false
	$Door.visible = false
	$Arrow.visible = true
	$ComputerSmashSound.play()
	await get_tree().create_timer(0.05).timeout
	$Arrow.monitoring = true


func _on_arrow_next_room() -> void:
	if(!Active): return
	nextRoom.emit()
