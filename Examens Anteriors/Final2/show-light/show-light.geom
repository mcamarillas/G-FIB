#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewMatrixInverse;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;
uniform vec4 lightPosition;

uniform mat4 projectionMatrix;
uniform float w = 0.3;

uniform vec4 vermell = vec4(1,0,0,1);

void dibuixarQuadratFondo() {
		vec4 lightPosition1 = projectionMatrix*lightPosition;
		gfrontColor = vec4(1,0,1,1);
		vec4 v = vec4(-1+lightPosition1.x,1+lightPosition1.y,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(-1+w+lightPosition1.x,1+lightPosition1.y,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(-1+lightPosition1.x,1-w+lightPosition1.y,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(-1+w+lightPosition1.x,1-w+lightPosition1.y,0.99999,1);
		gl_Position = v;
		EmitVertex();
		
		EndPrimitive();
}

void dibuixarQuadrat() {
	vec3 P = (modelViewMatrix*vec4(gl_in[0].gl_Position.xyz, 1)).xyz;
	vec3 V = -P;
 	vec3 lightPosition1 = lightPosition.xyz-P;
 	lightPosition1 = normalize(lightPosition1);
	gfrontColor = vermell;
	gl_Position = vec4(lightPosition1.x-w,lightPosition1.y-w,0.99999,1);
	EmitVertex();
	gl_Position = vec4(lightPosition1.x+w,lightPosition1.y-w,0.99999,1);
	EmitVertex();
	gl_Position = vec4(lightPosition1.x-w,lightPosition1.y+w,0.99999,1);
	EmitVertex();
	gl_Position = vec4(lightPosition1.x+w,lightPosition1.y+w,0.99999,1);
	EmitVertex();
	EndPrimitive();
}


void main( void )
{
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
    if(gl_PrimitiveIDIn == 0) dibuixarQuadrat();
}
