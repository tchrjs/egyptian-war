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

func flip_card():
	if card_back.visible:
		show_card()
	else:
		hide_card()

func move_and_tilt():
	rotation = random_float_in_range(0, 360)
	position = Vector2(random_float_in_range(-5, 5), random_float_in_range(-5, 5))
	pass

func realign():
	pass

func show_card():
	card_back.visible = false

func hide_card():
	card_back.visible = true

func random_float_in_range(_min: float, _max: float) -> float:
	return randf() * (_max - _min) + _min