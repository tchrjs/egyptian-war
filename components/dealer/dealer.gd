class_name Dealer extends Node2D

# Signal list.
signal deck_slapped()

# Deck located at the center of the game.
var deck: Deck
@export var click_area: Area2D

# Card information for setup.
var suits = ["clubs", "diamond", "hearts", "spades"]
var card_template = load("res://components/cards/card_template.tscn")

# Intial declaration of dealer's deck.
func _init():
	deck = Deck.new()
	deck.set_name("Hand")
	setup_standard_deck()
	deck.shuffle_cards()
	add_child(deck)
	
# Setups new deck with standard cards.
func setup_standard_deck():
	deck.clear()
	for suit in suits:
		for i in range(1, 14):
			var instance = card_template.instantiate()
			instance.card_data = CardData.new(suit, i)
			deck.add_card(instance)
	deck.update_order()

# Distribute all cards from deck to players.
func distribute_cards(players: Array):
	if players.size() <= 0:
		return
	var player_count = players.size()
	for n in deck.cards.size():
		var drawn_card = deck.draw_card()
		if drawn_card != null:
			players[n % player_count].deck.add_card(drawn_card)

# Add player's card face front onto the dealer's deck.
func add_card_to_pile(card: CardTemplate):
	card.move_and_tilt()
	card.flip_card()
	deck.add_card(card)

# Enables and disables player input.
func toggle(_toggle: bool):
	click_area.input_pickable = _toggle

# Handles what happens when the deck is clicked.
func deck_clicked():
	deck_slapped.emit()

# Handles deck mouse click events.
func _on_click_area_input_event(_viewport:Node, event:InputEvent, _shape_idx:int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			deck_clicked()
