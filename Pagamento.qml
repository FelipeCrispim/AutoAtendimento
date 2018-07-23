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
        Rectangle {
            id: container
            anchors.centerIn: parent
            width: parent.width*0.5
            height: parent.height*0.7
            clip: true
            Material.elevation: 13
            TitleBar {
                id: titleBar
                title: "Escolha a forma de pagamento"
                height: 60
                width: parent.width
                anchors.top: container.top
            }
            Column{
                id: columnPagamento
                anchors.centerIn: parent
                spacing: parent.height*0.05
                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    TextField {
                        id: fieldChange
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Roboto"
                        font.pixelSize: 20
                        font.bold: true
                        horizontalAlignment: TextInput.AlignHCenter
                        inputMask: "000"
                        validator: IntValidator {}
                    }
                    TextField {
                        id: fieldName
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: "Roboto"
                        font.pixelSize: 20
                        font.bold: true
                        horizontalAlignment: TextInput.AlignHCenter
                        validator: RegExpValidator {regExp: /[a-zA-Z]+/}
                    }
                }
                Row {
                    spacing: 30
                    Button {
                        id: btnMoney
                        height: container.height*0.35
                        width: container.width*0.45
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
                            titleBar.title = "Para facilitar o troco, informe quanto será pago"
                            fieldChange.visible = true
                            fieldChange.focus = true
                            btnMoney.visible = false
                            btnCard.visible = false
                            nextButton.visible = true
                            cancelButton.visible = true
                        }
                    }

                    Button {
                        id: nextButton
                        visible: false
                        enabled: {
                            if(fieldChange.visible == true)
                                return fieldChange.text == "" ? false:true
                            else
                                return fieldName.text == "" ? false:true
                        }
                        text: "Prosseguir"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 25
                        font.bold: true
                        height: container.height*0.3
                        width: container.width*0.35
                        onClicked: {
                            if(fieldChange.visible == true) {
                                titleBar.title = "Informe seu nome para ser chamado"
                                nextButton.text = "Finalizar"
                                fieldChange.visible = false
                                fieldName.visible = true
                                fieldName.focus = true
                            }
                        }
                    }

                    Button {
                        id: cancelButton
                        visible: false
                        text: "Cancelar"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#ED3237"
                        Material.foreground: "white"
                        font.pixelSize: 25
                        font.bold: true
                        height: container.height*0.3
                        width: container.width*0.35
                        onClicked: {
                            stackView.pop()
                        }
                    }

                    Button {
                        id: btnCard
                        height: container.height*0.35
                        width: container.width*0.45
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
                            titleBar.title = "Informe seu nome para ser chamado"
                            nextButton.visible = true
                            nextButton.text = "Finalizar"
                            btnMoney.visible = false
                            btnCard.visible = false
                            fieldChange.visible = false
                            fieldName.visible = true
                            fieldName.focus = true
                            cancelButton.visible = true
                        }
                    }
                }
            }
        }
    }
}
