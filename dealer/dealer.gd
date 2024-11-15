class_name Dealer extends Node

# Deck located at the center of the game.
var deck: Deck

# Card information for setup.
var suits = ["clubs", "diamond", "hearts", "spades"]
var card_template = load("res://cards/card_template.tscn")

# Intial declaration of dealer's deck.
func _init():
	deck = Deck.new()
	deck.set_name("CenterPile")
	setup_standard_deck()
	deck.shuffle_cards()
	add_child(deck)
	
# Setups new deck with standard cards.
func setup_standard_deck():
	deck.cards = []
	for suit in suits:
		for i in range(1, 14):
			var instance = card_template.instantiate()
			instance.card_data = CardData.new(suit, i)
			deck.add_card(instance)
	deck.update_order()
