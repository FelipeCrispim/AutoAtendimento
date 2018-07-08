#ifndef TRIANGLE_H
#define TRIANGLE_H

#include <QQuickItem>
#include <QSGGeometry>
#include <QSGFlatColorMaterial>

class TriangleItem: public QQuickItem
{
    Q_OBJECT
public:
    TriangleItem(QQuickItem* parent = 0);

protected:
    QSGNode* updatePaintNode(QSGNode*, UpdatePaintNodeData*);

private:
    QSGGeometry m_geometry;
    QSGFlatColorMaterial m_material;
};

#endif // TRIANGLE_H
