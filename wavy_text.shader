shader_type canvas_item;

uniform float height = 3.0;
uniform float curve = 0.1;
uniform float speed = 3.0;

void vertex() {
    VERTEX.y += height*sin(VERTEX.x*curve+TIME*speed);
}