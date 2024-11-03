extends Control

@export var background: ColorRect
@export var button: Button

func _ready() -> void:
	self.button.pressed.connect(_on_pressed)

func _on_pressed() -> void:
	if self.button.pressed:
		self.background.visible = true
		self.button.add_theme_color_override("font_color", Color(0, 0, 255))

		# Check other buttons in the group
		if self.button.button_group:
			for btn in self.button.button_group.get_buttons():
				if btn != self.button:
					btn.set_pressed(false)
	else:
		self.background.visible = false
		self.button.add_theme_color_override("font_color", Color(255, 255, 255))
