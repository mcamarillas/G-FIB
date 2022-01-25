#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float step = 0.2;
uniform vec4 grey = vec4(0.8,0.8,0.8,1);
uniform vec4 vermell = vec4(1,0,0,1);
uniform vec4 groc = vec4(1,1,0,1);
uniform vec4 blau = vec4(0,0,1,1);
uniform vec4 verd = vec4(0,1,0,1);
uniform vec4 cian = vec4(0,1,1,1);



void front(vec3 BT) {
	vec3 N = normalMatrix*vec3(0,0,1);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(-0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}

void top(vec3 BT) {
	vec3 N = normalMatrix*vec3(0,1,0);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(-0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}

void back(vec3 BT) {
	vec3 N = normalMatrix*vec3(0,0,-1);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}

void left(vec3 BT) {
	vec3 N = normalMatrix*vec3(-1,0,0);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(-0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}

void right(vec3 BT) {
	vec3 N = normalMatrix*vec3(1,0,0);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(0.5,0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}

void bot(vec3 BT) {
	vec3 N = normalMatrix*vec3(0,-1,0);
	
	gfrontColor = grey * N.z;
	vec3 v = vec3(-0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(-0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	v = vec3(0.5,-0.5,-0.5)*step;
	gl_Position = modelViewProjectionMatrix*vec4(v+BT,1);
	EmitVertex();
	
	EndPrimitive();
}


void pintarCub(vec3 BT) {
	front(BT);
	top(BT);
	back(BT);
	left(BT);
	right(BT);
	bot(BT);
}

void main( void )
{
	// Baricentre del triangle
	vec3 BT = (gl_in[0].gl_Position.xyz +
          	   gl_in[1].gl_Position.xyz +
          	   gl_in[2].gl_Position.xyz)/3;
  	BT /= step;
  	BT.x = int(BT.x);
  	BT.y=int(BT.y);
  	BT.z=int(BT.z);
  	BT*=step;
  	pintarCub(BT);
}
