class_name Game extends Node

# Existing nodes with game scene, order by tree alignment.
@export var settings: Settings
@export var dealer: Dealer
var players: Array = []

# For player setup.
var player_scene = load("res://components/entity/player/player.tscn")
var player_count = 2
var x: Array = [0, 0]
var y: Array = [-90, 90]

# Game check values and helps with state machine.
var is_checking: bool = false

# Instantiate players.
func setup_players():
	for n in player_count:
		# Create instance of player.
		var instance = player_scene.instantiate()
		instance.set_name("Player" + str(n + 1))
		instance.set_placement(x[n], y[n])
		
		# Connects signal from player to game in order to take the card.
		instance.card_drawn.connect(_on_player_card_drawn)
		
		# Adds player instance to game.
		players.append(instance)
		add_child.call_deferred(instance)

# Enable or disable all player click events.
func toggle_players(_toggle: bool):
	for player in players:
		player.toggle(_toggle)

# Takes card from player and gives it to dealer. 
func _on_player_card_drawn(card: CardTemplate):
	dealer.add_card_to_pile(card)
	
# Handles what happens when a player slaps the dealer's deck.
func _on_dealer_deck_slapped():
	is_checking = true
	var has_won = is_win()
	print(has_won)
	
# Loop through all rules and check if one of them results in a win.
func is_win():
	var check_methods = ["is_double", "is_sandwhich", "is_ultimate_sandwhich", "is_tens"]
	for method in check_methods:
		if call(method):
			return true
	return false
	
# Check if the front 2 cards' rank matches.
func is_double() -> bool:
	if !settings.doubles:
		return false
		
	var dealer_cards = dealer.deck.cards;
	var deck_size = dealer_cards.size();
	
	if deck_size >= 2:
		if dealer_cards[deck_size - 1].get_rank() == dealer_cards[deck_size - 2].get_rank():
			return true
	return false
	
# Check if there is 2 cards of the same rank with another card inbetween.
func is_sandwhich() -> bool:
	if !settings.sandwhiches:
		return false

	var dealer_cards = dealer.deck.cards;
	var deck_size = dealer_cards.size();

	if deck_size >= 3:
		if dealer_cards[deck_size - 1].get_rank() == dealer_cards[deck_size - 3].get_rank():
			return true
	return false
	
# Check if front and back cards' rank matches.
func is_ultimate_sandwhich() -> bool:
	if !settings.ultimate_sandwhiches:
		return false
	return false
	
# Check if the first 2 numbers cards adds up to 10.
func is_tens() -> bool:
	if !settings.tens:
		return false
	return false
