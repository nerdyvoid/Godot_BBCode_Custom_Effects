tool
class_name RichTextGold
extends RichTextEffect

var bbcode = "gold"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var speed = float(char_fx.env.get("speed", 2.0))
	var shine_intensity = float(char_fx.env.get("shine", 1.0))
	var freq = float(char_fx.env.get("freq", 0.15))
	
	# Force time advancement even if RichTextLabel isn't ticking elapsed_time in editor
	var t = char_fx.elapsed_time
	if t == 0.0:
		t = OS.get_ticks_msec() / 1000.0
		
	var cycle = fmod((t * speed) + (char_fx.absolute_index * freq), 1.0)
	
	# Solid distinct test colors
	var dark_gold = Color(0.55, 0.40, 0.03, 1.0)
	var base_gold = Color(1.0, 0.84, 0.0, 1.0)
	var bright_gold = Color(1.0, 0.96, 0.56, 1.0)
	var specular_white = Color(1.0, 1.0, 1.0, 1.0)
	
	var final_color: Color
	if cycle < 0.4:
		final_color = dark_gold.linear_interpolate(base_gold, cycle / 0.4)
	elif cycle < 0.7:
		final_color = base_gold.linear_interpolate(bright_gold, (cycle - 0.4) / 0.3)
	elif cycle < 0.85:
		final_color = bright_gold.linear_interpolate(specular_white, clamp(((cycle - 0.7) / 0.15) * shine_intensity, 0.0, 1.0))
	else:
		final_color = specular_white.linear_interpolate(dark_gold, (cycle - 0.85) / 0.15)
	
	# FORCE ALPHA TO 1.0 explicitly (don't rely on char_fx.color.a)
	final_color.a = 1.0
	char_fx.color = final_color
	
	return true
