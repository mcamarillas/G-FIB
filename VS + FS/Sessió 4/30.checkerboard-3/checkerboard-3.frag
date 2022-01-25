#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform float n = 8;
uniform vec4 negre = vec4(0);
uniform vec4 gris = vec4(0.8);

void main()
{
	float x = fract(vtexCoord.x*n);
	float y = fract(vtexCoord.y*n);
	if(x < 0.1 || y < 0.1) fragColor = negre;
	else fragColor = gris;
}
