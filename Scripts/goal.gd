extends Area2D

@onready var AUDIO_PLAYER:AudioStreamPlayer2D = $AudioStreamPlayer2D 

func _on_body_entered(body):
	AUDIO_PLAYER.play(0.0)


func _on_audio_stream_player_2d_finished():
	get_tree().change_scene_to_file("res://UI/end_screen.tscn")
