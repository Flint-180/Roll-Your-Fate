extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Cursor.visible = false
	$Music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_menu_cursor_on() -> void:
	
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$Cursor.visible = true
	$Tutorial.visible = true


func _on_room_punched() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
