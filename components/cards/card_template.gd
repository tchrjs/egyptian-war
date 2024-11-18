class_name CardTemplate extends Node2D

# Card information.
var card_data: CardData

# Card visuals.
@onready var card_front = get_node("CardFront")
@onready var card_back = get_node("CardBack")

func _ready():
	name = card_data.name.to_pascal_case()
	card_front.texture = load("res://assets/art/cards/" + card_data.name + ".png")
	card_back.texture = load("res://assets/art/cards/back1.png")
