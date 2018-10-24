import QtQuick 2.0
import QtQuick.Controls 2.1
import MyShapes 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    color: '#774840'
    property alias title: words.text

//    Image {
//        id: background
//        width: parent.width; height: parent.height
//        Rectangle {
//            anchors.fill: parent
//            color: "#774840"
//        }
//        visible: false
//    }
//    Item {
//        id: transframe
//        width: parent.width; height: parent.height
//        visible: false
//        Triangle {
//            antialiasing: true
//            anchors.bottom: parent.bottom;
//            anchors.horizontalCenter: parent.horizontalCenter
//            width: 15
//            height: 7
//        }
//    }
//    OpacityMask {
//        anchors.fill: background
//        source: background
//        maskSource: transframe
//        invert: true
//    }

    Text {
        id: words
        anchors.centerIn: parent
        anchors.leftMargin: 10
        anchors.left: parent.left
        text: root.title
        color: "white"
        font.family: "Roboto"
        font.pixelSize: 23
        font.bold: true
    }
}
