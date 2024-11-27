class_name Player extends Entity

# Signal list.
signal card_drawn(card: CardTemplate)

# Intial declaration of player's deck.
func _init():
	deck = Deck.new()
	deck.set_name("Hand")
	add_child(deck)

# Handles what happens when the deck is clicked.
func deck_clicked():
	var card = deck.draw_card()
	if card == null:
		toggle(false)
	else: 
		card_drawn.emit(card)
