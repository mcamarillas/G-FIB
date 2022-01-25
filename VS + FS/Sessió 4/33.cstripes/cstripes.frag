#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform int nstripes = 100;
uniform vec2 origin  = vec2(0.5,0.5);

uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 groc = vec4(1,1,0,1);


void main()
{
    float distancia = distance(origin, vtexCoord);
    /* 1/nstripes <     distancia      < 2/nstripes ==> 
           1      < nstripes*distancia <     2
    */
    int quadrant = int(distancia*nstripes);
    if(quadrant%2 == 0) fragColor = vermell;
    else fragColor = groc;
}
