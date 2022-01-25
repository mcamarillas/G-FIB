#version 330 core

in vec4 frontColor;
in vec3 normalEye;
in vec3 vertexEye;
in vec2 vtexCoord;
out vec4 fragColor;

uniform vec4 lightSpecular;
uniform vec4 lightPosition;

uniform vec4 matSpecular;
uniform float matShininess;

uniform float time;
uniform sampler2D colorMap;

uniform vec3 color1 = vec3(0);
uniform vec3 color2 = vec3(0.8);

uniform bool canvi = true;

float tY ;
int tX;

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
   // Calcular la llum difusa en funció del temps
   vec4 lightDiffuse;
   if(int(time) % 2 == 0) lightDiffuse = vec4(mix(color1,color2,fract(time)),1);
   else lightDiffuse = vec4(mix(color2,color1,fract(time)),1);
   // Calcular el material difús de l'bjecte segons la textura
   if(!canvi) {
   int t = int(time/2);
   tY = t%3;
   tX = t/3;
   }
   vec4 matDiffuse = texture(colorMap,vec2(vtexCoord.x/4 + tX/4.,vtexCoord.y/3 + (2-tY)/3));

   vec4 diffuse = matDiffuse*lightDiffuse*NL;
   vec4 specular = matSpecular*lightSpecular*Ispec;
   
   return diffuse + specular;
}

void main()
{
	vec3 V = -vertexEye;
 	vec3 L = lightPosition.xyz-vertexEye; 
    fragColor = Phong(normalEye,V,L);
}
