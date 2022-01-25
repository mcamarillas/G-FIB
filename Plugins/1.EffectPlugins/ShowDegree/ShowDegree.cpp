#include "ShowDegree.h"
#include "glwidget.h"

void ShowDegree::onPluginLoad()
{
	vector<Object> objects = scene()->objects();
	
	vector<Vertex> vertex = objects[0].vertices();
	
	vector<Face> faces = objects[0].faces();
	
	for(unsigned int i = 0; i < vertex.size(); ++i) {
		for(unsigned int j = 0; j < faces.size(); ++j) {
			for(int k = 0; k < faces[j].numVertices(); ++k) {
				if(faces[j].vertexIndex(j) == i) ++suma;
				}
		}
		
	}
	suma /= vertex.size();	
}

void ShowDegree::postFrame()
{
	QFont font;
  	font.setPixelSize(32);
  	painter.begin(glwidget());
  	painter.setFont(font);
  	int x = 15;
  	int y = 40;
  	painter.drawText(x, y, QString("#Objects: %1").arg(suma));
  	painter.end();	
}



