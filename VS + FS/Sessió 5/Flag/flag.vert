#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
out vec3 objectCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    
    frontColor = vec4(color,1.0);
    objectCoord = vec3(vertex.x , vertex.y * 3./4, vertex.z);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(objectCoord, 1.0);
}
