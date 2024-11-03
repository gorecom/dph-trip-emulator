extends AudioStreamPlayer

func _ready() -> void:
	self.finished.connect(self._on_sound_finished)
	
func _on_sound_finished() -> void:
	self.play()
