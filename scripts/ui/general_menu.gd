extends Control
class_name ControlGeneralMenu


""" Variables """

# UI elements for the menus and buttons
@onready var MainMenu: ControlMainMenu = $MainMenu
@onready var SettingsMenu: ControlSettingsMenu = $SettingsMenu
@onready var CreditsMenu: Control = $CreditsMenu 	# FIXME: Add ControlCreditsMenu

#
@onready var BackToMenu: Control = $BackToMenu
@onready var BackToMenuButton: Button = $BackToMenu/MarginContainer/BackToMenuButton


""" Functions """

func _ready() -> void:
	""" Called when the node is ready. Initializes signals, 
		sets the startup menu, and updates labels. """
	
	self.BackToMenuButton.pressed.connect(self._on_back_to_menu_pressed)

func _on_back_to_menu_pressed() -> void:
	if self.BackToMenuButton.pressed:
		self.change_to_menu_main()

func change_to_menu_main() -> void:
	self.MainMenu.visible = true
	self.SettingsMenu.visible = false
	self.CreditsMenu.visible = false
	self.BackToMenu.visible = false

func change_to_settings_menu() -> void:
	self.MainMenu.visible = false
	self.SettingsMenu.visible = true
	self.CreditsMenu.visible = false
	self.BackToMenu.visible = true

func change_to_credits_menu() -> void:
	self.MainMenu.visible = false
	self.SettingsMenu.visible = false
	self.CreditsMenu.visible = true
	self.BackToMenu.visible = true
