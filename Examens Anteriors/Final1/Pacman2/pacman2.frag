#version 330 core

in vec4 frontColor;
out vec4 fragColor;

uniform sampler2D colorMap;
in vec2 vtexCoord;

uniform int sliceObjecte = 11;
uniform int sliceTextura = 6;

void main()
{
    // QUADRANTS
    int quadrantX = int(vtexCoord.x * sliceObjecte);
    int quadrantY = int(vtexCoord.y * sliceObjecte);
    
    if((quadrantY == 0 || quadrantY == sliceObjecte -1) && (quadrantX != 0 && quadrantX != sliceObjecte - 1)) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 3./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if((quadrantX == 0 || quadrantX == sliceObjecte -1) && (quadrantY != 0 && quadrantY != sliceObjecte - 1)) {
    	float x = fract(vtexCoord.x*sliceObjecte);
    	float y = fract(vtexCoord.y*sliceObjecte)/6;
    	float offset = 3./6;
    	fragColor = texture(colorMap,vec2(y + offset,x));
    }
    else if((quadrantY%2 == 0) && (quadrantX > 1 && quadrantX < sliceObjecte - 2)) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 3./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if((quadrantX == 3 && quadrantY == 3)) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 1./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if((quadrantX == 5 && quadrantY == 3)) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 6./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if((quadrantX == 1 && quadrantY == 3)) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 5./6;
    	fragColor = texture(colorMap,vec2(-(x + offset),y));
    }
    else if(quadrantX == 0 && quadrantY == 0) {
    	float x = 1- fract(vtexCoord.x*sliceObjecte)/6;
    	float y = 1- fract(vtexCoord.y*sliceObjecte);
    	float offset = 5./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    
    else if(quadrantX == sliceObjecte -1 && quadrantY == sliceObjecte -1) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 4./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if(quadrantX == 0 && quadrantY == sliceObjecte -1) {
    	float x = 1 - fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 5./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    else if(quadrantX == sliceObjecte - 1 && quadrantY == 0) {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = 1 - fract(vtexCoord.y*sliceObjecte);
    	float offset = 4./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
    
    
    else {
    	float x = fract(vtexCoord.x*sliceObjecte)/6;
    	float y = fract(vtexCoord.y*sliceObjecte);
    	float offset = 5./6;
    	fragColor = texture(colorMap,vec2(x + offset,y));
    }
}
