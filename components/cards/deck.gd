class_name Deck extends Node2D

var cards: Array = []

# Add cards onto deck.
func add_card(card):
	cards.append(card)
	add_child(card)
	update_order()

# Shuffles deck.
func shuffle_cards():
	cards.shuffle()
	update_order()

# Ensure that cards have the appropriate z-index ordering.
func update_order():
	var card_size = cards.size()
	for i in range(card_size):
		cards[i].z_index = i

# Draw from the top of the pile.
func draw_card() -> CardTemplate:
	# Check to see if there are cards.
	if (cards.is_empty()):
		return null

	# Remove card from array and from node.
	var card = cards.pop_back()
	remove_child(card)
	update_order()
	return card

# Removes all cards from deck.
func clear():
	for n in get_children():
		remove_child(n)
		n.queue_free()
	cards = []

# Check if there are cards in the deck.
func is_empty():
	return cards.size() == 0
