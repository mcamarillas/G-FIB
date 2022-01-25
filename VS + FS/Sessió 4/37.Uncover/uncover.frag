#version 330 core

in vec4 frontColor;
in vec3 vertexNDC;
out vec4 fragColor;

uniform vec4 blau = vec4(0,0,1,1);
uniform float time;

void main()
{
    if(vertexNDC.x > time || vertexNDC.y > time) discard;
    fragColor = blau;
}
