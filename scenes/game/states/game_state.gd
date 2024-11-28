class_name GameState extends State

@onready var settings: Settings = load("res://components/settings/settings.tres")
@onready var dealer: Dealer = get_node("/root/Main/Game/Dealer")
@onready var game: Game = get_node("/root/Main/Game")
