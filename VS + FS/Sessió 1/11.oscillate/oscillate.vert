#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform mat4 modelViewMatrix;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform float time;
uniform bool eyespace;



void main()
{
    // Diferència entre els extrems de la bounding box
    float incrX = (boundingBoxMax.x - boundingBoxMin.x);
    float incrY = (boundingBoxMax.y - boundingBoxMin.y);
    float incrZ = (boundingBoxMax.z - boundingBoxMin.z);
    // Calculem la diagonal de la bounding box
    float r = sqrt(incrX * incrX + incrY * incrY + incrZ * incrZ)/2;
    // Calculem la y depenent de si estem a eyespace o no
    float y = vertex.y;
    if(eyespace) {
        /* Per tenir el vértex a eyespace hem de multiplicar 
           el vertex per la modelViewMatrix */
        vec4 eyeVertexPosition = modelViewMatrix * vec4(vertex,1.0);
        y = eyeVertexPosition.y;
    }
    // Calculem la Amplitud segons a formula donada
    float d = (r/10)*y;
    /* Calculem el nou vertex com la suma del vertex i 
       el canvi de direcció de la normal*/
    vec3 newVertex = vertex + normal*d*sin(time);
    
    frontColor = vec4(color,1.0);
    
    gl_Position = modelViewProjectionMatrix * vec4(newVertex, 1.0);
}
