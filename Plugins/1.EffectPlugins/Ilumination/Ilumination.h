#ifndef _ILUMINATION_H
#define _ILUMINATION_H

#include "plugin.h" 
#include <QGLShader>
#include <QGLShaderProgram>

class Ilumination: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 void onPluginLoad();
	 void preFrame();
	 void postFrame();
  private:
	QOpenGLShaderProgram* program;
    	QOpenGLShader *fs, *vs;
};

#endif
