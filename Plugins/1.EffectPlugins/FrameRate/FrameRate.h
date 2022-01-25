#ifndef _FRAMERATE_H
#define _FRAMERATE_H

#include "plugin.h" 
#include <QPainter>
#include <QElapsedTimer>

class FrameRate: public QObject, public Plugin
{
	Q_OBJECT
	Q_PLUGIN_METADATA(IID "Plugin") 
	Q_INTERFACES(Plugin)

  public:
	 
	void postFrame();
	void onPluginLoad();
    	
  private:
    	QElapsedTimer elapsedTimer;
	QPainter painter;
	int frames = 0;
	int fps = 0;
};

#endif
