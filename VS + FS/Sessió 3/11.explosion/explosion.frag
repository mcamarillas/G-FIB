#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D colorMap;
in vec2 vtexCoord;

uniform float time;
uniform float fps = 30;

void main()
{
    int frame = int(time*fps);
    float incrementoX = float(frame%8)/8;
    float incrementoY = 5./6 - float(frame/8)/6;
    vec2 tc = vec2(vtexCoord.x + incrementoX,vtexCoord.y + incrementoY);
    fragColor = texture(colorMap,tc); 
    fragColor *= fragColor.w;	
}
