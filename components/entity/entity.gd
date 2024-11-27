class_name Entity extends Node2D

# Deck located at the center of the game.
var deck: Deck
@export var click_area: Area2D

# Sets placement of deck.
func set_placement(x: int, y: int):
	position.x = x
	position.y = y

# Enables and disables player input.
func toggle(_toggle: bool):
	click_area.input_pickable = _toggle

# Handles deck input events.
func _on_click_area_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if deck.is_empty():
		return
		
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			deck_clicked()

func deck_clicked():
	pass
