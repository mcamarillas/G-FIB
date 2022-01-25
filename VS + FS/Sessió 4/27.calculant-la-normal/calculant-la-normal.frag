#version 330 core

in vec4 frontColor;
out vec4 fragColor;
in vec3 vertexCoord;

void main()
{
    /* normalitzem el producte vectorial de:
        - la Derivada del fragement y el seu adjacent respcte de X 
        - la Derivada del fragement y el seu adjacent respcte de Y 
    */
    vec3 normal = normalize(cross(dFdx(vertexCoord),dFdy(vertexCoord)));
    fragColor = frontColor * normal.z;
}
