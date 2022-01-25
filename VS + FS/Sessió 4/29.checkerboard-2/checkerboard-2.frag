#version 330 core

in vec4 frontColor; 
out vec4 fragColor;

in vec2 vtexCoord;
uniform float n;
uniform vec4 negre = vec4(0);
uniform vec4 gris = vec4(0.8);
void main()
{
	int x = int(mod(vtexCoord.x*n,2));
	int y = int(mod(vtexCoord.y*n,2));
	if(x == y) fragColor = gris;
	else fragColor = negre;
}
