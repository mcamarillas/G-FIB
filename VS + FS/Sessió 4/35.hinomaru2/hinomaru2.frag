#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec2 vtexCoord;
uniform bool classic;

uniform float PI = 3.14159265359;
uniform float slice = 16;


void main() {
    float phi = PI/slice;
    vec4 blanc = vec4(1,1,1,1);
    vec4 vermell = vec4(1,0,0,1);
    vec2 centre = vec2(0.5,0.5);
    float distancia = distance(centre,vtexCoord.xy);
    float step = step(0.2,distancia);
    float theta;
    if(!classic) {
        vec2 u = vec2(vtexCoord.x-centre.x, vtexCoord.y-centre.y);
        theta = atan(u.s,u.t);
        if(step == 1 && mod(theta/phi,2) < 1) fragColor = blanc;
        else fragColor = vermell;
    }  
    else {
        if(step == 1) fragColor = blanc;
        else fragColor = vermell;
    }  
}
