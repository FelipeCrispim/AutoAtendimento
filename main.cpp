#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "triangle.h"
#include "client.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    qmlRegisterType<TriangleItem>("MyShapes", 1, 0, "Triangle");

    QQmlApplicationEngine engine;

    client clientt;
    clientt.doConnect("oloco meu");

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
