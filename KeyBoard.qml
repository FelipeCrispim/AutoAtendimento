import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.2
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0
Item {
    property alias nextButton: nextButton
    width: parent.width
    height: parent.height

    Timer {
        id: timerWait
        interval: 500; running: false; repeat: false

        onTriggered: {
            console.log("indo...")
            name = fieldName.text
            change = fieldChange.text
            creatjson.addClient(name, pay,change, tValue)
            if(creatjson.finishOrder()) {
                titleBar.title = "Pedido feito corretamente"
                msgValidate.text = "Aguarde na mesa. Seu nome será chamado."
                animCheck.playing = true
                timerGif.start()
            } else {
                titleBar.title = "Erro no pedido"
                msgValidate.text = "Por favor, chame um de nossos atendentes para verificar o ocorrido."
                animCheck.source = "qrc:/images/error.png"

            }

            name = ""
            pay = ""
            change = ""
        }
        onRunningChanged: {
            if(running == true) {
                buttonsRow.visible = false
                columnPagamento.visible = false
                columnValidate.visible = true
                titleBar.title = "Aguarde, fazendo pedido..."
            }

        }
    }
    Rectangle{
        height: parent.height
        width: parent.width
        //border.color: "orange"
        anchors.bottom: parent.bottom

        Rectangle{
            id: lineZero
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: parent.top; anchors.leftMargin: parent.width*0.1;anchors.topMargin: parent.width*0.001
            //   border.color: "black"
            Row{
                spacing: 1
                Repeater {
                    model: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
                    Rectangle{
                        height: lineTwo.height; width: lineTwo.width*0.0955
                        border.color: "orange"
                        border.width: 2
                        radius: 5
                        Text {
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: parent.height*0.3
                            text: modelData
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(fieldChange.visible){
                                    fieldChange.text = fieldChange.text + modelData

                                }
                            }
                            onPressed: {
                                parent.color = "grey"
                            }
                            onReleased: {
                                parent.color = "white"
                            }
                        }
                    }
                }
            }
        }



        Rectangle{
            id: lineOne
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: lineZero.bottom; anchors.topMargin: parent.height*0.01; anchors.leftMargin: parent.width*0.05
            //  border.color: "black"
            Row{
                spacing: 1
                Repeater {
                    model: ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "."]
                    Rectangle{
                        height: lineOne.height; width: lineOne.width*0.0955
                        border.color: "orange"
                        border.width: 2
                        radius: 5
                        Text {
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: parent.height*0.3
                            text: modelData
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(fieldName.visible){
                                    fieldName.text = fieldName.text + modelData
                                }
                            }
                            onPressed: {
                                parent.color = "grey"
                            }
                            onReleased: {
                                parent.color = "white"
                            }
                        }
                    }
                }
            }
        }






        Rectangle{
            id: lineTwo
            height: parent.height*0.24; width: parent.width*0.8
            anchors.left: parent.left; anchors.top: lineOne.bottom; anchors.leftMargin: parent.width*0.1; anchors.topMargin: parent.height*0.01
            //border.color: "black"
            Row{
                spacing: 1
                Repeater {
                    model: ["A", "S", "D", "F", "G", "H", "J", "K", "L"]
                    Rectangle{
                        height: lineOne.height; width: lineOne.width*0.0955
                        border.color: "orange"
                        border.width: 2
                        radius: 5
                        Text {
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: parent.height*0.3
                            text: modelData
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(fieldName.visible){
                                    fieldName.text = fieldName.text + modelData
                                }
                            }
                            onPressed: {
                                parent.color = "grey"
                            }
                            onReleased: {
                                parent.color = "white"
                            }
                        }
                    }
                }
                Rectangle{
                    height: lineTwo.height; width: lineTwo.width*0.15
                    border.color: "orange"
                    border.width: 2
                    radius: 5
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/images/delete.png"
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if(fieldName.visible){
                                fieldName.remove(fieldName.length-1, fieldName.length)
                            }
                            else{
                                fieldChange.remove(fieldChange.length-1, fieldChange.length)
                            }
                        }
                        onPressed: {
                            parent.color = "grey"
                        }
                        onReleased: {
                            parent.color = "white"
                        }
                    }
                }
            }
        }



        Rectangle{
            id: lineThree
            height: parent.height*0.24; width: parent.width*0.95
            anchors.left: parent.left; anchors.top: lineTwo.bottom; anchors.topMargin: parent.height*0.01; anchors.leftMargin:  parent.height*0.06
            Row{
                spacing: 1
                /*   RoundButton{
                    height: lineThree.height; width: lineThree.width*0.2
                    text: "Cancelar"
                    font.bold: true
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                }*/
                RoundButton {
                    id: cancelButton
                    //visible: false
                    text: "Cancelar"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#ef494e"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    font.bold: true
                    height: lineThree.height
                    width: lineThree.width*0.2
                    onClicked: {
                        pay = ""
                        name = ""
                        change = ""
                        stackView.pop()
                    }
                }
                Repeater {
                    model: ["Z", "X", "C", "V", "B", "N", "M"]
                    Rectangle{
                        height: lineOne.height; width: lineOne.width*0.0955
                        border.color: "orange"
                        border.width: 2
                        radius: 5
                        Text {
                            anchors.centerIn: parent
                            font.bold: true
                            font.pixelSize: parent.height*0.3
                            text: modelData
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(fieldName.visible){
                                    fieldName.text = fieldName.text + modelData
                                }
                            }
                            onPressed: {
                                parent.color = "grey"
                            }
                            onReleased: {
                                parent.color = "white"
                            }
                        }
                    }
                }

                /*RoundButton{
                    height: lineThree.height; width: lineThree.width*0.22
                    text: "Finalizar"
                    font.bold: true
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                }*/

                RoundButton {
                    id: nextButton
                    // visible: false
                    enabled: {
                        if(columnChange.visible == true){
                            fieldChange.acceptableInput ? fieldChange.color = "#5cb860" : fieldChange.color = "red"
                            return fieldChange.acceptableInput ? true :false
                        }
                        else
                            return fieldName.text == "" ? false:true
                    }
                    text: "Prosseguir"
                    font.family: "Roboto"
                    focus: true
                    Material.background: "#5cb860"
                    Material.foreground: "white"
                    font.pixelSize: 20
                    font.bold: true
                    height: lineThree.height; width: lineThree.width*0.22
                    onClicked: {
                        if(nextButton.text == "Finalizar"){
                            timerWait.running = true
//                                                        name = fieldName.text
//                                                        change = fieldChange.text
//                                                        creatjson.addClient(name, pay,change, tValue)
//                                                        buttonsRow.visible = false
//                                                        columnPagamento.visible = false
//                                                        columnValidate.visible = true
//                                                        if(creatjson.finishOrder()) {
//                                                            titleBar.title = "Pedido feito corretamente"
//                                                            msgValidate.text = "Aguarde na mesa. Seu nome será chamado."
//                                                            animCheck.playing = true
//                                                            timerGif.start()
//                                                        } else {
//                                                            titleBar.title = "Erro no pedido"
//                                                            msgValidate.text = "Por favor, chame um de nossos atendentes para verificar o ocorrido."
//                                                            animCheck.source = "qrc:/images/error.png"

//                                                        }

//                                                        name = ""
//                                                        pay = ""
//                                                        change = ""
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
            }
        }
    }
}
