#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform float speed = 0.2;
uniform float time;
uniform float angSpeed = 8;


void pintarObjecte() {
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}

void explote2() {

	vec3 translation = speed*time*(vnormal[0]+vnormal[1]+vnormal[2])/3;
	
	float a = time*angSpeed;
	mat3 rotationZ = mat3(vec3(cos(a), sin(a), 0),
              		     vec3(-sin(a), cos(a), 0), 
              		     vec3(0, 0, 1)); 
              		     
        vec3 translationCentre = (gl_in[0].gl_Position.xyz + gl_in[1].gl_Position.xyz + gl_in[2].gl_Position.xyz)/3;
	
	for(int i = 0; i < 3; i++) {
		
		gfrontColor = vfrontColor[i];
		
		vec3 v = gl_in[i].gl_Position.xyz - translationCentre;  // Traslladar al centre
		v = rotationZ * v;					  // Rotar sobre l'eix Z
		v = v + translation + translationCentre;		  // Traslladar al seu lloc mes la translació
		
		gl_Position = modelViewProjectionMatrix * vec4(v,1);
		EmitVertex();
	}
	EndPrimitive();
}


void main( void )
{
	explote2();
}
