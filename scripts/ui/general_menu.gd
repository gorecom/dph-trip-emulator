extends Control
class_name ControlGeneralMenu


""" Variables """

# UI elements for the menus and buttons
@onready var MainMenu: ControlMainMenu = $MainMenu
@onready var SettingsMenu: ControlSettingsMenu = $SettingsMenu
@onready var AboutMenu: Control = $AboutMenu 	# FIXME: Add ControlAboutMenu


# NodePath for the default startup menu 
@export_node_path var DefaultStartupMenu: NodePath


""" Functions """

func _ready() -> void:
	""" Called when the node is ready. Initializes signals, 
		sets the startup menu, and updates labels. """
	
	pass
	
	
