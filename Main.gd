extends Node

export(PackedScene) var mob_scene


func _ready():
	randomize()


func _on_MobTimer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instance()

	# Choose a random location on the SpawnPath.
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	# And give it a random offset.
	mob_spawn_location.unit_offset = randf()

	# Communicate the spawn location and the player's location to the mob.
	var player_position = $Player.transform.origin
	mob.initialize(mob_spawn_location.translation, player_position)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)


func _on_Player_hit():
	$MobTimer.stop()
