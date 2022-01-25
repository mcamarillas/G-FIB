#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 v_os;
void main()
{
	vec4 vermell = vec4(1,0,0,1);
	vec4 groc = vec4(1,1,0,1);
	//WINDOW SPACE
	vec2 c = vec2(300,300); // Centre del Window
	float d = distance(c,gl_FragCoord.xy)/300; // Coordenades en window space
	float s = step(0.5,d); 
	float ss = smoothstep(0.5 - 0.1, 0.5 + 0.1, d);
	//OBJECT SPACE
	vec2 c_os = vec2(0,0); // Centre Object 
	float d_os = distance(c_os,v_os.xy); // Coordenades en object space
	float s_os = step(0.5,d_os); 
	float ss_os = smoothstep(0.5 - 0.1, 0.5 + 0.1, d_os);

    fragColor = mix(vermell,groc,ss);
}
