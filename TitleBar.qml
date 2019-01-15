import QtQuick 2.0
import QtQuick.Controls 2.1
import MyShapes 1.0
import QtGraphicalEffects 1.0

Rectangle {
    id: root
    color: '#774840'
    property alias title: words.text
    property alias icon: icon.source

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
    Row {
        anchors.centerIn: parent
        spacing: 20
        Image {
            id: icon
//            source: "qrc:/images/cart.png"
            height: parent.parent.height*0.5
            width: parent.parent.height*0.5
        }
        Text {
            id: words
            text: root.title
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            font.family: "Roboto"
            font.pixelSize: 25
            font.bold: true
        }
    }
}
