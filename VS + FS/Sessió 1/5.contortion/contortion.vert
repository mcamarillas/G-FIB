 #version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time;
uniform mat4 viewMatrix;

void main()
{
   float A = 0;;
   if(vertex.y > 0.5) A = (vertex.y-0.5)*sin(time);
   mat4 rotation = mat4(1,    0    ,     0    , 0,
    			 0,  cos(A) ,  sin(A)  , 0,
    			 0, -sin(A) ,  cos(A)  , 0,
    			 0,     0   ,     0    , 1);
    mat4 translation1 = mat4(1 , 0 , 0 , 0,
    			      0 , 1 , 0 , 1,
    			      0 , 0 , 1 , 0,
    			      0 , 0 , 0 , 1);
    mat4 translation2 = mat4(1 , 0 , 0 , 0,
                             0 , 1 , 0 , -1,
                             0 , 0 , 1 , 0,
                             0 , 0 , 0 , 1);
    vec3 N = normalize(normalMatrix * normal);
    frontColor = vec4(color,1.0);
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * translation1 * rotation * translation2 * vec4(vertex, 1.0);
}
