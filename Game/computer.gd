extends Area2D

var Active: bool = false
var hovering: bool = true

@onready var room = get_parent()

signal screen_hit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!room.Active) or (!Active): return
	if hovering == true:
		if Global.cursor.Punch:
			screen_hit.emit()


func _on_body_entered(body: Node2D) -> void:
	if !Active: return
	hovering = true


func _on_body_exited(body: Node2D) -> void:
	if !Active: return
	hovering = false
