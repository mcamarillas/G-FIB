#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform vec2 caselles = vec2(8,8);
uniform vec4 negre = vec4(0);
uniform vec4 gris = vec4(0.8);
void main()
{
	int x = int(mod(vtexCoord.x*caselles.x,2));
	int y = int(mod(vtexCoord.y*caselles.y,2));
	if(x == y) fragColor = gris;
	else fragColor = negre;
}
