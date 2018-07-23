import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Item {
    height: root.height
    width: root.width

    Image {
        id: bug
        source: "qrc:/background.jpg"
        anchors.fill: parent
        smooth: true
        //        visible: false
    }

    FastBlur {
        anchors.fill: bug
        source: bug
        radius: 50
    }
    Column {
        spacing: 80
        anchors.fill: parent
        topPadding: 50
        Rectangle {
            id: fundo
            height: parent.height*0.35
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#88FFFFFF"
            Image {
                id: imageGaleto
                source: "qrc:/logo.png"
                height: parent.height*0.9
                fillMode: Image.PreserveAspectFit
                //                anchors.horizontalCenter: parent.horizontalCenter
                anchors.centerIn: parent
            }
        }

        //        Label {
        //            id: olaText
        //            text: qsTr("Olá, seja bem-vindo!\nAperte o botão para fazer o pedido!")
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            horizontalAlignment: Text.AlignHCenter
        //            font.family: "Roboto"
        //            font.pixelSize: 25
        //            font.bold: true
        //        }
        Button {
            id: loginButton
            //            anchors.bottom: parent.bottom
            //            anchors.bottomMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Fazer Pedido"
            font.family: "Roboto"
            focus: true
            Material.background: "#4CAF50"
            Material.foreground: "white"
            font.pixelSize: 25
            font.bold: true
            height: parent.height*0.2
            width: parent.width*0.25
            onClicked: {
                stackView.push(telaPedido)
            }
        }
    }

}
