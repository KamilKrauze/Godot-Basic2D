extends Node2D

@export var points:int = 10

# Pre-load objects and instantiate on collision
@export var SOUND:AudioStream = preload("res://Sounds/pickup_gem.wav")
@onready var SOUND_PLAYER:PackedScene = preload("res://Scenes/Pickups/pick_up_sound.tscn")

func _ready():
	GameTracker.addGem()

# This connected to a signal under the "Node" tab for the Area2D node
func _on_area_2d_body_entered(_body):
	# Create an instance of the sound player, and attach to level node
	var instance = SOUND_PLAYER.instantiate()
	instance.stream = SOUND
	var level = get_owner()
	level.add_child(instance)
	instance.play_sound()
	
	GameTracker.foundGem()
	GameTracker.grantPointsToPlayer(points)
	
	queue_free()
	
