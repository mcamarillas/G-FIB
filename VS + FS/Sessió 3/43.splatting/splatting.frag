#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D noise0;
uniform sampler2D rock1;
uniform sampler2D grass2;

in vec2 vtexCoord;

void main()
{
    vec4 rockTexture = texture(rock1,vtexCoord);
    vec4 grassTexture = texture(grass2,vtexCoord);
    vec4 noiseTexture = texture(noise0,vtexCoord);
    fragColor = frontColor.w * mix(rockTexture ,grassTexture,noiseTexture.r);
}
