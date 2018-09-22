QT += qml quick svg
QT += network
CONFIG += c++11

SOURCES += main.cpp \
    triangle.cpp \
    mqtt_publisher.cpp \
    creatjson.cpp

RESOURCES += qml.qrc \
    images.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

unix:!macx {
    INCLUDEPATH += /usr/local/include/
    android: {
      QT += androidextras
    #  ANDROID_EXTRA_LIBS += /home/felipecrispim/Downloads/mosquitto/build/lib/cpp/libmosquittopp.so
    #  INCLUDEPATH += /home/felipecrispim/Downloads/mosquitto/lib/cpp
      LIBS += -L/usr/local/lib/mosquitto-android/cpp -lmosquittopp
    }
    !android:
    {
        LIBS += -L/usr/local/lib -lmosquittopp
    }
}

macx: {
    INCLUDEPATH += /usr/local/Cellar/mosquitto/1.5.1/include/
    LIBS += -L/usr/local/Cellar/mosquitto/1.5.1/lib -lmosquittopp
}

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

HEADERS += \
    triangle.h \
    mqtt_publisher.h \
    creatjson.h
