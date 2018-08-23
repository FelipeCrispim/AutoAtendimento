import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtGraphicalEffects 1.0

Item {
    height: root.height
    width: root.width
    property var pedidofinal1: ""
    property var pedidofinal2: ""
    property var auxvalor1: ""
    property var auxvalor2: ""
    property var valorFinal: 0
    ListModel{
        id: contactModel
        ListElement { produto: "Executivo de Galeto"; valor: "13.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Boi   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Porco   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Calabresa   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Executivo de Galinha Guisada   ";    valor: "14.00"; tipo: 1; chave: "Executivos"}
        ListElement { produto: "Coxa e SobreCoxa   ";    valor: "6.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa de Frango";   valor: "2.50"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Calabresa mista";   valor: "2.00"; tipo: 2; chave: "Carnes"}
        ListElement { produto: "Coca-Cola 2l   ";    valor: "8.50"; tipo: 2; chave: "Bebidas"}
    }


    Component {
        id: sectionHeading
        Rectangle {
            width: listPedido.width
            height: listPedido.height/10
            color: "white"
            Text {
                text: section
                font.bold: true
                font.family: "Cursive"
                leftPadding: 10
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 20
            }
            Rectangle {
                width: parent.width-10
                height: 2
                color: "#22333333"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
        }
    }
    Component {
        id: contactDelegate
        Rectangle {
            id: recDelegate
            width: parent.width; height: listPedido.height/10
            //            border.color: "grey"
            //            radius: 5
            Text { text: produto;
                font.family: "Cursive"
                font.pixelSize: 20
                anchors.left: recDelegate.left
                anchors.leftMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Text { text: '<b>R$: ' + valor + '</b>';
                font.family: "Cursive"
                font.pixelSize: 20
                anchors.right: recDelegate.right
                anchors.rightMargin: 10
                anchors.verticalCenter: recDelegate.verticalCenter
            }
            Rectangle {
                width: parent.width -10
                height: 2
                color: "#22333333"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }
            MouseArea{
                id: mouseDelegate
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    if(tipo === 1){
                        pedidofinal1 = pedidofinal1 + produto + "\n"
                        auxvalor1 = valor
                        //console.log(pedidofinal1)
                        if(produto == "Executivo de Galeto"){
                            orderDialog.textProtein = "Escolha a Parte do Galeto"
                            orderDialog.coxaTextButton = "Coxa e Sobre-Coxa"
                            orderDialog.peitoTextButton = "Peito e Asa"

                        }
                        else{

                            orderDialog.textProtein = "Como deseja a Carne?"
                            orderDialog.coxaTextButton = "Bem Passada"
                            orderDialog.peitoTextButton = "Ao Ponto"
                        }

                        orderDialog.open()
                    }
                    else if(tipo == 2){
                        pedidofinal2 = pedidofinal2 + produto
                        auxvalor2 = valor
                        popUpPedido2.open()
                    }

                }
            }
        }
    }


    Rectangle{
        id: recPopUp
        height: parent.height*0.9
        width: parent.width*0.5
        anchors.centerIn: parent

        CustomDialog {
            id: orderDialog
        }

        Rectangle{
            id: recPopUp2
            height: parent.height*0.6
            width: parent.width*0.6
            anchors.centerIn: parent

            Popup{
                id: popUpPedido2
                height: parent.height
                width: parent.width
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                onClosed: {
                    pedidofinal2 = ""
                    auxvalor2 = ""
                }

                Column{
                    id: columnPedido2
                    anchors.centerIn: parent
                    spacing: parent.height*0.07

                    Label{
                        id: labelPedido2
                        text: "Escolha a quantidade"
                        font.family: "Cursive"
                        font.pixelSize: 20
                    }

                    SpinBox{
                        id: spinPedido2
                        focusReason: Qt.MouseFocusReason
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: popUpPedido2.width*0.4
                    }
                    Button {
                        id: finalizarButtonPedido2
                        //anchors.rightMargin: 20
                        //height: paneResultado.height *0.15
                        width: popUpPedido2.width*0.4
                        text: "Finalizar"
                        font.family: "Cursive"
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            if(spinPedido2.value != 0){
                                pedidofinal2 = spinPedido2.value + "x " + pedidofinal2
                                var aux1 = 0
                                var aux2 = 0
                                var i = 0
                                var charr = ""
                                aux1 = parseFloat(auxvalor2)
                                aux2 = parseFloat(spinPedido2.value)
                                aux1 = aux1 * aux2

                                auxvalor2 = aux1.toString()
                                while(i < auxvalor2.length){
                                    charr = auxvalor2.charAt(i)
                                    if(charr == '.'){
                                        auxvalor2 = auxvalor2 + "0"
                                        break
                                    }
                                    i = i + 1
                                }
                                if(i == auxvalor2.length){
                                    auxvalor2 = auxvalor2 + ".00"
                                }

                                listResultado.model.append({textResultado: pedidofinal2, valorResultado: auxvalor2})
                                spinPedido2.value = 0
                                valorFinal = valorFinal + aux1
                                popUpPedido2.close()
                                pedidofinal2 = ""
                            }
                        }
                    }
                }

            }
        }
    }



    Rectangle{
        id: recPedido
        height: parent.height
        width: parent.width
        color: "#88FF9800"//Material.accent

        DropShadow {
            anchors.fill: panePedido
            horizontalOffset: 6
            verticalOffset: 6
            radius: 8.0
            samples: 17
            color: "#55000000"
            source: panePedido
        }
        Rectangle {
            id: panePedido
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 13
            clip: true

            ListView{
                id: listPedido
                spacing: 2
                anchors.fill: parent
                topMargin: 70
                //                anchors.margins: 10
                model: contactModel
                delegate: contactDelegate
                section.property: "chave"
                section.criteria: ViewSection.FullString
                section.delegate: sectionHeading
            }

            TitleBar {
                title: "Clique em uma opção abaixo"
                height: 70
                width: parent.width
                anchors.top: panePedido.top
            }
            Image {
                id: arrow
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                source: "qrc:/images/arrow.png"
                rotation: 180
                opacity: listPedido.atYEnd ? 0 : 0.5
                Behavior on opacity { NumberAnimation { duration: 500 } }
                NumberAnimation { id: anim; target: listPedido; property: "contentY"; easing.type: Easing.OutCubic; duration: 1500 }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        var pos = listPedido.contentY;
                        var destPos;
                        listPedido.positionViewAtIndex(listPedido.count - 1, ListView.Beginning);
                        destPos = listPedido.contentY;
                        anim.from = pos;
                        anim.to = destPos;
                        anim.running = true;
                    }
                }
            }
        }

        DropShadow {
            anchors.fill: paneResultado
            horizontalOffset: 6
            verticalOffset: 6
            radius: 8.0
            samples: 17
            color: "#55000000"
            source: paneResultado
        }
        Rectangle {
            id: paneResultado
            height: parent.height*0.93
            width: parent.width*0.46
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            clip: true
            Material.elevation: 13
            TitleBar {
                title: "Seu pedido final"
                height: 70
                width: parent.width
                anchors.top: paneResultado.top
                z: 1
            }
            Rectangle{
                id: recPaneResultado
                height: parent.height * 0.7
                width: parent.width
                //border.color: "black"
                clip: true

                ListView{
                    id: listResultado
                    anchors.fill: parent
                    topMargin: 80
//                    anchors.margins: 10
                    model: ListModel{}
//                    spacing: 2
                    delegate: Rectangle{
                        //  property int indexx: 0
                        id: recListResultado
                        width: listResultado.width; height: listResultado.height/4
                        clip: true
                        Text {
                            id: textListResultado
                            text: textResultado
                            wrapMode: Text.WordWrap
                            width: recListResultado.width*0.7
                            font.family: "Cursive"
                            font.pixelSize: 20
                            anchors.left: recListResultado.left
                            anchors.leftMargin: 10
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Text {
                            id: textValorListResultado
                            text: '<b>R$: ' + valorResultado + '</b>';
                            anchors.right: trashIcon.left
                            anchors.rightMargin: 20
                            font.family: "Cursive"
                            font.pixelSize: 20
                            anchors.verticalCenter: parent.verticalCenter
                        }
                        Image {
                            id: trashIcon
                            source: "qrc:/images/trash.png"
                            anchors.right: recListResultado.right
                            anchors.rightMargin: recListResultado.width*0.01
                            anchors.verticalCenter: parent.verticalCenter
                            width: 30
                            height: 35
                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    var stop = 1
                                    var indexx = 0
                                    while(stop == 1){
                                        if(listResultado.model.get(indexx).textResultado == textResultado){
                                            stop = 0
                                        }
                                        else{
                                            indexx++
                                        }
                                    }
                                    valorFinal = valorFinal - parseFloat(listResultado.model.get(indexx).valorResultado)
                                    listResultado.model.remove(indexx)
                                }
                            }
                        }
                        Rectangle {
                            width: parent.width-10
                            height: 2
                            color: "#22333333"
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.bottom: parent.bottom
                        }
                    }
                }
            }
            Rectangle{
                id: recPaneFinalizarResultado
                height: paneResultado.height*0.3
                width: paneResultado.width*0.962
                anchors.top: recPaneResultado.bottom
                anchors.topMargin: -10
                anchors.horizontalCenter: parent.horizontalCenter
                //border.color: "black"

                Text {
                    id: textValorFinalResultado
                    //anchors.left: parent.left
                    //anchors.leftMargin: parent.height*0.1
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.2
                    font.family: "Cursive"
                    font.pixelSize: 20
                    text: "<b> Valor Total: " + valorFinal + " R$</b>"

                }

                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    //                    anchors.margins: 10
                    anchors.bottom: parent.bottom
                    spacing: 20

                    Button {
                        id: finalizarButton
                        //                        anchors.bottom: parent.bottom
                        //                        anchors.left: parent.left
                        //anchors.rightMargin: 20
                        height: paneResultado.height *0.15
                        width: paneResultado.width * 0.45
                        text: "Finalizar"
                        font.family: "Cursive"
                        font.bold: true
                        focus: true
                        Material.background: "#4CAF50"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        onClicked: {
                            stackView.push(telaPagamento)
                        }
                    }
                    Button {
                        id: cancelarButton
                        //                        anchors.bottom: parent.bottom
                        //                        anchors.right: parent.right
                        height: paneResultado.height *0.15
                        width: paneResultado.width * 0.45
                        text: "Cancelar"
                        font.family: "Cursive"
                        font.bold: true
                        focus: true
                        Material.background: "#ED3237"
                        Material.foreground: "white"
                        font.pixelSize: 20
                        onClicked: {
                            listResultado.model.clear()
                            valorFinal = 0
                            stackView.pop()

                        }
                    }
                }
            }
        }
    }
}
