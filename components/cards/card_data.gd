class_name CardData extends Resource

@export var name: String
@export var suit: String
@export var rank: int

func _init(_suit: String, _rank: int):
	name = _suit + str(_rank)
	suit = _suit
	rank = _rank