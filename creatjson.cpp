#include "creatjson.h"

creatjson::creatjson(QObject *parent) : QObject(parent)
{

}

void creatjson::addNewProduct(QString product, QString quantity, QString value, QString complement)
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

void creatjson::addClient(QString name, QString pay, QString change)
{
    QJsonObject newObject{
        {"name", name},
        {"pay", pay},
        {"change", change},
    };
    jsonArray.append(newObject);
    qDebug() << jsonArray;
}

void creatjson::removeProduct(int index)
{
    jsonArray.removeAt(index);
    qDebug() << jsonArray;
}

void creatjson::clearJson()
{
    //for(int i=0; i<jsonArray.size(); i++){
    //    jsonArray.removeAt(i);
    //}
    while(jsonArray.count()){
        jsonArray.pop_back();
    }
    qDebug() << jsonArray;
}

void creatjson::finishOrder()
{
    QJsonDocument jsonDoc(jsonArray);
    QByteArray byteJson = jsonDoc.toJson();
    char* message = byteJson.data();
    MQTT_Publisher *publisher = new MQTT_Publisher();
    if(publisher->send_message(message)){
        qDebug() << "erro ao enviar";
    }
    else{
        qDebug() << "enviado com sucesso";
        while(jsonArray.count()){
            jsonArray.pop_back();
        }
    }
}


