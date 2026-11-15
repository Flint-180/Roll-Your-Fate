extends Node


func _ready() -> void:
	$Room2.Active = false
	$Room3.Active = false
	$Room4.Active = false
	$Cursor.visible = false
	$Music.play()

func _process(delta: float) -> void:
	pass

#pause for 0.1 seconds
func _wait() -> void:
	await get_tree().create_timer(0.5)

#Deactivates and hids first room, activates and shows second room
func _change_room(start: String, end: String) -> void:
	$FadeToBlack.play("fade")
	await $FadeToBlack.animation_finished
	get_node(start).visible = false
	get_node(start).Active = false

	get_node(end).visible = true
	_wait()
	get_node(end).Active = true
	$FadeToBlack.play("unfade")
	await $FadeToBlack.animation_finished

func _on_menu_cursor_on() -> void:
	$FadeToBlack.play("fade")
	await get_tree().create_timer(1).timeout
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	$"Tutorial".visible = true
	_wait()
	$"Tutorial".Active = true
	$FadeToBlack.play("unfade")
	await get_tree().create_timer(1).timeout
	$Tutorial/AnimationPlayer.play("text crawl")
	await $Tutorial/AnimationPlayer.animation_finished

	$"Cursor".visible = true
	$"Cursor".Active = true
	Global.cursor = $Cursor


func _on_room1_next_room() -> void:
	_change_room("Tutorial", "Room2")

func _on_room_2_next_room() -> void:
	_change_room("Room2", "Room3")
	await get_tree().create_timer(.6).timeout
	$Room3/AnimationPlayer.play("firepuzzle")


func _on_room_3_next_room() -> void:
	_change_room("Room3", "Room4")


func _on_room_4_next_room() -> void:
	_change_room("Room4", "RoomMark")


func _on_room_mark_next_room() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
