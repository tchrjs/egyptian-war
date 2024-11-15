class_name Player extends Node

# Deck located at the center of the game.
var deck: Deck

# Intial declaration of dealer's deck.
func _init():
	deck = Deck.new()
	deck.set_name("Hand")
	add_child(deck)
