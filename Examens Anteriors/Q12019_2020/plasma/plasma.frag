#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec2 vtexCoord;

uniform sampler2D fbm;
uniform float time;
const float pi = 3.14159;

uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 groc    = vec4(1,1,0,1);
uniform vec4 verd    = vec4(0,1,0,1);
uniform vec4 cian    = vec4(0,1,1,1);
uniform vec4 blau    = vec4(0,0,1,1);
uniform vec4 magenta = vec4(1,0,1,1);


void main()
{
    float r = texture(fbm,vtexCoord).r;
    float A = 1;
    float f = 0.1;
    float phi = 2*pi*r;

    float v = A*sin(2*pi*time*f + phi);

    float t = 6*(v+1.)/2.;
    vec4 newColor;
    if(t < 0) newColor = vermell;
    else if(t < 1) newColor = mix(vermell,groc,fract(t));
    else if(t < 2) newColor = mix(groc,verd,fract(t));
    else if(t < 3) newColor = mix(verd,cian,fract(t));
    else if(t < 4) newColor = mix(cian,blau,fract(t));
    else if(t < 5) newColor = mix(blau,magenta,fract(t));
    else if(t < 6) newColor = mix(magenta,vermell,fract(t));
    else newColor = vermell;

    fragColor = newColor;
}
