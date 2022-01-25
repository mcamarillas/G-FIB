#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

uniform vec3 boundingBoxMax;
uniform vec3 boundingBoxMin;

uniform float t = 0.4;
uniform float scale = 4.0;

void main()
{
    float yMax = boundingBoxMax.y;
    float yMin = boundingBoxMin.y;

    float c = mix(boundingBoxMin.y,boundingBoxMax.y,t);
    float A = c*scale - c;
    mat4 translate = mat4(1,0,0,0,
                          0,1,0,0,
                          0,0,1,0,
                          0,A,0,1);
    mat4 Mscale= mat4(1,0,0,0,
                      0,scale,0,0,
                      0,0,1,0,
                      0,0,0,1);

    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0) * N.z;
    vtexCoord = texCoord;

    if(vertex.y > c) gl_Position = modelViewProjectionMatrix * translate * vec4(vertex, 1.0);
    else gl_Position = modelViewProjectionMatrix * Mscale * vec4(vertex, 1.0);
}
