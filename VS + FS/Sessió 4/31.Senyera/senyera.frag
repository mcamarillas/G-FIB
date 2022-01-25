#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int slice = 9;

uniform vec4 groc = vec4(1,1,0,1);
uniform vec4 vermell = vec4(1,0,0,1);

void main()
{
    int quadrant = int(vtexCoord.x * slice)%slice;
    if(quadrant%2 == 0) fragColor = groc;
    else fragColor = vermell;
    //fragColor = frontColor.z*fragColor;
}
