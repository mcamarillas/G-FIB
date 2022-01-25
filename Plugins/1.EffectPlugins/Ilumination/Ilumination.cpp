#include "Ilumination.h"
#include "glwidget.h"

void Ilumination::onPluginLoad()
{
	QString vs_src =
	"#version 330 core\n layout (location = 0) in vec3 vertex; layout (location = 1) in vec3 normal; layout (location = 2) in vec3 color; layout (location = 3) in vec2 texCoord; out vec2 vtexCoord; out vec3 P; out vec3 N; uniform mat4 modelViewProjectionMatrix; uniform mat4 modelViewMatrix; uniform mat3 normalMatrix; void main() { N = normalMatrix * normal; P = (modelViewMatrix*vec4(vertex.xyz, 1)).xyz; vtexCoord = texCoord; gl_Position = modelViewProjectionMatrix * vec4(vertex, 1.0); }";
	
	vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    	vs->compileSourceCode(vs_src);
    	cout << "VS log:" << vs->log().toStdString() << endl;
    	
    	QString fs_src =
    	"#version 330 core\n in vec3 N; in vec3 P; out vec4 fragColor; uniform vec4 lightAmbient; uniform vec4 lightDiffuse; uniform vec4 lightSpecular; uniform vec4 lightPosition; uniform vec4 matAmbient; uniform vec4 matDiffuse; uniform vec4 matSpecular; uniform float matShininess; vec4 Phong(vec3 N, vec3 V, vec3 L) { N = normalize(N); V = normalize(V); L = normalize(L); float NL = max(0,dot(N,L)); vec3 R = normalize(2*NL*N-L); float RV = max(0,dot(R,V)); float Ispec = 0; if(NL > 0) Ispec = pow(RV,matShininess); vec4 ambient = matAmbient*lightAmbient; vec4 diffuse = matDiffuse*lightDiffuse*NL; vec4 specular = matSpecular*lightSpecular*Ispec; return ambient + diffuse + specular; } void main() { vec3 V = -P; vec3 L = lightPosition.xyz-P; fragColor = Phong(N,V,L); }";
	
	fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
   	fs->compileSourceCode(fs_src);
  	cout << "FS log:" << fs->log().toStdString() << endl;

	program = new QOpenGLShaderProgram(this);
	program->addShader(vs);
    	program->addShader(fs);
    	program->link();
    	cout << "Link log:" << program->log().toStdString() << endl;
}

void Ilumination::preFrame()
{
	// bind shader and define uniforms
  	program->bind();
	QMatrix3x3 NM=camera()->viewMatrix().normalMatrix();
	program->setUniformValue("normalMatrix", NM); 
	QMatrix4x4 MV=camera()->viewMatrix();
	program->setUniformValue("modelViewMatrix", MV);
	QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
	program->setUniformValue("modelViewProjectionMatrix", MVP);
	
	program->setUniformValue("lightAmbient", QVector4D(Vector(0.1,0.1,0.1),1));
    	program->setUniformValue("lightDiffuse", QVector4D(Vector(1,1,1),1));
    	program->setUniformValue("lightSpecular", QVector4D(Vector(1,1,1),1));
    	program->setUniformValue("lightPosition", QVector4D(0,0,0,1));
 
    	program->setUniformValue("matAmbient", QVector4D(Vector(0.8, 0.8, 0.6),1));
    	program->setUniformValue("matDiffuse", QVector4D(Vector(0.8, 0.8, 0.6),1));
    	program->setUniformValue("matSpecular", QVector4D(Vector(1.0, 1.0, 1.0),1));
    	program->setUniformValue("matShininess", GLfloat(64.0));
}

void Ilumination::postFrame()
{
	// unbind shader
  	program->release();
}

