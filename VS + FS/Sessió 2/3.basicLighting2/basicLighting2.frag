#version 330 core

in vec4 frontColor;
in vec3 N;
out vec4 fragColor;

void main()
{
    fragColor = frontColor*N.z;
}
