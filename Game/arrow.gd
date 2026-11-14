extends Area2D

signal nextRoom
var hovering = false

@onready var room = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!room.Active): return
	if hovering:
		if Global.cursor.Punch:
			nextRoom.emit()


func _on_body_entered(body: Node2D) -> void:
	hovering = true


func _on_body_exited(body: Node2D) -> void:
	hovering = false
