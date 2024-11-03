@tool
extends CSGSphere3D


@export_range(0.001, 1.0, 0.001) var rotation_speed: float = 0.01


func _process(delta: float) -> void:
	self.rotation.y += rotation_speed * delta
