class_name Main extends Node

var dealer: Deck

func _init():
	dealer = Deck.new()
	dealer._init_standard_deck()
	dealer.set_name("Dealer")

func _ready():
	dealer.shuffle_cards()
	add_child(dealer)