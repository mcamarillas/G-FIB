#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D colorMap;
in vec2 vtexCoord;

void main()
{
    fragColor = frontColor*texture(colorMap,vtexCoord);
}
