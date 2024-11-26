class_name DealState extends State

@onready var dealer: Dealer = get_node("/root/Main/Game/Dealer")
@onready var game: Game = get_node("/root/Main/Game")

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
