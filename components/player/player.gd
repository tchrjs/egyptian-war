class_name Player extends Node2D

# Deck located at the center of the game.
var deck: Deck
@export var click_area: Area2D

# Intial declaration of dealer's deck.
func _init():
	deck = Deck.new()
	deck.set_name("Hand")
	add_child(deck)

# Sets placement of deck.
func set_placement(x: int, y: int):
	position.x = x
	position.y = y

# Handles what happens when the deck is clicked.
func deck_clicked():
	var drawn_card = deck.draw_card()
	if drawn_card == null:
		click_area.input_pickable = false

# Handles deck mouse click events.
func _on_deck_area_input_event(_viewport: Node, event: InputEvent, _shape_idx: int):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			deck_clicked()
