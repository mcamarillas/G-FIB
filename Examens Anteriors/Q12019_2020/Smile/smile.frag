#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
in vec3 N;
out vec4 fragColor;

uniform sampler2D colorMap;
uniform vec4 negre = vec4(0);
void main()
{
    vec2 C1 = vec2(0.34, 0.65) - 0.1*N.xy;
    vec2 C2 = vec2(0.66, 0.65) - 0.1*N.xy;
	float d1 = distance(C1,vtexCoord.xy); // Coordenades en object space
    float d2 = distance(C2,vtexCoord.xy); // Coordenades en object space
    float s1 = step(0.05,d1);
    float s2 = step(0.05,d2);

    vec4 color = texture(colorMap,vtexCoord);
    vec4 color2 = mix(negre,color,s1);
    fragColor = mix(negre,color2,s2);
}
