shader_type canvas_item;

uniform vec4 warna_flash : hint_color = vec4(1.0);
uniform float flash_modifier : hint_range(0.0,1.0) = 1.0;
void fragment(){
	vec4 warna = texture(TEXTURE,UV);
	warna.rgb = mix(warna.rgb, warna_flash.rgb,flash_modifier);
	COLOR = warna;
	
}