#include "ModelInfo.h"
#include "glwidget.h"

void ModelInfo::postFrame() {
	QFont font;
  	font.setPixelSize(32);
  	painter.begin(glwidget());
  	painter.setFont(font);
  	int x = 15;
  	int y = 40;
  	painter.drawText(x, y, QString("#Objects: %1").arg(numObj));
  	painter.drawText(x, y + 40, QString("#Objectes: %1").arg(numObj)); 
  	painter.drawText(x, y + 80, QString("#Poligons: %1").arg(numPol)); 
  	painter.drawText(x, y + 120, QString("#Vertex: %1").arg(numVert)); 
  	painter.drawText(x, y + 160, QString("%Triangles: %1%").arg(numTriangles/numPol*100));  
  	painter.end();	
}

void ModelInfo::onPluginLoad() {
	calculateSceneInfo();
}

void ModelInfo::onObjectAdd() {
	calculateSceneInfo();
}

void ModelInfo::onSceneClear() {
	calculateSceneInfo();
}

void ModelInfo::calculateSceneInfo() {
	numPol = 0;
	numTriangles = 0;
	numVert = 0;
	vector<Object> objects = scene()->objects();
	numObj = objects.size();
	for(unsigned int i = 0; i < objects.size(); ++i) {
		numPol += objects[i].faces().size();
		numVert += objects[i].vertices().size();
		for(unsigned int j = 0; j < objects[i].faces().size(); ++j) {
			if(objects[i].faces()[j].numVertices() == 3) numTriangles++;
		} 
	}
}

