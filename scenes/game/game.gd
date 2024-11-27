class_name Game extends Node

# Existing nodes with game scene, order by tree alignment.
@export var settings: Settings
@export var dealer: Dealer
var players: Array = []

# For player setup.
var player_scene = load("res://components/player/player.tscn")
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
func _on_dealer_deck_slapped() -> void:
	is_checking = true
