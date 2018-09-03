#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "triangle.h"
#include "mqtt_publisher.h"
#include <qdebug.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<TriangleItem>("MyShapes", 1, 0, "Triangle");

    QQmlApplicationEngine engine;

    MQTT_Publisher *publisher = new MQTT_Publisher;
    bool messageWasSended = publisher->send_message("{pedido:{comida:{farofa}, bebida:{}}}");
    qDebug() << "MESSAGE WAS SENDED? " << messageWasSended;

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
