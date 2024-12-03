class_name Dealer extends Entity

# Signal list.
signal deck_slapped()

# Card information for setup.
var suits = ["clubs", "diamond", "hearts", "spades"]
var card_template = load("res://components/cards/card_template.tscn")

# Setups new deck with standard cards.
func setup_standard_deck():
	deck.clear()
	for suit in suits:
		for i in range(1, 14):
			var instance = card_template.instantiate()
			instance.card_data = CardData.new(suit, i)
			deck.insert_top(instance)
	deck.shuffle_cards()

# Distribute all cards from deck to players.
func distribute_cards(players: Array):
	if players.size() <= 0:
		return
	var player_count = players.size()
	for n in deck.cards.size():
		var drawn_card = deck.draw_card()
		if drawn_card != null:
			players[n % player_count].deck.insert_top(drawn_card)

# Add player's card face front onto the dealer's deck.
func add_card_to_pile(card: CardTemplate):
	card.move_and_tilt()
	card.flip_card()
	deck.insert_top(card)
	
func discard_card_to_pile(card: CardTemplate):
	card.flip_card()
	deck.insert_bottom(card)
	
# Handles what happens when the deck is clicked.
func deck_clicked():
	deck_slapped.emit()
