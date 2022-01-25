#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat4 modelViewProjectionMatrix;
uniform mat4 modelViewMatrix;

uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 verd = vec4(0,1,0,1);
uniform vec4 blau = vec4(0,0,1,1);

void dibuixarCapsa() {
	gfrontColor = vermell;
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix *vec4(boundingBoxMin.x,boundingBoxMax.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMax.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMax.y,boundingBoxMax.z,1);
	EmitVertex();
	EndPrimitive();
	
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMax.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMax.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMax.y,boundingBoxMax.z,1);
	EmitVertex();
	EndPrimitive();
	
	gfrontColor = verd;
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMax.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMax.z,1);
	EmitVertex();
	EndPrimitive();
	
	gfrontColor = blau;
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMin.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMin.x,boundingBoxMax.y,boundingBoxMin.z,1);
	EmitVertex();
	gl_Position = modelViewProjectionMatrix * vec4(boundingBoxMax.x,boundingBoxMax.y,boundingBoxMin.z,1);
	EmitVertex();
	EndPrimitive();
}

void main( void )
{	
	float Rx = (boundingBoxMax.x-boundingBoxMin.x)/2;
	float Ry = (boundingBoxMax.y-boundingBoxMin.y)/2;
	float Rz = (boundingBoxMax.z-boundingBoxMin.z)/2;
        vec3 C = (boundingBoxMax+boundingBoxMin)/2;
	for( int i = 0 ; i < 3 ; i++)
	{
		vec4 camera = modelViewMatrix * gl_in[i].gl_Position;
		
		if(((camera.x > C.x-Rx) && (camera.x < C.x+Rx)) && ((camera.y > C.y-Ry) && (camera.y < C.y+Ry)) && ((camera.z > C.z-Rz) && (camera.z < C.z+Rz))) gfrontColor = 2*vfrontColor[i];
		else gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
    	EndPrimitive();
    	if(gl_PrimitiveIDIn == 0)dibuixarCapsa();
}
