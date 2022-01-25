#version 330 core

in vec4 frontColor;
in vec3 normalEye;
in vec3 vertexEye;
in vec2 vtexCoord;
out vec4 fragColor;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;

uniform float time;
uniform sampler2D colorMap;

uniform vec3 color1 = vec3(0);
uniform vec3 color2 = vec3(0.8);

uniform bool canvi = true;

float tY ;
int tX;

vec4 Phong(vec3 N, vec3 V, vec3 L) {
   L = normalize(L);
   // Productes escalars y vector R
   float NL = max(0,dot(N,L));
   vec3 R = normalize(2*NL*N-L);
   float RV = max(0,dot(R,V));
   // Components llum
   float Ispec = 0;
   if(NL > 0) Ispec = pow(RV,matShininess);
   vec4 diffuse = matDiffuse*lightDiffuse*NL;
   vec4 specular = matSpecular*lightSpecular*Ispec;
   
   return diffuse/2 + specular;
}

void main()
{
    float xMax = boundingBoxMax.x;
    float yMax = boundingBoxMax.y;
    float zMax = boundingBoxMax.z;
    float xMin = boundingBoxMin.x;
    float yMin = boundingBoxMin.y;
    float zMin = boundingBoxMin.z;

	vec3 V = vertexEye;
    vec3 N = normalize(normalEye);  
    V = normalize(V);
 	vec3 L1 = vec3(xMax,yMax,zMax)-vertexEye; 
    vec3 L2 = vec3(xMax,yMax,zMin)-vertexEye; 
    vec3 L3 = vec3(xMax,yMin,zMax)-vertexEye; 
    vec3 L4 = vec3(xMax,yMin,zMin)-vertexEye; 
    vec3 L5 = vec3(xMin,yMax,zMax)-vertexEye; 
    vec3 L6 = vec3(xMin,yMax,zMin)-vertexEye; 
    vec3 L7 = vec3(xMin,yMin,zMax)-vertexEye; 
    vec3 L8 = vec3(xMin,yMin,zMin)-vertexEye; 
    vec4 ambient = matAmbient*lightAmbient;
    fragColor = ambient + Phong(N,V,L1) + Phong(N,V,L2) + Phong(N,V,L3) + Phong(N,V,L4) 
    + Phong(N,V,L5) + Phong(N,V,L6) + Phong(N,V,L7) + Phong(N,V,L8);
}