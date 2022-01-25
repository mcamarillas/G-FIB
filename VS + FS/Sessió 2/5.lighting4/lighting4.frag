#version 330 core

in vec3 N;
in vec3 P;
out vec4 fragColor;

uniform vec4 lightAmbient;
uniform vec4 lightDiffuse;
uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matAmbient;
uniform vec4 matDiffuse;
uniform vec4 matSpecular;
uniform float matShininess;

vec4 Phong(vec3 N, vec3 V, vec3 L) {
   // Vectors de llum normalitzats
   N = normalize(N);  
   V = normalize(V);
   L = normalize(L);
   // Productes escalars y vector R
   float NL = max(0,dot(N,L));
   vec3 R = normalize(2*NL*N-L);
   float RV = max(0,dot(R,V));
   // Components llum
   float Ispec = 0;
   if(NL > 0) Ispec = pow(RV,matShininess);
   vec4 ambient = matAmbient*lightAmbient;
   vec4 diffuse = matDiffuse*lightDiffuse*NL;
   vec4 specular = matSpecular*lightSpecular*Ispec;
   
   return ambient + diffuse + specular;
}

void main()
{
    vec3 V = -P;
 	vec3 L = lightPosition.xyz-P;
    fragColor = Phong(N,V,L);
}
