class_name DrawState extends GameState

func enter():
	dealer.toggle(true)
	game.toggle_players(true)

func exit():
	dealer.toggle(false)
	game.toggle_players(false)

func update(_delta: float):
	if game.is_checking:
		transitioned.emit(self, "slapstate")

func physics_update(_delta: float):
	return
