#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform sampler2D colorMap1;

in vec2 vtexCoord;

int sliceTextura = 10;
int sliceObjeto = 9;
uniform vec4 negre = vec4(0);
uniform vec4 gris = vec4(0.8);

uniform float time;
uniform float fps = 1000;

void main()
{
	float num;
	float x1 = vtexCoord.x*sliceObjeto;
	
    if(mod(x1,sliceObjeto) < 1) num = 6;
	else if(mod(x1,sliceObjeto) < 2) num = 0;
	else if(mod(x1,sliceObjeto) < 3) num = 1;
	else if(mod(x1,sliceObjeto) < 4) num = 3;
	else if(mod(x1,sliceObjeto) < 5) num = 5;
	else if(mod(x1,sliceObjeto) < 6) num = 9;
	else if(mod(x1,sliceObjeto) < 7) num = 1;
	else if(mod(x1,sliceObjeto) < 8) num = 2;
	else if(mod(x1,sliceObjeto) < 9) num = 7;

	float x = fract(vtexCoord.x*sliceObjeto)/10;
	float offset = num/sliceTextura;
    vec2 n = vec2(x + offset, vtexCoord.y);
	fragColor = texture(colorMap,n);
	if(fragColor.a < 0.5) {
		fragColor = texture(colorMap1,vtexCoord); 
		fragColor *= fragColor.w;	
	}
	else {
		vec4 tc = mix(texture(colorMap1,vtexCoord),vec4(1,0,1,1),0.35);
		fragColor = tc;
	}
	
}
