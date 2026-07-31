extends Control

onready var text_label = $TextLabel

func _ready():
	# Register everything automatically using your helper
	BBCodeEffects.register_all(text_label)
	
	text_label.bbcode_text = """
[center]
[gold]-- GOLD EFFECT --[/gold]
[silver]-- SILVER EFFECT --[/silver]
[supercharge]-- SUPERCHARGED --[/supercharge]
[soul_out]-- SOUL OUT --
/  \\[/soul_out]
[rick_ascii]
   o
  /|\\
  / \\[/rick_ascii]
[/center]
"""
