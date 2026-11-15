extends Area2D

signal punched
var hovering = false
var openReady: bool = false # Prevents you from leaving until the door is possible to open

@onready var room = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!room.Active) or (!openReady): return
	if hovering == true:
		if Global.cursor.Punch:
			$Kaboom.play()
			punched.emit()


func _on_body_entered(body: Node2D) -> void:
	hovering = true


func _on_body_exited(body: Node2D) -> void:
	hovering = false
