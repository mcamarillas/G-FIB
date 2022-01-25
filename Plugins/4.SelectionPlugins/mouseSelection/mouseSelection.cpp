#include "mouseSelection.h"
#include "glwidget.h"

void MouseSelection::onPluginLoad()
{
	QString vs_src =
    "#version 330 core\n"
    "layout (location=0) in vec3 vertex;"
    "layout (location=2) in vec3 color;"
    "uniform mat4 modelViewProjectionMatrix;"
    "uniform vec3 boundingBoxMin;"
    "uniform vec3 boundingBoxMax;"
    "out vec4 FrontColor;"
    "void main() {"
    "float x = boundingBoxMax.x - boundingBoxMin.x;"
    "float y = boundingBoxMax.y - boundingBoxMin.y;"
    "float z = boundingBoxMax.z - boundingBoxMin.z;"  
    "mat4 scale = mat4(vec4(x,0,0,0), vec4(0,y,0,0), vec4(0,0,z,0), vec4(0,0,0,1));"  
    "   FrontColor=vec4(color, 1);"
	"	vec3 centre = vec3(boundingBoxMin.x, boundingBoxMin.y, boundingBoxMin.z);"
	"   mat4 translation = mat4(vec4(1,0,0,0),vec4(0,1,0,0), vec4(0,0,1,0), vec4(centre,1));"
    "   gl_Position=modelViewProjectionMatrix*translation*scale*vec4(vertex,1);"
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
    createBox();
    seleccionat = scene()->selectedObject();
}

void MouseSelection::pintaBox(int i) {
    // establir modelViewProjection
    program->bind();
    GLWidget &g = *glwidget();
	
    QMatrix4x4 MVP=camera()->projectionMatrix()*camera()->viewMatrix();
    program->setUniformValue("modelViewProjectionMatrix", MVP);

    Scene* scn=scene();
    const vector<Object> &obj=scn->objects();
    
	// pintar la capsa contenidora de tots els objectes de l'escena
	if(i < obj.size()) {
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

void MouseSelection::postFrame()
{
	 if(seleccionat != -1) pintaBox(seleccionat);
}

void MouseSelection::onSceneClear() {
     seleccionat = -1;	
}

void MouseSelection::onObjectAdd()
{
	scene()->setSelectedObject(seleccionat+1);
	seleccionat = scene()->selectedObject();
}

void MouseSelection::createBox() {
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
		1, 0, 1,
		1, 0, 0,
		1, 0, 1,
		1, 1, 0,
		1, 0, 0,
		0, 0, 1,
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
}

void MouseSelection::keyPressEvent(QKeyEvent *ke) {
	switch (ke->key()){
		case Qt::Key_0:
			scene()->setSelectedObject(0);
			seleccionat = scene()->selectedObject();
			break;
		case Qt::Key_1:
			scene()->setSelectedObject(1);
			seleccionat = scene()->selectedObject();
			break;
		case Qt::Key_2:
			scene()->setSelectedObject(2);
			seleccionat = scene()->selectedObject();
			break;
		case Qt::Key_3:
			scene()->setSelectedObject(3);
			seleccionat =scene()->selectedObject();
			break;
		case Qt::Key_4:
			scene()->setSelectedObject(4);
			seleccionat =scene()->selectedObject();
			break;
		case Qt::Key_5:
			scene()->setSelectedObject(5);
			seleccionat =scene()->selectedObject();
			break;
		case Qt::Key_6:
			scene()->setSelectedObject(6);
			seleccionat =scene()->selectedObject();
			break;
		case Qt::Key_7:
			scene()->setSelectedObject(7);
			seleccionat = scene()->selectedObject();
			break;
		case Qt::Key_8:
			scene()->setSelectedObject(8);
			seleccionat =scene()->selectedObject();
			break;
		case Qt::Key_9:
			scene()->setSelectedObject(9);
			seleccionat =scene()->selectedObject();
			break;
	}
}


