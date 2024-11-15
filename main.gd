class_name Main extends Node

var deck: Deck

func _init():
	deck = Deck.new()
	deck._init_standard_deck()

func _ready():
	deck.shuffle_cards()
	add_child(deck.cards[0])