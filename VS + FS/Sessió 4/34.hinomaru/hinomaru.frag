#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform float radi = 0.2;
uniform float threshold = 0.05;
void main()
{
    vec4 vermell = vec4(1,0,0,1);
    vec4 blanc = vec4(1,1,1,1);
    float d = distance(vec2(0.5,0.5),vtexCoord.xy);
    // sense antialiasing    
    float s = step(radi,d);
    // amb antialiasing
    float ss = smoothstep(radi - threshold,radi + threshold,d);

    fragColor= frontColor.z*mix(vermell,blanc,ss);
}
