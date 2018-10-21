#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "triangle.h"
#include "mqtt_publisher.h"
#include "creatjson.h"
#include <qdebug.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<TriangleItem>("MyShapes", 1, 0, "Triangle");

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    Creatjson json;
    context->setContextProperty("creatjson", QVariant::fromValue(&json));
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
