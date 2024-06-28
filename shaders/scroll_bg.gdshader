shader_type canvas_item;

uniform float speed;
uniform float custom_time; // GDScript에서 전달받을 시간 값

void fragment() {
    COLOR = texture(TEXTURE, vec2(UV.x + custom_time * speed, UV.y));
}
