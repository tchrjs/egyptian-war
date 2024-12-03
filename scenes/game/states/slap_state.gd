class_name SlapState extends GameState

# Resource that determines what rules are being used.
@export var settings: Settings

# Check methods to determine if slap counts as a win or a loss.
var check_methods = ["is_double", "is_sandwhich", "is_ultimate_sandwhich", "is_tens"]
var deck_cards: Array
var deck_size: int

func enter():
	deck_cards = dealer.deck.cards
	deck_size = dealer.deck.cards.size()
	
	# Determines if player's slap results in a win or a lose.
	var has_won = check_rules()
	
	# Handle win and lose situations.
	if has_won:
		dealer.deck.realign_cards()
		dealer.deck.flip()
		# TODO : give dealer cards to player.
	elif game.is_challenge_end:
		# TODO : discard a player's card on a lose.
		# TODO : give previous player their cards.
		transitioned.emit(self, "drawstate")
	else:
		# TODO : discard a player's card on a lose.
		transitioned.emit(self, "drawstate")
	

func exit():
	deck_cards = []
	deck_size = 0
	game.is_checking = false
	game.is_challenge_end = false

# Loop through all rules and check if one of them results in a win.
func check_rules():
	for method in check_methods:
		if call(method):
			return true
	return false
	
# Check if the front 2 cards' rank matches.
func is_double() -> bool:
	if !settings.doubles:
		return false
		
	if deck_size >= 2:
		if deck_cards[deck_size - 1].get_rank() == deck_cards[deck_size - 2].get_rank():
			return true
	return false
	
# Check if there is 2 cards of the same rank with another card inbetween.
func is_sandwhich() -> bool:
	if !settings.sandwhiches:
		return false

	if deck_size >= 3:
		if deck_cards[deck_size - 1].get_rank() == deck_cards[deck_size - 3].get_rank():
			return true
	return false
	
# Check if front and back cards' rank matches.
func is_ultimate_sandwhich() -> bool:
	if !settings.ultimate_sandwhiches:
		return false
		
	if deck_size >= 2:
		if deck_cards[deck_size - 1].get_rank() == deck_cards[0].get_rank():
			return true
	return false
	
# Check if the first 2 numbers cards adds up to 10.
func is_tens() -> bool:
	if !settings.tens:
		return false
		
	if deck_size > 2:
		var card_1 = deck_cards[deck_size - 1]
		var card_2 = deck_cards[deck_size - 2]
		if !card_1.is_face_card and !card_2.is_face_card:
			var total_value = card_1.get_rank() + card_2.get_rank()
			if total_value == 10:
				return true
	return false
