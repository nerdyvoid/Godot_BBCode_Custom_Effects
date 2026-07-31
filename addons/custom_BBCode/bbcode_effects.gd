class_name BBCodeEffects

static func register_all(label: RichTextLabel) -> void:
	if not label: 
		return
	label.bbcode_enabled = true
	label.install_effect(load("res://addons/custom_BBCode/RichTextGold.gd").new())
	label.install_effect(load("res://addons/custom_BBCode/RichTextSilver.gd").new())
	label.install_effect(load("res://addons/custom_BBCode/RichTextSupercharge.gd").new())
	label.install_effect(load("res://addons/custom_BBCode/RichTextSoulOut.gd").new())
	label.install_effect(load("res://addons/custom_BBCode/RichTextLeave.gd").new())
	label.install_effect(load("res://addons/custom_BBCode/RickASCII.gd").new())
