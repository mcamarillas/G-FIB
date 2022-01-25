#include "BoundingBox.h"
#include "glwidget.h"

void BoundingBox::onPluginLoad() {
	QString vs_src =
    "#version 330 core\n"
    "layout (location=0) in vec3 vertex;"
    "layout (location=2) in vec3 color;"
    "uniform mat4 modelViewProjectionMatrix;"
    "uniform vec3 boundingBoxMin;"
    "uniform vec3 boundingBoxMax;"
    "out vec4 FrontColor;"
    "void main() {"
    "int x = 4;"
    "int y = 2;"
    "int z = 4;"  
    "mat4 scale = mat4(vec4(x,0,0,0), vec4(0,y,0,0), vec4(0,0,z,0), vec4(0,0,0,1));"  
    "   FrontColor=vec4(color, 1);"
    "   gl_Position=modelViewProjectionMatrix*scale*vec4(vertex,1);"
	"}";
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
	vs -> compileSourceCode(vs_src);
	cout << "VS log: " << vs -> log().toStdString() << endl;
	
    QString fs_src =
    "#version 330 core\n"
    "in vec4 FrontColor;"
    "out vec4 fragColor;"
    "void main() {"
    "   fragColor=FrontColor;"
    "}";
	fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceCode(fs_src);
    cout << "FS log:" << fs->log().toStdString() << endl;

    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    cout << "Link log:" << program->log().toStdString() << endl;

    created = false;
    
}

void BoundingBox::postFrame() {
	createBox();
}
void BoundingBox::createBox() {
    program->bind();
    GLWidget &g = *glwidget();
    g.makeCurrent();    
    if (!created)
    {	
		created = true;
		float coords[] = { 
			0, 0, 0,
            0, 1, 0,
            1, 0, 0,
            1, 1, 0,
            1, 0, 1,
            1, 1, 1,
            0, 0, 1,
            0, 1, 1,
            0, 0, 0,
            0, 1, 0,
            };

		float color[] = { 
			1, 0, 0,
    		1, 0, 0,
   			1, 0, 1,
            1, 0, 0,
            1, 0, 0,
    		1, 1, 0,
   			1, 0, 0,
            1, 0, 0,
            1, 0, 0,
            1, 0, 1,
            1, 1, 0};
        
        // Create & bind empty VAO
        g.glGenVertexArrays(1, &cubVAO);
        g.glBindVertexArray(cubVAO);
		// Create VBO
		g.glGenBuffers(1, &coordsVBO);
        g.glBindBuffer(GL_ARRAY_BUFFER, coordsVBO);
        g.glBufferData(GL_ARRAY_BUFFER, sizeof(coords), coords, GL_STATIC_DRAW);
		g.glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);
        g.glEnableVertexAttribArray(0);

		g.glGenBuffers(1, &colorVBO);
        g.glBindBuffer(GL_ARRAY_BUFFER, colorVBO);
        g.glBufferData(GL_ARRAY_BUFFER, sizeof(color), color, GL_STATIC_DRAW);
		g.glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, 0, 0);
        g.glEnableVertexAttribArray(2);
	}
    // establir modelViewProjection
    QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
    program->setUniformValue("modelViewProjectionMatrix", MVP);

    Scene* scn=scene();
    const vector<Object> &obj=scn->objects();
    for (int i=0; i<(int)obj.size(); ++i) {
        // pintar la capsa contenidora de tots els objectes de l'escena
        program->setUniformValue("boundingBoxMin",obj[i].boundingBox().min());
        program->setUniformValue("boundingBoxMax",obj[i].boundingBox().max());
        g.glBindVertexArray(cubVAO);
        g.glPolygonMode( GL_FRONT_AND_BACK, GL_LINE ); // activar pintar nomes linies
        g.glDrawArrays(GL_TRIANGLE_STRIP, 0, 10);
        g.glPolygonMode( GL_FRONT_AND_BACK, GL_FILL ); // desactivar
        g.glBindVertexArray(0);
    }
    program->release();
}

