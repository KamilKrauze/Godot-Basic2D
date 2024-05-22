extends Area2D

@onready var TIMER = $Timer

func _ready():
	TIMER.stop()
	TIMER.one_shot = true

func _on_body_entered(body):
	print("You died!")
	
	TIMER.start()
	pass # Replace with function body.


func _on_timer_timeout():
	GameTracker.reset()
	get_tree().reload_current_scene()
	pass # Replace with function body.
