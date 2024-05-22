extends AudioStreamPlayer


func play_sound() -> void:
	if (stream == null):
		pass
	self.play(0.0)

# Destroy sound node instance after finished playing
func _on_finished():
	queue_free()
