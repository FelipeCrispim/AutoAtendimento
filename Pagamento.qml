import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1

Item {
    height: root.height
    width: root.width
    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: Material.accent
        Pane{
            id: panePagamento
            anchors.centerIn: parent
            width: parent.width*0.5
            height: parent.height*0.7
            clip: true
            Material.elevation: 13

            Column{
                id: columnPagamento
                anchors.centerIn: parent
                spacing: parent.height*0.05
                anchors.horizontalCenter: parent.horizontalCenter
                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Label {
                        id: lblPayment
                        text: qsTr("Escolha a forma de pagamento")
                        width: panePagamento.width*0.5
                        wrapMode: Label.WordWrap
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Roboto"
                        font.pixelSize: 20
                        font.bold: true
                    }
                    TextField {
                        id: fieldChange
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Roboto"
                        font.pixelSize: 20
                        font.bold: true
                    }
                }
                Row {
                    spacing: 30
                    Button {
                        id: btnMoney
                        height: 160
                        width: 250
                        text: "Dinheiro"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        icon.source: "qrc:/money.png"
                        icon.height: btnMoney.height*0.82
                        icon.width: btnMoney.height*0.82
                        onClicked: {
                            lblPayment.text = "Por favor, informe-nos para quanto será o troco do valor de X reais"
                            lblPayment.width = panePagamento.width*0.8
                            fieldChange.visible = true
                            fieldChange.focus = true
                        }
                    }

                    Button {
                        id: btnCard
                        height: 160
                        width: 250
                        text: "Cartão"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        icon.source: "qrc:/card.png"
                        icon.height: btnCard.height*0.82
                        icon.width: btnCard.height*0.82
                        onClicked: {
                        }
                    }
                }


            }
        }
    }
}
