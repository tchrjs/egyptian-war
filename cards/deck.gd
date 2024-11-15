class_name Deck extends Node

var cards: Array = []

# Initializes deck with standard cards.
func _init_standard_deck():
	var suits = ["clubs", "diamond", "hearts", "spades"]
	var card_template = load("res://cards/card_template.tscn")

	for suit in suits:
		for i in range(1, 14):
			var instance = card_template.instantiate()
			instance.card_data = CardData.new(suit, i)
			add_card(instance)

# Add cards onto deck.
func add_card(card):
	cards.append(card)

# Add shuffle deck.
func shuffle_cards():
	cards.shuffle()