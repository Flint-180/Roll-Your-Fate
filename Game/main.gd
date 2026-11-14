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
	$"Cursor".visible = true
	$"Cursor".Active = true
	
	$"Tutorial".visible = true
	$"Tutorial".Active = true

# This is never used, and might cause confusion if it's active - Robin
#func _on_room_punched() -> void: 
#	get_tree().change_scene_to_file("res://end_screen.tscn")


func _on_room1_next_room() -> void:
	$"Tutorial".visible = false
	$"Tutorial".Active = false
	
	$"Room2 Demo".visible = true
	$"Room2 Demo".Active = true
	pass # Replace with function body.
