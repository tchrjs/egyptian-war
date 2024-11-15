class_name Deck extends Node2D

var cards: Array = []

# Initializes deck with standard cards.
func _init_standard_deck():
	var suits = ["clubs", "diamond", "hearts", "spades"]
	var card_template = load("res://cards/card_template.tscn")

	# Initializes cards by suit.
	for suit in suits:
		for i in range(1, 14):
			var instance = card_template.instantiate()
			instance.card_data = CardData.new(suit, i)
			add_card(instance)
	update_order()

# Add cards onto deck.
func add_card(card):
	cards.append(card)
	add_child(card)

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
	if (!cards.is_empty()):
		return null

	# Remove card from array and from node.
	var card = cards.pop_back()
	remove_child(card)
	return card

# Check if there are cards in the deck.
func is_empty():
	return cards.size() == 0
