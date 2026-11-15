extends Area2D

var hovering = false
@onready var room = get_parent()
@onready var mark_control = get_node("./Mark_Controls")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (!room.Active): return
	if hovering == true:
		if Global.cursor.Punch:
			if mark_control.current_arrow == 0:
				$Kaboom.play()
				#pressed.emit()
				mark_control.current_arrow += 1
			else: pass


func _on_body_entered(body: Node2D) -> void:
	hovering = true


func _on_body_exited(body: Node2D) -> void:
	hovering = false
