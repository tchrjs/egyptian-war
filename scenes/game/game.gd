class_name Game extends Node

# For player setup.
var player_scene = load("res://components/player/player.tscn")
var players: Array = []
var player_count = 2

# Player deck positions.
var x: Array = [0, 0]
var y: Array = [-90, 90]

func setup_players():
    for n in player_count:
        var instance = player_scene.instantiate()
        instance.set_name("Player" + str(n + 1))
        instance.set_placement(x[n], y[n])
        players.append(instance)
        add_child.call_deferred(instance)