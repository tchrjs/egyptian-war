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
	var has_won = is_win()
	print(has_won)
	pass

func exit():
	deck_cards = []
	deck_size = 0
	pass

func update(_delta: float):
	if !game.is_checking:
		transitioned.emit(self, "drawstate")
	return

# Loop through all rules and check if one of them results in a win.
func is_win():
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
	return false
