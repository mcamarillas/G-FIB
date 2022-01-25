#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 normalEye;
out vec3 vertexEye;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

void main()
{
    normalEye = normalMatrix * normal;
    vertexEye = (modelViewMatrix*vec4(vertex.xyz, 1)).xyz;
    frontColor = vec4(color,1.0) * normalEye.z;
    vtexCoord = vec2(fract(texCoord.x),fract(texCoord.y));
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
