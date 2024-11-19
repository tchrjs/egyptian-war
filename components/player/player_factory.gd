class_name PlayerFactory extends Node

var player_scene = load("res://components/player/player.tscn")

var players: Array = []

# Player deck positions
var x: Array = [0, 0]
var y: Array = [-90, 90]

func setup_players(player_count: int):
    for n in player_count:
        var instance = player_scene.instantiate()
        instance.set_name("Player" + str(n + 1))
        instance.set_placement(x[n], y[n])
        players.append(instance)
        add_child(instance)