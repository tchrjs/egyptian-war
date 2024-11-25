class_name DrawState extends State

@onready var dealer: Dealer = get_node("/root/Main/Game/Dealer")

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	if dealer.is_checking:
		transitioned.emit(self, "checkstate")
	return

func physics_update(_delta: float):
	return
