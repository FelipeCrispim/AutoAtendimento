
#include "creatjson.h"

Creatjson::Creatjson(QObject *parent) : QObject(parent)
{

}
void Creatjson::addNewProduct(QString product, QString quantity, QString value, QString complement)
{
    QJsonObject newObject{
        {"product", product},
        {"quantity", quantity},
        {"value", value},
        {"complement", complement}
    };
    jsonArray.append(newObject);
    qDebug() << jsonArray;
}

void Creatjson::addClient(QString name, QString pay, QString change, QString totalValue)
{
    int id = 11;   // décimo primeiro pedido do dia
    QJsonObject newObject{
        {"name", name},
        {"pay", pay},
        {"change", change},
        {"id", id},
        {"totalValue", totalValue}
    };
    jsonArray.append(newObject);
    qDebug() << jsonArray;
}

void Creatjson::removeProduct(int index)
{
    jsonArray.removeAt(index);
    qDebug() << jsonArray;
}

void Creatjson::clearJson()
{
    //for(int i=0; i<jsonArray.size(); i++){
    //    jsonArray.removeAt(i);
    //}
    while(jsonArray.count()){
        jsonArray.pop_back();
    }
    qDebug() << jsonArray;
}

void Creatjson::finishOrder()
{
    QJsonDocument jsonDoc(jsonArray);
    QByteArray byteJson = jsonDoc.toJson();
    char* message = byteJson.data();
    MQTT_Publisher *publisher = new MQTT_Publisher();
    if(publisher->send_message(message)){
        while(jsonArray.count()){
            jsonArray.pop_back();
        }
        qDebug() << jsonArray;
    }
}
