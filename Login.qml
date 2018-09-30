import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Item {
    height: root.height
    width: root.width
    Rectangle{
        id: recPop
        width: parent.width*0.35
        height: parent.height*0.7
        anchors.centerIn: parent
        color: "transparent"
        Popup{
            id: adminPopup
            height: parent.height
            width: parent.width
            modal: true
            focus: true
            closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
            Text{
                text: "CENTRAL DE COMANDOS"
                font.family: "Roboto"
                font.pixelSize: 25
                font.bold: true
                anchors.top: adminPopup.top
                anchors.topMargin: adminPopup.height*0.05
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Rectangle{
                anchors.centerIn: parent
                width: adminPopup.width
                //anchors.horizontalCenter: adminPopup.horizontalCenter
                Column{
                    anchors.centerIn: parent
                    spacing: 5
                    Button{
                        text: "Realizar teste"
                        font.family: "Roboto"
                        Material.background: "#5cb860"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        font.bold: true
                        height: adminPopup.height*0.2
                        onClicked: {
                            creatjson.addClient("TESTE", "TESTE","100", "100")
                            creatjson.finishOrder()
                        }
                    }
                }
            }
        }
    }

    Image {
        id: bug
        source: "qrc:/images/background.jpg"
        anchors.fill: parent
        smooth: true
        //        visible: false
    }

    FastBlur {
        anchors.fill: bug
        source: bug
        radius: 50
    }
    Rectangle {
        id: fundo
        height: parent.height*0.35
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.08
        color: "#88FFFFFF"
        Image {
            id: imageGaleto
            source: "qrc:/images/logo.png"
            height: parent.height*0.9
            fillMode: Image.PreserveAspectFit
            //                anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
        }
    }
    Rectangle{
        id: recGear
        height: parent.height*0.15
        width: parent.width*0.1
        anchors.right: parent.right
        anchors.rightMargin: height/1.2
        anchors.topMargin: width/1.5
        anchors.top: parent.top
        color: "transparent"
        //color: "red"
        Image {
            id: imageGear
            source:"qrc:/images/gear.png"
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                adminPopup.open()
            }
        }
    }

    Button {
        id: loginButton
        //            anchors.bottom: parent.bottom
        //            anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height*0.6
        text: "Fazer Pedido"
        font.family: "Roboto"
        focus: true
        Material.background: "#5cb860"
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
