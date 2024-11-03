extends Control
class_name ControlMainMenu


@onready var PlayButton: Button = $MarginContainer/ButtonsBoxContainer/PlayButton
@onready var SettingsButton: Button = $MarginContainer/ButtonsBoxContainer/SettingsButton
@onready var CreditsButton: Button = $MarginContainer/ButtonsBoxContainer/CreditsButton
@onready var QuitButton: Button = $MarginContainer/ButtonsBoxContainer/QuitButton

var ParentalMenu: ControlGeneralMenu


func on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test_scene.scn")

func on_quit_button_pressed() -> void:
	get_tree().quit()

func _ready() -> void:
	ParentalMenu = self.get_parent_control()
	
	self._initialize_signals()
	
	# DiscordRPC.app_id = 1302642781977710684
	# DiscordRPC.details = "privet"
	# DiscordRPC.state = "eto zombalniy"
	# DiscordRPC.refresh()

func _initialize_signals() -> void:
	PlayButton.pressed.connect(self.on_start_button_pressed)
	SettingsButton.pressed.connect(self.ParentalMenu.change_to_settings_menu)
	CreditsButton.pressed.connect(self.ParentalMenu.change_to_credits_menu)
	QuitButton.pressed.connect(self.on_quit_button_pressed)
