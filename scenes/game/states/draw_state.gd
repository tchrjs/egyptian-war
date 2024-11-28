class_name DrawState extends GameState

func enter():
	dealer.toggle(true)
	game.toggle_current_player(true)

func exit():
	dealer.toggle(false)
	game.toggle_all_players(false)

func update(_delta: float):
	if game.is_checking:
		transitioned.emit(self, "slapstate")
