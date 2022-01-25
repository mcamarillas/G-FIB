#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

vec3 newColor;

void main()
{   
    vec4 clippingPosition = modelViewProjectionMatrix * vec4(vertex, 1.0);
    float t = 4*(clippingPosition.y/clippingPosition.w+1)/(2);
    if(t < 1) newColor = mix(vec3(1,0,0),vec3(1,1,0),fract(t));
    else if(t < 2) newColor = mix(vec3(1,1,0),vec3(0,1,0),fract(t));
    else if(t < 3) newColor = mix(vec3(0,1,0),vec3(0,1,1),fract(t));
    else if(t < 4) newColor = mix(vec3(0,1,1),vec3(0,0,1),fract(t));
    else newColor = vec3(0,0,1);
    
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(newColor,1.0);
    
    vtexCoord = texCoord;
    gl_Position = clippingPosition;
}
