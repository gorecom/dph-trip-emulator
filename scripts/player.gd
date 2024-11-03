extends CharacterBody3D
class_name Player3D


@export var move_speed: float = 6.0
@export var mouse_sensitivity: float = 0.006

@onready var PlayerCamera: Camera3D = $HeadNode3D/Camera3D
@onready var Head: Node3D = $HeadNode3D
@onready var FootstepAudioStreamPlayer: AudioStreamPlayer = $FootstepAudioStreamPlayer

var rotation_x: float = 0.0
var rotation_y: float = 0.0
var gravity: Vector3 = Vector3(0, -9.8, 0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float):
	handle_movement(delta)

func _input(event: InputEvent) -> void:
	handle_camera(event)

func handle_movement(delta: float):
	var input_vector_direction: Vector2 = \
		Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var movement_direction: Vector3 = \
		(Head.transform.basis * \
			Vector3(input_vector_direction.x, 0, input_vector_direction.y)).normalized()
	
	# Проверяем направление движения
	if movement_direction:
		self.velocity.x = movement_direction.x * move_speed
		self.velocity.z = movement_direction.z * move_speed
		
		# Если звук не играет, запускаем его
		if not FootstepAudioStreamPlayer.playing:
			FootstepAudioStreamPlayer.play()
	else:
		self.velocity.x = move_toward(self.velocity.x, 0, move_speed)
		self.velocity.z = move_toward(self.velocity.z, 0, move_speed)
		
		# Останавливаем звук, если игрок не движется
		if FootstepAudioStreamPlayer.playing:
			FootstepAudioStreamPlayer.stop()
	
	move_and_slide()

func handle_camera(event: InputEvent):
	# Use Input.get_mouse_motion() to get the mouse movement in Godot 4.x
	if event is InputEventMouseMotion:
		Head.rotate_y(-event.relative.x * mouse_sensitivity)
		PlayerCamera.rotate_x(-event.relative.y * mouse_sensitivity)
		PlayerCamera.rotation.x = clamp(
			PlayerCamera.rotation.x, 
			deg_to_rad(-90), 
			deg_to_rad(90)
		)
