#include "AnimateVertices.h"
#include "glwidget.h"

void AnimateVertices::onPluginLoad()
{
	QString vs_src =
	"#version 330 core\n"
	"layout (location = 0) in vec3 vertex;"
	"layout (location = 1) in vec3 normal;"
	"layout (location = 2) in vec3 color;"
	"layout (location = 3) in vec2 texCoord;"
	"out vec4 frontColor;"
	"out vec2 vtexCoord;"
	"uniform mat4 modelViewProjectionMatrix;"
	"uniform mat3 normalMatrix;"
	"uniform float amplitude = 0.1;"
	"uniform float freq = 1;" // expressada en Hz
	"uniform float time;"
	"const float PI = 3.141592;"
	"vec3 newVertex = vertex + amplitude*sin(2*PI*time*freq)*normal;"
	"void main() {"
    
    		"vec3 N = normalize(normalMatrix * normal);"
   		"frontColor = vec4(vec3(N.z),1.0);"
    		"vtexCoord = texCoord;"
    		"gl_Position = modelViewProjectionMatrix * vec4(newVertex, 1.0);"
	"}";
	vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    	vs->compileSourceCode(vs_src);
    	cout << "VS log:" << vs->log().toStdString() << endl;
    	
    	QString fs_src =
    	"#version 330 core\n"

	"in vec4 frontColor;"
	"out vec4 fragColor;"

	"void main()"
	"{"
	    "fragColor = frontColor;"
	"}";
	fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
   	fs->compileSourceCode(fs_src);
  	cout << "FS log:" << fs->log().toStdString() << endl;

	program = new QOpenGLShaderProgram(this);
	program->addShader(vs);
    	program->addShader(fs);
    	program->link();
    	cout << "Link log:" << program->log().toStdString() << endl;
    	
    	//start timer
  	elapsedTimer.start();
  	// keep repainting
  	QTimer *timer = new QTimer(this);
  	connect(timer, SIGNAL(timeout()), glwidget(), SLOT(updateGL()));
  	timer->start();
}

void AnimateVertices::preFrame()
{
	 // bind shader and define uniforms
  	program->bind();
 	program->setUniformValue("time", float(elapsedTimer.elapsed()/1000.0f));
	QMatrix3x3 NM=camera()->viewMatrix().normalMatrix();
	program->setUniformValue("normalMatrix", NM); 
	QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
	program->setUniformValue("modelViewProjectionMatrix", MVP);
}

void AnimateVertices::postFrame()
{	
	// unbind shader
  	program->release();
}


