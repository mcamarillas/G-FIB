#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform vec2 mousePosition;
uniform float mouseOverrideX = -1;
uniform vec2 viewport = vec2(800,600);

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;

void main()
{
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(vec3(N.z),1.0);
    float alpha;
    if (mouseOverrideX == -1) {
        alpha = mousePosition.x*2 / (viewport.x) - 1;
    }
    else alpha = mouseOverrideX / (viewport.x - 0)/2 -1;

    vec4 columna1 = vec4(cos(alpha), 0, -sin(alpha), 0); 
    vec4 columna2 = vec4(0, 1, 0, 0); 
    vec4 columna3 = vec4(sin(alpha), 0, cos(alpha), 0); 
    vec4 columna4 = vec4(0, 0, 0, 1); 
    mat4 translation = mat4(columna1,columna2,columna3,columna4);

    float t = smoothstep(1.45, 1.55, vertex.y);
     
    vec4 P = modelViewProjectionMatrix * vec4(vertex, 1.0);
    vec4 Pp = modelViewProjectionMatrix * translation * vec4(vertex, 1.0);
    
    gl_Position = mix(P,Pp,t);
}
