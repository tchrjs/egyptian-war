class_name Game extends Node

# Existing nodes with game scene, order by tree alignment.
@export var dealer: Dealer
var players: Array = []

# For player setup.
var player_scene = load("res://components/entity/player/player.tscn")
var player_count = 2
var x: Array = [0, 0]
var y: Array = [90, -90]

# Game check values and helps with state machine.
var is_checking: bool = false
var is_challenge_end: bool = false
var player_turn: int = 0
var current_player: Player
var previous_player: Player
var challenge_value: int = 0

# Instantiate players.
func setup_players():
	player_turn = 0;
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
	current_player = players[player_turn]

# Enable or disable all player click events.
func toggle_all_players(_toggle: bool):
	for player in players:
		player.toggle(_toggle)

# Enables or disables current player.
func toggle_current_player(_toggle: bool):
	if current_player != null:
		current_player.toggle(_toggle)

# Takes card from player and gives it to dealer. 
func _on_player_card_drawn(card: CardTemplate):
	dealer.add_card_to_pile(card)
	toggle_current_player(false)
	
	# Determine card challenges.
	if card.is_face_card:
		challenge_value = card.get_challenge_value()
		set_next_player()
		toggle_current_player(true)
	elif challenge_value == 0:
		set_next_player()
		toggle_current_player(true)
	else:
		challenge_value -= 1
		if challenge_value > 0:
			toggle_current_player(true)
		else:
			is_challenge_end = true
	
# Handles what happens when a player slaps the dealer's deck.
func _on_dealer_deck_slapped():
	is_checking = true

# Sets next player turn.
func set_next_player():
	if players.is_empty():
		return
	player_turn = (player_turn + 1) % player_count
	previous_player = current_player
	current_player = players[player_turn]

# Sets specific turn to player.
func set_player_turn(turn: int):
	if players.size() < turn:
		return
	player_turn = turn
	previous_player = players[turn]
	current_player = players[turn]
