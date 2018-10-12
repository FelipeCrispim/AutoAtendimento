import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Item {
    height: root.height
    width: root.width
    property string tValue: ""
    property string pay: ""
    property string name: ""
    property string change: ""
    Timer {
        id: timer
        interval: 5000; running: false; repeat: false
        onTriggered: {
            stackView.restart()
        }
    }
    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: "#88FF9800"
        DropShadow {
            anchors.fill: container
            horizontalOffset: 6
            verticalOffset: 6
            radius: 8.0
            samples: 17
            color: "#55000000"
            source: container
        }
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
                height: 70
                width: parent.width
                anchors.top: container.top
            }
            Column {
                id: columnValidate
                anchors.centerIn: parent
                visible: false
                spacing: 50
                Text {
                    id: msgValidate
                    anchors.horizontalCenter: parent.horizontalCenter
                    topPadding: titleBar.height
                    width: parent.parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    text: "Aguarde na mesa. Seu nome será chamado."
                    font.bold: true
                    font.family: "Roboto"
                    font.pixelSize: 20
                }
                AnimatedImage {
                    id: animCheck
                    property int count: animCheck.currentFrame
                    source: "qrc:/images/check.gif"
                    height: parent.parent.height*0.5
                    width: parent.parent.height*0.5
                    playing: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    onCountChanged: {
                        if(count == 70)
                            animCheck.playing = false
                    }
                }
            }
            Column{
                id: columnPagamento
                anchors.centerIn: parent
                spacing: parent.height*0.05
                Column {
                    anchors.horizontalCenter: parent.horizontalCenter
                    spacing: 10
                    Column {
                        id: columnChange
                        visible: false
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing: 10
                        Text {
                            text: "Valor total do seu pedido: R$ " + tValue
                            font.bold: true
                            font.family: "Roboto"
                            font.pixelSize: 20
                        }
                        Row {
                            spacing: 10
                            Text {
                                text: "Quanto você dará em dinheiro: "
                                font.bold: true
                                font.family: "Roboto"
                                font.pixelSize: 20
                                anchors.verticalCenter: parent.verticalCenter
                            }
                            TextField {
                                id: fieldChange
                                font.family: "Roboto"
                                font.pixelSize: 20
                                font.bold: true
                                horizontalAlignment: TextInput.AlignHCenter
                                inputMask: "0000"
                                validator: IntValidator {}
                            }
                        }
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
                    id: buttonsRow
                    spacing: 30

                    RoundButton {
                        id: btnMoney
                        height: container.height*0.35
                        width: container.width*0.45
                        text: "Dinheiro"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#5cb860"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        font.bold: true
                        icon.source: "qrc:/images/money.png"
                        icon.height: btnMoney.height*0.82
                        icon.width: btnMoney.height*0.82
                        onClicked: {
                            pay = "dinheiro"
                            titleBar.title = "Para facilitar o troco, informe quanto será pago"
                            columnChange.visible = true
                            fieldChange.focus = true
                            btnMoney.visible = false
                            btnCard.visible = false
                            nextButton.visible = true
                            cancelButton.visible = true
                        }
                    }

                    RoundButton {
                        id: cancelButton
                        visible: false
                        text: "Cancelar"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#ef494e"
                        Material.foreground: "white"
                        font.pixelSize: 25
                        font.bold: true
                        height: container.height*0.3
                        width: container.width*0.35
                        onClicked: {
                            pay = ""
                            name = ""
                            change = ""
                            stackView.pop()
                        }
                    }
                    RoundButton {
                        id: nextButton
                        visible: false
                        enabled: {
                            if(columnChange.visible == true)
                                return fieldChange.text == "" ? false:true
                            else
                                return fieldName.text == "" ? false:true
                        }
                        text: "Prosseguir"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#5cb860"
                        Material.foreground: "white"
                        font.pixelSize: 25
                        font.bold: true
                        height: container.height*0.3
                        width: container.width*0.35
                        onClicked: {
                            if(nextButton.text == "Finalizar"){
                                name = fieldName.text
                                change = fieldChange.text
                                creatjson.addClient(name, pay,change, tValue)
                                buttonsRow.visible = false
                                columnPagamento.visible = false
                                columnValidate.visible = true
                                if(creatjson.finishOrder()) {
                                    titleBar.title = "Pedido feito corretamente"
                                    animCheck.playing = true
                                    timer.start()
                                } else {
                                    titleBar.title = "Erro no pedido"
                                    msgValidate.text = "Por favor, chame um de nossos atendentes para verificar o ocorrido."
                                    animCheck.source = "qrc:/images/error.png"

                                }

                                name = ""
                                pay = ""
                                change = ""
                            }
                            if(columnChange.visible == true) {
                                titleBar.title = "Informe seu nome para ser chamado"
                                nextButton.text = "Finalizar"
                                columnChange.visible = false
                                fieldName.visible = true
                                fieldName.focus = true
                            }
                        }
                    }


                    RoundButton {
                        id: btnCard
                        height: container.height*0.35
                        width: container.width*0.45
                        text: "Cartão"
                        font.family: "Roboto"
                        focus: true
                        Material.background: "#5cb860"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        font.bold: true
                        icon.source: "qrc:/images/card.png"
                        icon.height: btnCard.height*0.82
                        icon.width: btnCard.height*0.82
                        onClicked: {
                            pay = "cartao"
                            titleBar.title = "Informe seu nome para ser chamado"
                            nextButton.visible = true
                            nextButton.text = "Finalizar"
                            btnMoney.visible = false
                            btnCard.visible = false
                            columnChange.visible = false
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
