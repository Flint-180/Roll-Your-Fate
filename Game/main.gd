extends Node


func _ready() -> void:
	$Room2.Active = false
	$Room3.Active = false
	$Cursor.visible = false
	$Music.play()

func _process(delta: float) -> void:
	pass

#pause for 0.1 seconds
func _wait() -> void:
	await get_tree().create_timer(0.5)

#Deactivates and hids first room, activates and shows second room
func _change_room(start: String, end: String) -> void:
	get_node(start).visible = false
	get_node(start).Active = false
	
	get_node(end).visible = true
	_wait()
	get_node(end).Active = true

func _on_menu_cursor_on() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$"Cursor".visible = true
	$"Cursor".Active = true
	Global.cursor = $Cursor
	
	$"Tutorial".visible = true
	_wait()
	$"Tutorial".Active = true


func _on_room1_next_room() -> void:
	_change_room("Tutorial", "Room2")

func _on_room_2_next_room() -> void:
	_change_room("Room2", "Room3")
	$Room3/AnimationPlayer/Fire.visible = true
	$Room3/AnimationPlayer/Fire2.visible = true


func _on_room_3_next_room() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
