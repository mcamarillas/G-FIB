#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;

void pintarQuadratFondo() {
		gfrontColor = vec4(1,0,1,1);
		vec4 v = vec4(-1,1,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(-1,-1,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(1,1,0.99999,1);
		gl_Position = v;
		EmitVertex();
		v = vec4(1,-1,0.99999,1);
		gl_Position = v;
		EmitVertex();
		EndPrimitive();
}

void pintarTerra() {
	float R = length(boundingBoxMax-boundingBoxMin)/2;
        vec3 C = (boundingBoxMax+boundingBoxMin)/2;
        float y = boundingBoxMin.y-0.01;
        
        gfrontColor = vec4(0,1,1,1);
        vec4 v = vec4(C.x+R, y, C.z+R,1);
        gl_Position = modelViewProjectionMatrix*v;
        EmitVertex();
        
        v = vec4(C.x+R, y, C.z-R,1);
        gl_Position = modelViewProjectionMatrix*v;
        EmitVertex();
        
        v = vec4(C.x-R, y, C.z+R,1);
        gl_Position = modelViewProjectionMatrix*v;
        EmitVertex();
        
        v = vec4(C.x-R, y, C.z-R,1);
        gl_Position = modelViewProjectionMatrix*v;
        EmitVertex();
        
        EndPrimitive();
}

void pintarObjecte(){
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
    EndPrimitive();
}

void pintarOmbra() {
	for(int i = 0; i < 3; i++) {
		gfrontColor = vec4(0,0,0,1);
		vec4 V = modelViewProjectionMatrixInverse*gl_in[i].gl_Position;
		V.y = boundingBoxMin.y;
		gl_Position = modelViewProjectionMatrix*V;
		EmitVertex();
	}
	EndPrimitive();
}

void main( void ) {
	pintarObjecte();
	pintarOmbra();	
	if(gl_PrimitiveIDIn == 0) {
		pintarQuadratFondo();
		pintarTerra();
	}
	
}
