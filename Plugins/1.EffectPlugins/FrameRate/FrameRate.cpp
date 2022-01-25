#include "FrameRate.h"
#include "glwidget.h"

void FrameRate::postFrame() {
	QFont font;
  	font.setPixelSize(32);
  	painter.begin(glwidget());
  	painter.setFont(font);
  	int x = 15;
  	int y = 40;
  	painter.drawText(x, y, QString("fps: %1").arg(fps)); 
  	painter.end();
  	
  	++frames;
  	
  	if(elapsedTimer.elapsed() > 1000) {
  		elapsedTimer.start();
  		fps = frames;
  		frames = 1;
  	}
}

void FrameRate::onPluginLoad() {
	//start timer
  	elapsedTimer.start();
  	// keep repainting
  	QTimer *timer = new QTimer(this);
  	connect(timer, SIGNAL(timeout()), glwidget(), SLOT(updateGL()));
  	timer->start();
}


