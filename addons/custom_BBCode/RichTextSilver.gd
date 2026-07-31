tool
class_name RichTextSilver
extends RichTextEffect

var bbcode = "silver"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	# DEFAULTS: speed=2.0, bright=1.0, freq=0.15
	var speed = float(char_fx.env.get("speed", 2.0))
	var bright = float(char_fx.env.get("bright", 1.0))
	var freq = float(char_fx.env.get("freq", 0.15))
	
	var dark_silver = Color("#546E7A")
	var base_silver = Color("#B0BEC5")
	var bright_silver = Color("#ECEFF1")
	var specular_white = Color("#FFFFFF")
	
	var cycle = fmod((char_fx.elapsed_time * speed) + (char_fx.absolute_index * freq), 1.0)
	
	var final_color: Color
	if cycle < 0.4:
		final_color = dark_silver.linear_interpolate(base_silver, cycle / 0.4)
	elif cycle < 0.7:
		final_color = base_silver.linear_interpolate(bright_silver, (cycle - 0.4) / 0.3)
	elif cycle < 0.85:
		final_color = bright_silver.linear_interpolate(specular_white, clamp(((cycle - 0.7) / 0.15) * bright, 0.0, 1.0))
	else:
		final_color = specular_white.linear_interpolate(dark_silver, (cycle - 0.85) / 0.15)
		
	final_color.a = char_fx.color.a
	char_fx.color = final_color
	
	return true
