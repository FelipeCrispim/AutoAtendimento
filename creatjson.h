#ifndef CREATJSON_H
#define CREATJSON_H

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>
#include <QJsonDocument>
#include <QObject>
#include <QByteArray>
#include <QJsonValue>
#include <QDebug>
#include "mqtt_publisher.h"

class Creatjson : public QObject
{
    Q_OBJECT
public:
    explicit Creatjson(QObject *parent = nullptr);
    Q_INVOKABLE void addNewProduct(QString product, QString quantity, QString value, QString complement);
         Q_INVOKABLE void addClient(QString name, QString pay, QString change, QString totalValue);
         Q_INVOKABLE void removeProduct(int index);
         Q_INVOKABLE void clearJson();
         Q_INVOKABLE void finishOrder();
         QJsonArray jsonArray;
signals:

public slots:
};

#endif // CREATJSON_H
