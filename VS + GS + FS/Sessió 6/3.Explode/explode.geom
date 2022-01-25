#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
in vec3 vnormal[];
out vec4 gfrontColor;

uniform float speed = 0.05;
uniform float time;
uniform mat4 modelViewProjectionMatrix;

void pintarObjecte() {
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    	EndPrimitive();
}


void explota() {
	vec3 translation = speed*time*(vnormal[0]+vnormal[1]+vnormal[2])/3;
	for( int i = 0 ; i < 3 ; i++ ) {
	// Transforma array en vec3
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix*(gl_in[i].gl_Position + vec4(translation,0));
		EmitVertex();
	}	
	EndPrimitive();
}


void main( void ) {
	explota();
}
