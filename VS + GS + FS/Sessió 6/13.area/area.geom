#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 projectionMatrix;
uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 groc = vec4(1,1,0,1);

const float areamax = 0.0005;

void main( void )
{
	vec4 u = gl_in[0].gl_Position - gl_in[1].gl_Position;
	vec4 v = gl_in[2].gl_Position - gl_in[1].gl_Position;
	
	vec3 w = cross(u.xyz,v.xyz);
	
	float d = length(w)/(2*areamax);
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = mix(vermell,groc,d);
		gl_Position = projectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    	EndPrimitive();
}
