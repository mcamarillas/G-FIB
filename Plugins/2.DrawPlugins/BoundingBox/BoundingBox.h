#ifndef _BOUNDINGBOX_H
#define _BOUNDINGBOX_H

#include "plugin.h" 

class BoundingBox: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void postFrame();
  private:
  
  	void crearCub();
  
	QOpenGLShaderProgram* program;
   	QOpenGLShader* vs;
    	QOpenGLShader* fs;
    	bool created;
    	
    	GLuint cubVAO;
    	GLuint coordsVBO;
    	GLuint colorVBO;
};

#endif
