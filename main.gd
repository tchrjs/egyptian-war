class_name Main extends Node

@onready var dealer: Dealer = get_node_or_null("Dealer")
@onready var player_factory: PlayerFactory = get_node_or_null("PlayerFactory")

func _ready():
	player_factory.setup_players(2)
	dealer.distribute_cards(player_factory.players)
