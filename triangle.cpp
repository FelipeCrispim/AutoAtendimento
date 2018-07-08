#include "triangle.h"

#include <QQuickWindow>
#include <QSGGeometryNode>

TriangleItem::TriangleItem(QQuickItem *parent):
    QQuickItem(parent),
    m_geometry(QSGGeometry::defaultAttributes_Point2D(), 3)
{
    setFlag(ItemHasContents);
//    m_material.setColor(Qt::transparent);
}

QSGNode* TriangleItem::updatePaintNode(QSGNode* n, UpdatePaintNodeData*)
{
    if (!n)
        n = new QSGNode;

    QSGGeometryNode* geomnode = new QSGGeometryNode();

    QSGGeometry::Point2D* v = m_geometry.vertexDataAsPoint2D();
    const QRectF rect = boundingRect();
    v[0].x = rect.left();
    v[0].y = rect.bottom();
    v[1].x = rect.left() + rect.width()/2;
    v[1].y = rect.top();
    v[2].x = rect.right();
    v[2].y = rect.bottom();
    geomnode->setGeometry(&m_geometry);
    geomnode->setMaterial(&m_material);

    n->appendChildNode(geomnode);
    return n;
}
