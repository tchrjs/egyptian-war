class_name SlapState extends GameState

func enter():
	var has_won = is_win()
	print(has_won)
	pass

func exit():
	pass

func update(_delta: float):
	if !game.is_checking:
		transitioned.emit(self, "drawstate")
	return

func physics_update(_delta: float):
	return

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
