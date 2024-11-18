class_name PlayerFactory extends Node

var player_scene = load("res://components/player/player.tscn")

var players: Array = []

func setup_players(player_count: int):
    for n in player_count:
        var instance = player_scene.instantiate()
        instance.set_name("Player" + str(n + 1))
        players.append(instance)
        add_child(instance)