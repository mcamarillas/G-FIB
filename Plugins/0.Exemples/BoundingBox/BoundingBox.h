
#ifndef _BOUNDINGBOX_H
#define _BOUNDINGBOX_H

#include "plugin.h" 
#include <QOpenGLShader>
#include <QOpenGLShaderProgram>

class BoundingBox: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)
    
public:
    void onPluginLoad();
    void postFrame();
	void createBox();

private:
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
    
    bool created = false;
    GLuint cubeVAO;
    GLuint coordsVBO;
    GLuint colorVBO;
    
};

#endif
