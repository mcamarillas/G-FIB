#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec2 vtexCoord;
out vec3 P;
out vec3 N;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat3 normalMatrix;
uniform bool world;

void main()
{
    if(!world) {
        N = normalMatrix * normal; 
        P = (modelViewMatrix*vec4(vertex.xyz, 1)).xyz; // Punt en Eye Space
    } else {
        N = normal;
        P = vertex.xyz;
    }
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0);
}
