#version 330 core

in vec4 frontColor;
in vec3 N;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D window;
uniform sampler2D palm1;
uniform sampler2D background2;
uniform float time;

void main()
{
    vec4 C = texture(window, vtexCoord);
    if(C.w < 1.0) {
    	vec2 palmTexCoord = vtexCoord + 0.25*N.xy + vec2(0.1*sin(2*time)*vtexCoord.t, 0);
    	vec4 D = texture(palm1, palmTexCoord);
    	fragColor = D;
    	if(D.w < 0.5) {
    		vec2 backgroundTexCoord = vtexCoord + 0.5*N.xy;
    		fragColor = texture(background2,backgroundTexCoord);
    	}
    }
    else fragColor = C;
}
