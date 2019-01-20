#include "creatjson.h"
#include <QSettings>
#include <QStandardPaths>
#include <QDate>
#include <QDateTime>

int MOSQ_SUCCESS = 0;
QString m_path = QStandardPaths::writableLocation(QStandardPaths::ConfigLocation);
QSettings settings(m_path + "/config.ini", QSettings::IniFormat);
int todayMoneyNote = 0;
int todayMoneyCredit = 0;

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
        {"totalValue", totalValue},
        {"date", QDateTime::currentDateTime().toString("dd-MM-yyyy hh:mm")}
    };

    if(pay.contains("cartao")){
        todayMoneyCredit = totalValue.toInt();
        todayMoneyNote = 0;
    } else {
        todayMoneyNote = totalValue.toInt();
        todayMoneyCredit = 0;
    }

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
    qDebug() << __FUNCTION__ << ": "<< jsonArray;
}

bool Creatjson::finishOrder()
{
    QJsonDocument jsonDoc(jsonArray);
    QByteArray byteJson = jsonDoc.toJson();
    char* message = byteJson.data();
    MQTT_Publisher *publisher = new MQTT_Publisher();

    if(publisher->send_message(message) == MOSQ_SUCCESS){
        while(jsonArray.count()){
            jsonArray.pop_back();
        }

        if(QDate::currentDate().day() != settings.value("currentDay")){
            settings.setValue("currentDay", QDate::currentDate().day());
            settings.setValue("todayMoneyNote", 0);
            settings.setValue("todayMoneyCredit", 0);
        }
        settings.setValue("todayMoneyCredit", 20);
        settings.setValue("todayMoneyNote", todayMoneyNote + settings.value("todayMoneyNote").toInt());
        settings.setValue("todayMoneyCredit", todayMoneyCredit + settings.value("todayMoneyCredit").toInt());
        settings.sync();
        qDebug() << "!!!" << settings.value("todayMoneyCredit").toString();

        return true;
    } else {
        return false;
    }
}

void Creatjson::report()
{
    QString temp = "Dinheiro: R$" + settings.value("todayMoneyNote").toString() +
            ", Cartao: R$" + settings.value("todayMoneyCredit").toString();
    QJsonObject newObject{
        {"name", "Finalizacao do dia"},
        {"pay", temp},
        {"change", ""},
        {"id", ""},
        {"totalValue", ""},
        {"date", QDateTime::currentDateTime().toString("dd-MM-yyyy hh:mm")}
    };

    todayMoneyNote = 0;
    todayMoneyCredit = 0;
    jsonArray.append(newObject);
    finishOrder();
}

