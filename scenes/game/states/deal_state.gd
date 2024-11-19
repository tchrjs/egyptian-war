class_name DealState extends State

@export var dealer: Dealer
@export var player_factory: PlayerFactory

func enter():
    player_factory.setup_players(2)
    dealer.distribute_cards(player_factory.players)
    transitioned.emit(self, "drawstate")

func exit():
    pass

func update(_delta: float):
    return

func physics_update(_delta: float):
    return
