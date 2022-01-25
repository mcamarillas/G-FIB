#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float amp = 0.1;
uniform float freq = 0.25;
uniform float time;
const float PI = 3.141592;

void main()
{
    float phi = amp*sin(2*PI*time*freq+vertex.y);
    mat4 rotation = mat4(    1,    0    ,     0    , 0,
    			      0, cos(phi), sin(phi), 0,
    			      0, -sin(phi),  cos(phi), 0,
    			      0,     0   ,     0    , 1);
    vec3 N = normalize(normalMatrix * normal);  
    frontColor = vec4(color,1.0)*N.z;
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * rotation*vec4(vertex, 1.0);
}
