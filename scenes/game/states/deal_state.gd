class_name DealState extends GameState

func enter():
	game.setup_players()
	dealer.distribute_cards(game.players)
	transitioned.emit(self, "drawstate")

func exit():
	pass

func update(_delta: float):
	return

func physics_update(_delta: float):
	return
