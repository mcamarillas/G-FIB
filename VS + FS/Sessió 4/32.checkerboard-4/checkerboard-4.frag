#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int slice = 8;
uniform float n;
uniform vec4 negre = vec4(0);
uniform vec4 gris = vec4(0.8);
uniform vec4 vermell = vec4(1,0,0,1);

void main()
{
    // Trobar el quadrant al que pertany la cordenada de textura
    int quadrantX = int(vtexCoord.x * slice)%slice;
    int quadrantY = int(vtexCoord.y * slice)%slice;
    // Dintre del quadrant decidir com la pintem
    float fractQuadrantX = fract(vtexCoord.x * n);
    float fractQuadrantY = fract(vtexCoord.y * n);
    if(fractQuadrantX < 0.1 || fractQuadrantY < 0.1) fragColor = vermell;
    else discard;
}
