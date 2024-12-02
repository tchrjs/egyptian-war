class_name Player extends Entity

# Signal list.
signal card_drawn(card: CardTemplate)

# Deck size label.
@export var deck_size_label: Label

# Handles what happens when the deck is clicked.
func deck_clicked():
	var card = deck.draw_card()
	if card == null:
		toggle(false)
	else: 
		card_drawn.emit(card)

# Updates deck label.
func _on_hand_child_order_changed():
	if deck_size_label != null:
		deck_size_label.text = str(deck.cards.size())
