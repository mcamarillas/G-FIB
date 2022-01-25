#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewProjectionMatrixInverse;
uniform vec3 boundingBoxMin;

uniform int i = 5;
uniform vec4 Negre = vec4(0,0,0,1);
uniform vec4 Vermell = vec4(1,0,0,1);

// Pintar tots els vertexs tal cual
void pintarObjecteTalQual() {
	for( int i = 0 ; i < 3 ; i++ ) {
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position;
		EmitVertex();
	}
	EndPrimitive();
}

// Replica L'objecte tal cual de color Color
void replicarObjecte(vec4 Color) {
	for (int i=0; i<3; ++i) {
	    gfrontColor = Color;
	    vec4 V = gl_in[i].gl_Position;
	    gl_Position = V;
    	    EmitVertex();
  	}
  	EndPrimitive();
}

// Dibuixa la silueta frontal de l'objecte de color Color
void siluetaFrontalObjecte(vec4 Color) {
	for (int i=0; i<3; ++i) {
	    gfrontColor = Color;
	    vec4 V = gl_in[i].gl_Position;
	    gl_Position = modelViewProjectionMatrix*V;
    	    EmitVertex();
  	}
  	EndPrimitive();
}

// Dibuixa l'objecte aplastat de color Color
void ombreObjecte(vec4 Color) {
	for (int i=0; i<3; ++i) {
	    gfrontColor = Color;
	    vec4 V = modelViewProjectionMatrixInverse*gl_in[i].gl_Position;
	    V.y = boundingBoxMin.y;
	    gl_Position = modelViewProjectionMatrix*V;
    	    EmitVertex();
  	}
  	EndPrimitive();
}

void desplazarObjecte(int posX, int posY, int posZ) {
	for(int i = 0; i < 3; ++i) {
		gfrontColor = vfrontColor[i];
		gl_Position = gl_in[i].gl_Position + vec4(posX,posY,posZ,1.);
    	    	EmitVertex();
	}
	EndPrimitive();
}

void main( void ) {
	if(i == 1) pintarObjecteTalQual();
	if(i == 2) replicarObjecte(Vermell);
	else if(i == 3) siluetaFrontalObjecte(Vermell);
	else if(i == 4) ombreObjecte(Vermell);
	else if(i == 5) {
		pintarObjecteTalQual();
		ombreObjecte(Negre);
	}
	else if(i == 6) desplazarObjecte(2,5,1);
}
