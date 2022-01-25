#ifndef _MODELINFO_H
#define _MODELINFO_H

#include "plugin.h" 
#include <QPainter>

class ModelInfo: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 
	void postFrame();
	void onPluginLoad();
    	void onObjectAdd();
  	void onSceneClear();
    	
  private:
  	void calculateSceneInfo();

	QPainter painter;
	int numObj = 0;
	int numPol = 0;
	int numVert = 0;
	int numTriangles = 0;
};

#endif
